#!/usr/bin/env bash
# Launches "The New Worlds" Godot project.
#
# Usage:
#   ./run.sh          # run the game
#   ./run.sh -e        # open the Godot editor instead of running the game
#
# Set GODOT_BIN to override the path to the Godot binary.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GODOT_BIN="${GODOT_BIN:-$HOME/.local/bin/godot}"

if [[ ! -x "$GODOT_BIN" ]]; then
    echo "Godot binary not found or not executable at: $GODOT_BIN" >&2
    echo "Set GODOT_BIN to point at your Godot 4.x executable." >&2
    exit 1
fi

if [[ "${1:-}" == "-e" || "${1:-}" == "--editor" ]]; then
    exec "$GODOT_BIN" --path "$SCRIPT_DIR" --editor
else
    exec "$GODOT_BIN" --path "$SCRIPT_DIR"
fi
