#!/usr/bin/env bash
# Exports "The New Worlds" to a Web (HTML5/WebAssembly) build.
#
# Usage:
#   ./export-web.sh          # release export (default)
#   ./export-web.sh --debug  # debug export
#
# Set GODOT_BIN to override the path to the Godot 4.x binary.
# Requires the "Web" export templates for this Godot version to be
# installed (Editor > Manage Export Templates, or see README.md).
#
# Output goes to build/web/ - serve it with ./serve-web.sh, don't open
# index.html directly (browsers block WASM/threads over file://).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GODOT_BIN="${GODOT_BIN:-$HOME/.local/bin/godot}"

if [[ ! -x "$GODOT_BIN" ]]; then
    echo "Godot binary not found or not executable at: $GODOT_BIN" >&2
    echo "Set GODOT_BIN to point at your Godot 4.x executable." >&2
    exit 1
fi

# VS Code's snap confinement exports XDG_DATA_HOME pointed at its own
# snap-private directory, which would make Godot look for export
# templates there instead of ~/.local/share/godot. Pin it to the real
# location so `godot --export-*` finds templates installed normally
# (Editor > Manage Export Templates).
export XDG_DATA_HOME="$HOME/.local/share"

mkdir -p "$SCRIPT_DIR/build/web"

if [[ "${1:-}" == "--debug" ]]; then
    exec "$GODOT_BIN" --headless --path "$SCRIPT_DIR" --export-debug "Web" "$SCRIPT_DIR/build/web/index.html"
else
    exec "$GODOT_BIN" --headless --path "$SCRIPT_DIR" --export-release "Web" "$SCRIPT_DIR/build/web/index.html"
fi
