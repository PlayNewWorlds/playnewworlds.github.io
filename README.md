<div align="center">

<img src="screenshots/gifs/terra-globe.gif" width="200" alt="Terra turning once, its night side lit by cities">

# New Worlds

**An open-world spaceflight and galaxy simulator with gravity physics, economy,
construction, and population!**

The game juxtaposes a 2D retro style with futuristic sci-fi themes, letting the player
navigate physics to discover, settle, colonise, and develop New Worlds!

### 🚀 **[Play it in your browser](https://playnewworlds.com)** 🚀

*No install, no account. Keyboard, gamepad or phone.*

<img src="screenshots/worlds-strip.png" alt="Every world in the game, as a row of tiny pixel-art discs">

</div>

![The Scout burning over Terra's dawn line](screenshots/terra-dawn-burn.png)

---

## <img src="screenshots/icons/ship.png" alt=""> What it is

Most space games move your ship the way a plane moves: point it, push forward, let go
to stop. New Worlds doesn't. Your ship has **mass and momentum**, the worlds around it
**pull on you**, 

So "go to that moon" stops being a direction and becomes a question: *how do I get there
and still have fuel to stop?* Once you've got the hang of it, hopping around the solar system
can be quite  profitable. Visit stations, trade at markets, land on worlds, found settlements,
and breathe life into dead planets by giving them air.

The game runs as a web-app in a browser tab, on a desktop, or on a phone. The whole solar
system is drawn in pixels, every one of them placed programatically, enabling procedural
systems.

<div align="center">
<img src="screenshots/sprite-ship.png" alt="The player's ship"> &nbsp;&nbsp;&nbsp;&nbsp; <img src="screenshots/sprite-station.png" alt="A rendezvous station">
</div>

---

## <img src="screenshots/icons/navigation_computer.png" alt=""> Flight is the whole game

<div align="center">
<img src="screenshots/gifs/orbit-burn.gif" alt="Burning prograde and watching the predicted orbit swell out past the ring">
</div>

The green line is your future: where the sim says you'll be, given everything currently
pulling on you. Burn, and it moves *while you watch it*. Raise one side of your orbit,
drop the other, thread it past a moon, or find you've drawn yourself a very confident
line straight into a mountain.

- **Real gravity, summed from real bodies** — the sun, the planet you're near, its moons
- **Momentum is yours to keep, and yours to get rid of** — nothing brakes for you
- **Orbits, transfers, gravity assists and escape trajectories** all fall out of the same rules
- **Sphere-of-influence scopes** hand you off between bodies as you cross them, so a single
  flight can run from a low orbit to interplanetary and back down again

And the line itself is **a thing you buy**. The stock Scout's navigation computer draws the
trajectory and nothing else; periapsis and apoapsis markers, closest-approach-to-station,
and a predicted apoapsis beyond the end of the line are upgrades you fit later. Flight
Assist is the same ladder — prograde lock first, then retrograde, then normal and
anti-normal, then a burn timer that cuts the engine for you.

Early on you fly by eye. That is not a bug.

| | |
|---|---|
| ![An orbit drawn around Terra](screenshots/terra-orbit-trajectory.png) | ![A transfer arc around Solus](screenshots/interplanetary-transfer.png) |
| The predicted path, drawn to the horizon | An interplanetary transfer, seen from the star |

---

## <img src="screenshots/icons/landing.png" alt=""> Getting down, and back up

<div align="center">
<img src="screenshots/gifs/landing.gif" alt="Choosing a landing site on Terra's terrain map, then riding the descent down">
</div>

Landing isn't a cutscene. You have to actually arrive slowly — under a fraction of the
local orbital speed — and every world sets its own limit from its own mass and radius.
Come in hot at Lune and you'll be picking hull out of the regolith.

When you're inside the band, the world opens as **a real map of itself**: land, ocean and
ice, sampled live from the same terrain the planet's sprite is painted from, with the
settlements already on it marked. Pick a spot. Land there.

Getting off again is its own problem, because a full tank of Scout doesn't have the
thrust-to-weight to climb out of a gravity well on its own. That's what **boosters** are
for — buy a ride up from a launch facility and pick which orbit you want to be dropped
into, from a suborbital hop to a Lune injection.

<div align="center">
<img src="screenshots/gifs/booster-launch.gif" alt="Picking a target orbit off the booster ladder and riding it up from Terra">
</div>

| | |
|---|---|
| ![Parachuting down through Terra's atmosphere](screenshots/terra-parachute-descent.png) | ![Lifting off Terra on boosters](screenshots/terra-booster-launch.png) |
| Parachutes, where there's air to catch | Boosters, where there isn't thrust enough |
| ![The landing site map](screenshots/panel-landing-map.png) | ![Landed, with the launch ladder open](screenshots/panel-landed.png) |
| Every landable world has a real surface | Landed, and deciding how to leave |
| ![The booster ladder](screenshots/panel-booster-ladder.png) | ![The Scout, mid-burn over Terra](screenshots/hud-flight-terra.png) |
| Buying a ride up, one orbit at a time | In orbit again, going somewhere else |

And when it goes wrong, it goes wrong properly 💥

![A crash into Lune](screenshots/lune-crash-fireball.png)

---

## <img src="screenshots/icons/trade.png" alt=""> A solar system with an economy in it

<img src="screenshots/panel-trade.png" alt="The trade panel aboard Ivory Station">

Twenty-odd stations orbit the home system, each with its own market, its own prices, and
its own idea of what it's short of. Twelve commodities move between them — Fuel, Ore,
Alloys, Machinery, Electronics, Food, Gases, Ice, Volatiles, Biomass, Medicine and
Samples — and the prices are real supply and demand, not a lookup table: every market
produces, consumes, and ships its surplus toward whoever is short, at a rate its
faction's politics decides. Buy where a world digs it; sell where a world needs it.

Around that sits the rest of it:

- <img src="screenshots/icons/clipboard.png" width="16" alt=""> **Missions** — freight and passengers, from somewhere to somewhere, with a payout and a deadline-shaped risk
- <img src="screenshots/icons/factions.png" width="16" alt=""> **Factions** — the Terra Concord, the Ares Mining Guild, the Outer Rim Cooperative, the Venera Compact: who rules what, who likes you, and what they do about it
- <img src="screenshots/icons/crew.png" width="16" alt=""> **Crew** — fourteen roles from Deckhand to Captain, hired at stations, each one a berth, a wage and a bonus
- <img src="screenshots/icons/credit.png" width="16" alt=""> **Credits** — one ledger, and every line in it names the button that spent it

| | |
|---|---|
| ![The markets table](screenshots/panel-markets.png) | ![The missions board](screenshots/panel-missions.png) |
| Every market, every shortage, at a glance | Contracts, tracked on the map |
| ![The factions panel](screenshots/panel-factions.png) | ![Docked at Ivory Station](screenshots/hud-docked-ivory.png) |
| Who holds what, and how they feel about you | Docked, with the airlock out |

---

## <img src="screenshots/icons/shipyard.png" alt=""> Six hulls, and a fleet to put them in

<img src="screenshots/panel-shipyard.png" alt="The shipyard, with the six hull classes for sale">

| Hull | What it is |
|---|---|
| **Drone** | Unmanned 3 kt pod for hops around asteroids and small moons |
| **Scout** | The stock hull — one pilot, one hold, goes anywhere |
| **Freighter** | Twice the ship: twice the freight, and a watch to run it |
| **Starliner** | Four times the ship, with berths for eighty passengers |
| **Carrier** | Eight times the ship, and a hangar that carries Scouts |
| **Colony** | A world in transit — hundreds of berths, little freight |

Ships are **bought, not unlocked**. You can own several, park them where you like, and
walk between them: board a Freighter, leave your Scout at the station, come back for it
later. Twelve upgrade tracks fit out whichever one you're flying — thruster power and
efficiency, tanks, hold, cabins, life support, landing gear, launch thrusters, bridge,
hangar, and the two navigation ladders above.

Almost every upgrade **costs you delta-v**, because every level adds hull mass to carry.
Thruster Efficiency is the only one that clearly buys more range. That trade-off is the
ship-building game.

| | |
|---|---|
| ![The ship panel](screenshots/panel-ship.png) | ![A Starliner under full thrust](screenshots/starliner-over-terra.png) |
| Your ship, section by section | A Starliner, hauling eighty people |
| ![A Colony ship leaving Terra](screenshots/colony-ship-departure.png) | ![The fleet parked at Ivory Station](screenshots/ivory-station-fleet.png) |
| A Colony ship departing | A fleet, parked |

---

## <img src="screenshots/icons/terraform.png" alt=""> Settle it. Then change the weather.

<img src="screenshots/panel-world-info.png" alt="Terra's world page, with its live terrain map and settlements">

Land somewhere nobody lives and you can found a settlement on it. Feed it, and it climbs
a ladder of ten — outpost, base, township, town, colony, city, metropolis, megalopolis,
megaregion, ecumenopolis — each one wanting more of what only a ship can bring.

Above that sits **terraforming**, and it is not a progress bar. Each world carries its
atmosphere as partial pressures per molecule, a water inventory, buried volatiles, toxins,
radioactivity and a biosphere fraction, and a real energy-balance climate model turns all
of that into a temperature: insolation from its actual orbit, albedo from how much of it
is ocean and ice and vegetation, a greenhouse that saturates so Venera stays finite.

Double Ares's CO₂ and it warms a few degrees. Give it a whole bar and it reaches freezing.
Then the water vapour follows the warmth, and the ice sheets start losing their brightness,
and the map you land on **redraws itself** — because the terrain is a function of water and
temperature, not a painting.

| | |
|---|---|
| ![The construction menu at a station](screenshots/panel-construction.png) | ![Braking over toxic Venera](screenshots/venera-toxic-approach.png) |
| Building out a station, level by level | Venera: toxic, and a long way from habitable |

---

## <img src="screenshots/icons/world.png" alt=""> Thirty-nine worlds, four stars, three systems

<div align="center">
<img src="screenshots/gifs/worlds.gif" width="320" alt="Every world in turn: Terra, Lune, Venera, Ares, Glacius, Rhea, Saturnus and on out to the frontier">
</div>

Home is **Solus**: Terra and its moon Lune, Venera under its toxic lid, Ares and its
mining guild, the ice of Glacius, ringed Saturnus and everything between. It's settled,
priced, crewed and busy.

Then there's everywhere else. **Aurea** is a close binary — two stars, gold and a red
dwarf called Rubra, sharing one barycentre and six circumbinary worlds between them.
**Candor** is the frontier, and the frontier is *empty*: no population, no stations, no
markets, nothing to buy and nobody to sell to. A couple of its worlds are survivable.
The rest are hostile or flatly impossible, and graded that way on purpose.

You get there by jumping to a star you can see in your own sky — every other system is a
real beacon in the skybox, named when you zoom out far enough to read it.

| | |
|---|---|
| ![Burning past Saturnus's rings](screenshots/saturnus-rings.png) | ![The Aurea binary system](screenshots/aurea-binary-system.png) |
| Saturnus | Aurea, and its red dwarf |
| ![The Candor system](screenshots/candor-frontier-system.png) | ![Vitrea, a toxic world](screenshots/vitrea-toxic-world.png) |
| Candor, the frontier | Vitrea, which does not want you |

<div align="center">
<img src="screenshots/gifs/rings.gif" width="520" alt="The ship burning its way around Saturnus's rings">
</div>

---

## <img src="screenshots/icons/gear.png" alt=""> Playing it

🎮 Keyboard, mouse, gamepad and touch are all first-class — the whole game is playable on a
pad alone.

| Input | Does |
|---|---|
| **W A S D** / arrows / left stick | Thrust. Where you're pointing is where you push |
| **Mouse wheel** / triggers / pinch | Zoom, from hull-close out to the whole system |
| **Click** a body | Point the camera at it; double-click opens its page |
| **Tab** / bumpers | Cycle camera targets — your ships, moons, planets, stations |
| **1**–**5** | Time warp, for the long coasts |
| **L** | Lock the controls to prograde/retrograde (needs Flight Assist) |
| **H** | Cinematic mode: hide the HUD and just look at it |
| **Space** | Pause |

There's a tutorial that teaches the awkward parts — circularising, transferring, arriving —
and a free-roam mode that doesn't. Saves are local by default, with opt-in cloud saves if
you want to move a game between your phone and your desk.

---

## <img src="screenshots/icons/music_note.png" alt=""> Where it all came from

Everything in New Worlds except the engine and three fonts was made in this project, by
scripts that live in it.

- **The sprites** are drawn pixel by pixel by Python — ships, stations, UI glyphs, the star
  field, and the worlds themselves, whose surfaces are baked from procedural height maps
  into rotation sheets with a live day/night terminator and, on Terra, city lights on the
  night side drawn from where the game's own population actually is.
- **The sound** is synthesised: the engine loop, the hull stress, the crash.
- **The music** is nineteen generated tracks, one per mood — the frontier, the descent,
  the inferno, the countdown.
- **The engine** is [Godot 4](https://godotengine.org), GDScript, Compatibility renderer,
  which is why it runs in a browser tab and on a mid-range phone.

This repository *is* the published build - replaced wholesale on every push. It's the
game, not the source.

---

## <img src="screenshots/icons/warp_faster.png" alt=""> Where it's at

The game is live in an open Pre-Alpha now and **needs playtesters!** Game systems are
changing daily and the game is in unstable development phase. Despite this save games
are version agnostic, so you can keep playing your saved runs.

🚀 **[playnewworlds.com](https://playnewworlds.com)**

<div align="center">
<img src="screenshots/worlds-strip.png" alt="">
</div>
