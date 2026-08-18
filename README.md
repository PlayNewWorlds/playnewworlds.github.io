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
