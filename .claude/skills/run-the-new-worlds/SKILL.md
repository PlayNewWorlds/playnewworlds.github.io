---
name: run-the-new-worlds
description: Build, run, and screenshot The New Worlds (a Godot 4 2D orbital rocket sim). Use when asked to launch the game, start the Godot project, take a screenshot of it, or confirm a gameplay change is visible in the running app.
---

Godot 4 project (GDScript, `res://project.godot`), driven by launching
the real Godot binary against the host's X/XWayland display and
grabbing the game window with `xwd`, then converting to PNG with a
small stdlib-only Python script (this container has no
imagemagick/scrot/gnome-screenshot). Use
`.claude/skills/run-the-new-worlds/driver.sh` — don't hand-roll the
launch, the window is easy to miss without the polling it does.

All paths below are relative to the repo root.

## Prerequisites

```bash
sudo apt-get update
sudo apt-get install -y x11-apps x11-utils   # xwd, xwininfo
```

Godot 4.3 binary at `~/.local/bin/godot` (a real install, not apt —
this repo doesn't vendor one; see `run.sh` for the same convention).
Override with `GODOT_BIN` if it lives elsewhere.

A running X server / XWayland reachable via `DISPLAY` (defaults to
`:0`). There is no headless (`Xvfb`) path for this project yet — see
Gotchas.

## Build

No build step — GDScript runs directly from source.

## Run (agent path)

```bash
.claude/skills/run-the-new-worlds/driver.sh screenshot [OUT_PNG] [WAIT_SECONDS]
```

Launches the game, polls `xwininfo` every 0.5s (up to `WAIT_SECONDS`,
default 8) until the window appears, captures it with `xwd -id`,
converts to PNG, kills the game, and prints the PNG path on stdout.
Defaults `OUT_PNG` to `/tmp/the-new-worlds-screenshot.png`. Godot's own
stdout/stderr land in `/tmp/godot-run.log` if something goes wrong.

```bash
.claude/skills/run-the-new-worlds/driver.sh launch
```

Launches the game and leaves it running — prints `pid=` and `winid=`
once the window is found. Use this if you need the process alive
longer than a single screenshot; `kill <pid>` when done. There's
currently no input-injection command (no `xdotool` in this container —
see Gotchas), so this driver only launches and observes; it doesn't
send keystrokes into the game yet.

## Run (human path)

```bash
./run.sh          # run the game
./run.sh -e        # open the Godot editor instead
```

Opens a real window — useless in a headless session, fine on a
desktop with a display.

---

## Gotchas

- **`xwd -root` fails under XWayland** — `X Error ... BadMatch ...
  X_GetImage` — the root window has no readable backing pixmap when
  the session is actually Wayland (`XDG_SESSION_TYPE=wayland`) with
  XWayland just handling X11 clients. Target the game's own window id
  instead (`xwininfo -root -tree`, filter for the window title, take
  the child with class `Godot_Engine`, not the `mutter-x11-frames`
  parent) — `driver.sh` does this already.
- **A `python3` on PATH may be missing `zlib`** — this container has
  two: `/usr/local/bin/python3` (no `zlib` module, PNG encoding fails)
  and `/usr/bin/python3` (has it). `driver.sh` calls
  `xwd2png.py` with `/usr/bin/python3` explicitly — don't switch that
  to a bare `python3`.
- **Backgrounding the launch with a trailing `&` inside a one-shot
  shell kills it early** — if the wrapping shell exits right after
  backgrounding (e.g. `godot ... & echo done`), the child gets SIGHUP
  and Godot exits almost immediately with code 0 and no error, which
  looks like a successful clean run but isn't — no window ever
  appears. Keep the launching shell alive for the whole capture (as
  `driver.sh` does with its `trap ... EXIT`), don't fire-and-forget.
- **No `xdotool` in this container** and no working `pip`/`venv`
  either (`pip install` hits PEP 668's externally-managed-environment
  guard; `python3 -m venv` fails — `python3.12-venv` isn't installed,
  and installing it needs `sudo`, which needs a password this session
  doesn't have). That means no key-input driving yet, only
  launch-and-screenshot. If a future task needs to simulate gameplay
  input, installing `xdotool` (`sudo apt-get install -y xdotool`) is
  the natural next step.
- **No `run/main_scene` shows up on a shallow `grep -A2
  "\[application\]"`** — it's further down the section, not right
  after the header. `grep -n "run/main_scene"` finds it
  (`res://game.tscn`) directly; don't conclude it's unset from a
  truncated grep.

## Troubleshooting

- **Screenshot is blank / driver exits "window not found within Ns"**:
  check `/tmp/godot-run.log` for a Godot crash. If the log just shows
  the engine banner and stops, something upstream killed the process
  early (see the backgrounding gotcha above) — check the process
  wasn't reaped before the capture.
