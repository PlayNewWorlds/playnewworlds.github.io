#!/usr/bin/env bash
# Driver for "The New Worlds" — launches the Godot game against a real
# X/XWayland display, finds its window, and grabs a screenshot.
#
# Usage:
#   driver.sh screenshot [OUT_PNG] [WAIT_SECONDS]
#     Launch, wait for the window, capture it, convert to PNG, kill the
#     game, print the PNG path. This is the main entry point.
#
#   driver.sh launch
#     Launch the game in the background and print its PID and window id
#     (once found). Leaves it running — use `kill <pid>` when done.
#
# Env overrides:
#   GODOT_BIN   path to the Godot 4.x binary (default: ~/.local/bin/godot)
#   DISPLAY     X display to use (default: :0 — this project has no
#               working headless/Xvfb path yet, see SKILL.md Gotchas)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/../../.." && pwd)"
GODOT_BIN="${GODOT_BIN:-$HOME/.local/bin/godot}"
DISPLAY="${DISPLAY:-:0}"
export DISPLAY

if [[ ! -x "$GODOT_BIN" ]]; then
    echo "Godot binary not found or not executable at: $GODOT_BIN" >&2
    echo "Set GODOT_BIN to point at your Godot 4.x executable." >&2
    exit 1
fi

WINDOW_TITLE="$(grep -oP '(?<=config/name=")[^"]*' "$PROJECT_DIR/project.godot")"

wait_for_window() {
    # Polls xwininfo (not a fixed sleep) until the game's window shows up,
    # or WAIT_SECONDS elapses. Prints the window id on stdout.
    local wait_seconds="$1" waited=0
    while (( waited < wait_seconds * 2 )); do
        local id
        id="$(xwininfo -root -tree 2>/dev/null \
            | grep -F "\"$WINDOW_TITLE" \
            | grep -v mutter-x11-frames \
            | head -1 \
            | awk '{print $1}')" || true
        if [[ -n "$id" ]]; then
            echo "$id"
            return 0
        fi
        sleep 0.5
        waited=$((waited + 1))
    done
    return 1
}

cmd="${1:-screenshot}"

case "$cmd" in
    launch)
        cd "$PROJECT_DIR"
        "$GODOT_BIN" --path "$PROJECT_DIR" >/tmp/godot-run.log 2>&1 &
        pid=$!
        echo "pid=$pid"
        if winid=$(wait_for_window 10); then
            echo "winid=$winid"
        else
            echo "window not found within 10s (see /tmp/godot-run.log)" >&2
            exit 1
        fi
        ;;

    screenshot)
        out_png="${2:-/tmp/the-new-worlds-screenshot.png}"
        wait_seconds="${3:-8}"

        cd "$PROJECT_DIR"
        "$GODOT_BIN" --path "$PROJECT_DIR" >/tmp/godot-run.log 2>&1 &
        pid=$!
        trap 'kill "$pid" 2>/dev/null; sleep 0.3; kill -9 "$pid" 2>/dev/null || true' EXIT

        if ! winid=$(wait_for_window "$wait_seconds"); then
            echo "window not found within ${wait_seconds}s (see /tmp/godot-run.log)" >&2
            exit 1
        fi

        xwd_file="$(mktemp --suffix=.xwd)"
        # Must target the window id, not -root: under XWayland the root
        # window has no readable backing pixmap and XGetImage fails with
        # BadMatch. See SKILL.md Gotchas.
        xwd -id "$winid" -out "$xwd_file"

        # Use the system python3 explicitly: some environments have a
        # second python3 earlier on PATH that's missing the zlib module.
        /usr/bin/python3 "$SCRIPT_DIR/xwd2png.py" "$xwd_file" "$out_png"
        rm -f "$xwd_file"

        echo "$out_png"
        ;;

    *)
        echo "Usage: $0 {screenshot [OUT_PNG] [WAIT_SECONDS]|launch}" >&2
        exit 1
        ;;
esac
