#!/usr/bin/env bash
# Runs the GUT (Godot Unit Test) suite headlessly.
#
# Fetches GUT into addons/gut on first run (gitignored - CI does the same).
# Set GODOT_BIN to override the path to the Godot 4.x binary, or
# GUT_VERSION to override the GUT release tag to install.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GODOT_BIN="${GODOT_BIN:-$HOME/.local/bin/godot}"
GUT_VERSION="${GUT_VERSION:-v9.3.0}"

if [[ ! -x "$GODOT_BIN" ]]; then
    echo "Godot binary not found or not executable at: $GODOT_BIN" >&2
    echo "Set GODOT_BIN to point at your Godot 4.x executable." >&2
    exit 1
fi

if [[ ! -d "$SCRIPT_DIR/addons/gut" ]]; then
    echo "Fetching GUT $GUT_VERSION..."
    tmp_dir="$(mktemp -d)"
    trap 'rm -rf "$tmp_dir"' EXIT
    git clone --depth 1 --branch "$GUT_VERSION" https://github.com/bitwes/Gut.git "$tmp_dir"
    mkdir -p "$SCRIPT_DIR/addons"
    cp -r "$tmp_dir/addons/gut" "$SCRIPT_DIR/addons/gut"
fi

"$GODOT_BIN" --headless --path "$SCRIPT_DIR" --import
exec "$GODOT_BIN" --headless --path "$SCRIPT_DIR" \
    -s addons/gut/gut_cmdln.gd -gexit
