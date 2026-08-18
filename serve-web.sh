#!/usr/bin/env bash
# Serves the Web export (build/web/) over HTTP with the cross-origin
# isolation headers Godot's WASM build needs (SharedArrayBuffer requires
# COOP/COEP - a plain `python3 -m http.server` won't set these, and
# opening index.html directly via file:// won't work at all).
#
# Usage:
#   ./export-web.sh     # build first, if you haven't
#   ./serve-web.sh       # serve on http://localhost:8060
#   ./serve-web.sh 9000   # or a different port

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PORT="${1:-8060}"

if [[ ! -f "$SCRIPT_DIR/build/web/index.html" ]]; then
    echo "No build at build/web/index.html - run ./export-web.sh first." >&2
    exit 1
fi

exec python3 - "$SCRIPT_DIR/build/web" "$PORT" <<'EOF'
import functools
import http.server
import sys

directory, port = sys.argv[1], int(sys.argv[2])

class CrossOriginIsolatedHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cross-Origin-Opener-Policy", "same-origin")
        self.send_header("Cross-Origin-Embedder-Policy", "require-corp")
        super().end_headers()

handler = functools.partial(CrossOriginIsolatedHandler, directory=directory)
http.server.ThreadingHTTPServer(("0.0.0.0", port), handler).serve_forever()
EOF
