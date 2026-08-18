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
and runs the suite headlessly. [.gutconfig.json](.gutconfig.json)
points GUT at `test/`.

### Running tests in VS Code

Install the recommended extensions
([Godot Tools](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)
and [GUT](https://marketplace.visualstudio.com/items?itemName=bitwes.gut-extension) —
VS Code should prompt for these; `.vscode/extensions.json` lists them
but isn't committed since `.vscode/` is gitignored here), install GUT
locally once (`./test-web.sh`, or via Godot's AssetLib), and set
`godotTools.editorPath.godot4` in `.vscode/settings.json` to your
Godot 4 binary. Then use the Command Palette: **GUT: Run All**, **GUT:
Run Current Script**, or **GUT: Run at Cursor** (also available with
the debugger, for breakpoints). There's no native VS Code Test
Explorer integration for GUT — these are Command Palette actions, not
a Testing-sidebar provider.

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
builds the Web export on every push and pull request. On pushes to
`master`, it also publishes `build/web/` to
[PlayNewWorlds/playnewworlds.github.io](https://github.com/PlayNewWorlds/playnewworlds.github.io),
which is a public repo dedicated to hosting the built site via GitHub
Pages — this repo (the source) stays private, since GitHub Pages from
a private repo requires a paid plan.

That repo's entire contents get replaced by each publish (it's a
generated artifact; nothing there is hand-maintained), and its Pages
source is set to deploy from `master`.

### One-time setup: `PAGES_DEPLOY_TOKEN`

The publish step pushes to the Pages repo using a fine-grained PAT
stored as a secret here, since the two repos are separate and the
default `GITHUB_TOKEN` can't write across repos:

1. Create a fine-grained PAT at
   [github.com/settings/personal-access-tokens/new](https://github.com/settings/personal-access-tokens/new):
   - Resource owner: `PlayNewWorlds`
   - Repository access: only `playnewworlds.github.io`
   - Permissions: Contents → Read and write
2. `gh secret set PAGES_DEPLOY_TOKEN --repo PlayNewWorlds/newworlds`
   and paste the token when prompted.
