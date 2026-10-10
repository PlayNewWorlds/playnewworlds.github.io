<div align="center">

<img src="screenshots/gifs/terra-globe.gif" width="200" alt="Terra turning once, its night side lit by cities">

# New Worlds

**An open-world spaceflight and galaxy simulator with gravity physics, economy,
construction, and population!**

The game juxtaposes a 2D retro style with futuristic sci-fi themes, letting the player
navigate physics to discover, settle, colonise, and develop New Worlds!

### 🚀 **[Play it in your browser](https://playnewworlds.com)** 🚀

*No install, no account. Keyboard, gamepad or phone.*

🎬 **[Watch the trailer](https://computerise.games/#new-worlds)**

<img src="screenshots/worlds-strip.png" alt="Every world in the game, as a row of tiny pixel-art discs">

</div>

![Saturnus side-lit under the tilted camera, a moon beside it and Solus on the horizon](screenshots/tilt-saturnus-solus.png)

---

## <img src="screenshots/icons/ship.png" alt=""> What it is

Most space games move your ship the way a plane moves: point it, push forward, let go
to stop. New Worlds doesn't. Your ship has **mass and momentum**, and the worlds around it
**pull on you**.

So "go to that moon" stops being a direction and becomes a question: *how do I get there
and still have fuel to stop?* Once you've got the hang of it, hopping around the solar system
can be quite profitable. Visit stations, trade at markets, land on worlds, found settlements,
and breathe life into dead planets by giving them air.

The game runs as a web-app in a browser tab, on a desktop, or on a phone. The whole solar
system is drawn in pixels, every one of them placed programmatically, enabling procedural
systems.

<div align="center">
<img src="screenshots/sprite-ship.png" alt="The player's ship"> &nbsp;&nbsp;&nbsp;&nbsp; <img src="screenshots/sprite-station.png" alt="A rendezvous station">
</div>

---

## <img src="screenshots/icons/navigation_computer.png" alt=""> Flight

<div align="center">
<img src="screenshots/gifs/orbit-burn.gif" alt="A Starliner burning out of Terra orbit, its predicted path swinging away from the planet">
</div>

The line ahead of your ship is your predicted path, worked out from everything pulling on
you. It updates as you burn, so you can see an orbit grow, shrink or bend towards a moon
before you commit to it.

- Gravity comes from the actual bodies nearby: the sun, the planet you're near, its moons
- Nothing slows you down except your own engine
- Orbits, transfers, gravity assists and escapes all come from the same physics
- The simulation hands you between planets' spheres of influence as you cross them, so one
  flight can go from low orbit to interplanetary and back

The navigation computer is upgradeable. The stock Scout only draws the trajectory.
Periapsis and apoapsis markers, closest approach to a station, and an apoapsis marker past
the end of the line are upgrades. Flight Assist upgrades the same way: prograde lock, then
retrograde, then normal and anti-normal, then a burn timer that cuts the engine for you.

| | |
|---|---|
| ![An orbit drawn around Terra](screenshots/terra-orbit-trajectory.png) | ![A transfer arc around Solus](screenshots/interplanetary-transfer.png) |
| A predicted orbit around Terra | An interplanetary transfer around Solus |
| ![The Scout burning over Terra's dawn line](screenshots/terra-dawn-burn.png) | ![The chase camera behind the Scout over Terra](screenshots/tilt-terra-chase.png) |
| The Scout over Terra, top-down | The same ship under the chase camera |

---

## <img src="screenshots/icons/world.png" alt=""> The tilted camera

<div align="center">
<img src="screenshots/tilt-hud-chase.png" alt="The game screen under the tilted chase camera, Terra below">
</div>

You can tilt the camera away from top-down. Worlds become lit spheres with clouds and a
day/night line, Saturnus's rings sit at their real angle, and ships and stations are
drawn as voxel models built from their sprites. The simulation and controls don't change.

| | |
|---|---|
| ![Saturnus and its rings edge-on](screenshots/tilt-saturnus-side.png) | ![Over Terra, Lune beyond](screenshots/tilt-terra-lune.png) |
| Saturnus, edge-on | Terra, with Lune behind |
| ![Terra Greatport close up](screenshots/tilt-greatport-close.png) | ![Burning over icy Glacius](screenshots/tilt-glacius-burn.png) |
| Terra Greatport | A burn over Glacius |

---

## <img src="screenshots/icons/landing.png" alt=""> Landing and launching

<div align="center">
<img src="screenshots/gifs/landing.gif" alt="A powered descent to Ares">
</div>

To land you have to slow down below a speed limit set by each world's mass and radius.
Come in too fast and you crash.

Once you're slow enough, you get a map of the world's surface (land, ocean and ice, from
the same terrain data the planet is drawn with) with its settlements marked. You pick
where to land.

A Scout with a full tank can't climb out of a planet's gravity on its own engine, so
leaving a world means buying a **booster** launch from a launch facility. You choose the
orbit it drops you in, from a suborbital hop up to a Lune injection.

<div align="center">
<img src="screenshots/gifs/booster-launch.gif" alt="Picking a target orbit off the booster ladder and launching from Terra">
</div>

| | |
|---|---|
| ![Parachuting down through Terra's atmosphere](screenshots/terra-parachute-descent.png) | ![Lifting off Terra on boosters](screenshots/terra-booster-launch.png) |
| Parachutes on worlds with an atmosphere | A booster launch from Terra |
| ![The landing site map](screenshots/panel-landing-map.png) | ![Landed, with the launch options open](screenshots/panel-landed.png) |
| Choosing a landing site | Landed |
| ![The booster ladder](screenshots/panel-booster-ladder.png) | ![The Scout, mid-burn over Terra](screenshots/hud-flight-terra.png) |
| Booster launch options | Back in orbit |
| ![Parachutes over Ares](screenshots/tilt-ares-parachute.png) | ![A powered descent to Aquara](screenshots/tilt-aquara-descent.png) |
| Parachutes over Ares | A powered descent to Aquara |

Crashing looks like this 💥

![A crash into Lune](screenshots/lune-crash-fireball.png)

---

## <img src="screenshots/icons/trade.png" alt=""> Trade

<img src="screenshots/panel-trade.png" alt="The trade panel aboard Terra Greatport">

There are about twenty stations in the home system, each with its own market and prices.
Twelve commodities are traded: Fuel, Ore, Alloys, Machinery, Electronics, Food, Gases,
Ice, Volatiles, Biomass, Medicine and Samples. Prices come from supply and demand. Each
market produces and consumes goods and ships its surplus to places that are short, at a
rate set by its faction. You make money buying where something is produced and selling
where it's needed.

Also in the game:

- <img src="screenshots/icons/clipboard.png" width="16" alt=""> **Missions**: freight and passenger jobs with a payout and a deadline
- <img src="screenshots/icons/factions.png" width="16" alt=""> **Factions**: the Terra Concord, the Ares Mining Guild, the Outer Rim Cooperative and the Venera Compact, who control territory and remember how you've treated them
- <img src="screenshots/icons/crew.png" width="16" alt=""> **Crew**: fourteen roles from Deckhand to Captain, hired at stations, each needing a berth and a wage
- <img src="screenshots/icons/credit.png" width="16" alt=""> **Credits**: a ledger of everything you've earned and spent

| | |
|---|---|
| ![The markets table](screenshots/panel-markets.png) | ![The missions board](screenshots/panel-missions.png) |
| Markets | Missions |
| ![The factions panel](screenshots/panel-factions.png) | ![Docked at Terra Greatport](screenshots/hud-docked-ivory.png) |
| Factions | Docked at Terra Greatport |

---

## <img src="screenshots/icons/shipyard.png" alt=""> Ships

<img src="screenshots/panel-shipyard.png" alt="The shipyard, with the six hull classes for sale">

| Hull | Description |
|---|---|
| **Drone** | Unmanned 3 kt pod for short hops around asteroids and small moons |
| **Scout** | The starting ship: one pilot, one hold |
| **Freighter** | Twice the size of a Scout, with twice the cargo and a small crew |
| **Starliner** | Four times the size, with berths for eighty passengers |
| **Carrier** | Eight times the size, with a hangar for Scouts |
| **Colony** | Hundreds of berths and little cargo space, for settling worlds |

You buy ships with credits. You can own several, leave them parked at stations, and
switch between them. There are twelve upgrade tracks: thruster power and efficiency,
tanks, hold, cabins, life support, landing gear, launch thrusters, bridge, hangar, and the
two navigation upgrades above.

Most upgrades add mass, which costs you delta-v. Thruster Efficiency is the main one that
increases your range.

| | |
|---|---|
| ![The ship panel](screenshots/panel-ship.png) | ![A Starliner under full thrust](screenshots/starliner-over-terra.png) |
| The ship panel | A Starliner over Terra |
| ![A Colony ship leaving Terra](screenshots/colony-ship-departure.png) | ![The fleet parked at Terra Greatport](screenshots/ivory-station-fleet.png) |
| A Colony ship leaving Terra | Ships parked at Terra Greatport |
| ![A Freighter burning past Ares](screenshots/tilt-freighter-ares.png) | ![A Carrier burning over Lune](screenshots/tilt-carrier-lune.png) |
| A Freighter passing Ares | A Carrier over Lune |

---

## <img src="screenshots/icons/terraform.png" alt=""> Settlements and terraforming

<img src="screenshots/panel-world-info.png" alt="Terra's world page, with its terrain map and settlements">

You can found a settlement on an empty world. If you keep it supplied, it grows through
ten levels from outpost to ecumenopolis, and each level needs more goods shipped in.

You can also terraform worlds. Each world tracks its atmosphere gas by gas, plus its water,
buried volatiles, toxins, radiation and biosphere. A climate model turns that into a
surface temperature, using the world's orbit, how reflective its surface is, and its
greenhouse effect.

For example, doubling Ares's CO₂ warms it a few degrees, and a full bar of it brings it up
to freezing. As it warms, water vapour rises and the ice sheets shrink, and the surface
map changes to match, because the terrain is calculated from water and temperature.

| | |
|---|---|
| ![The construction menu at a station](screenshots/panel-construction.png) | ![Braking over toxic Venera](screenshots/venera-toxic-approach.png) |
| Station construction | Venera, which is toxic |

---

## <img src="screenshots/icons/world.png" alt=""> Worlds

<div align="center">
<img src="screenshots/gifs/worlds.gif" width="320" alt="Each world in turn: Terra, Lune, Venera, Ares, Glacius, Rheda, Saturnus and on to the other systems">
</div>

There are thirty-nine worlds around four stars in three systems.

The home system is **Solus**: Terra and its moon Lune, Venera, Ares, icy Glacius, ringed
Saturnus and others. It has people, stations and markets.

**Aurea** is a binary system. The yellow star Aurea and the red dwarf Rubra orbit each
other, and six worlds orbit the pair. **Candor** is the frontier. It has no population,
stations or markets. A couple of its worlds can be lived on and the rest are hostile.

Other systems show up as stars in the sky. You travel to one by jumping to it.

| | |
|---|---|
| ![Burning past Saturnus's rings](screenshots/saturnus-rings.png) | ![The Aurea binary system](screenshots/aurea-binary-system.png) |
| Saturnus | The Aurea system |
| ![The Candor system](screenshots/candor-frontier-system.png) | ![Vitrea, a toxic world](screenshots/vitrea-toxic-world.png) |
| The Candor system | Vitrea, a toxic world |
| ![Over Serena, the Aurea binary's two suns in frame](screenshots/tilt-serena-chase.png) | ![Over Silva, Fulgor beyond](screenshots/tilt-silva-over-fulgor.png) |
| Serena, with both of Aurea's suns | Silva, with Fulgor behind |
| ![Caeruleus and its moons' orbits](screenshots/tilt-caeruleus-moons.png) | ![Scoria, Nimbus beyond](screenshots/tilt-scoria-over-nimbus.png) |
| Caeruleus and its moons | Scoria, with Nimbus behind |

<div align="center">
<img src="screenshots/gifs/rings.gif" width="520" alt="Saturnus turning, its rings tilted towards the camera">
</div>

---

## <img src="screenshots/icons/gear.png" alt=""> Controls

🎮 The game supports keyboard and mouse, gamepad and touch. You can play the whole game
on a gamepad.

| Input | Action |
|---|---|
| **W A S D** / arrows / left stick | Thrust in the direction you're pointing |
| **Mouse wheel** / triggers / pinch | Zoom |
| **Click** a body | Focus the camera on it (double-click opens its page) |
| **Tab** / bumpers | Cycle camera targets: your ships, moons, planets, stations |
| **1**–**5** | Time warp |
| **L** | Lock to prograde/retrograde (needs Flight Assist) |
| **H** | Hide the HUD |
| **Space** | Pause |

There's a tutorial covering circularising, transfers and arrivals, and a free-roam mode.
Saves are stored locally, with optional cloud saves if you want to play on more than one
device.

---

## <img src="screenshots/icons/music_note.png" alt=""> How it's made

Everything except the engine and three fonts was made for this project, mostly by
scripts.

- **Sprites** are generated in Python: ships, stations, UI icons, stars and the worlds.
  World surfaces come from procedural height maps, and Terra's night side shows city
  lights where the game's population actually lives.
- **Sound effects** are synthesised.
- **Music**: nineteen generated tracks.
- **Engine**: [Godot 4](https://godotengine.org) with GDScript and the Compatibility
  renderer, so it runs in a browser and on mid-range phones.

This repository holds the published build and is replaced on every release. The source
code isn't here.

---

## <img src="screenshots/icons/warp_faster.png" alt=""> State of play

The game is live in an open Pre-Alpha now and **needs playtesters!** Game systems are
changing daily and the game is in an unstable development phase. Despite this, save games
are version agnostic, so you can keep playing your saved runs.

🚀 **[playnewworlds.com](https://playnewworlds.com)**

<sub>[Privacy notice](https://playnewworlds.com/privacy.html)</sub>

<div align="center">
<img src="screenshots/worlds-strip.png" alt="">
</div>
