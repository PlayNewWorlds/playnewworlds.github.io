# The New Worlds

A simple 2D orbital simulation where you pilot a rocket, using
[`CharacterBody2D`](https://docs.godotengine.org/en/latest/classes/class_characterbody2d.html)
and Newtonian-style gravity to fly between worlds.

Language: GDScript

Renderer: Compatibility

## Running

```bash
./run.sh          # run the game in the Godot editor's player
./run.sh -e        # open the Godot editor
```

## Running in a browser

Export to a Web (HTML5/WebAssembly) build, then serve it — opening
`index.html` directly via `file://` won't work.

```bash
./export-web.sh          # builds build/web/
./serve-web.sh            # serves it at http://localhost:8060
```

Requires the Godot "Web" export templates for the project's Godot
version (Editor > Manage Export Templates). `serve-web.sh` sets the
COOP/COEP headers the WASM build needs; a plain static file server
generally won't.

## Testing

Unit tests use [GUT](https://github.com/bitwes/Gut) and live under
`test/`.

```bash
./test-web.sh
```

Fetches GUT into `addons/gut` on first run (gitignored, not vendored)
and runs the suite headlessly.

## Linting

GDScript is linted with [gdtoolkit](https://github.com/Scony/godot-gdscript-toolkit)'s
`gdlint`/`gdformat`:

```bash
pip install "gdtoolkit==4.*"
gdlint .              # check style
gdformat .             # auto-fix formatting
```

## CI/CD

[.github/workflows/ci.yml](.github/workflows/ci.yml) lints, tests, and
builds the Web export on every push and pull request, and publishes
`build/web/` to GitHub Pages on pushes to `master`.

Publishing requires Pages to be set to deploy from GitHub Actions
(Settings > Pages > Build and deployment > Source), a one-time repo
setting.
