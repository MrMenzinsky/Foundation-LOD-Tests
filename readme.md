# Foundation LOD Tests

A test mod for figuring out how Foundation handles LOD meshes from Blender FBX exports. LOD behaviour in Foundation is poorly documented and modders keep running into issues: meshes not switching at the right distance, LOD levels being silently ignored, the game just using one mesh regardless of what's in the file. This mod makes the edge cases testable and visible in-game.

## TL;DR

- Individual LOD levels work. Combined ranges (`LOD_01`, `LOD_23`) work if used at the start of the sequence, not the end.
- Never end your LOD sequence on a combined range (`LOD_34` as the last entry breaks everything).
- Never leave a gap in the middle of your LOD sequence (a gap at the end is fine).
- Do not define a LOD level both as part of a combined range and as a standalone entry.
- Blender's auto-generated `.001`, `.002` suffixes on mesh names are harmless.
- Multiple meshes per LOD level work fine.

Full findings and details: [metadata/findings.md#summary](metadata/findings.md#summary)

## What's in here

36 building parts, each a "traffic light" configured with a different LOD setup. Traffic lights are a good test subject because LOD transitions are easy to spot visually at a distance.

The experiments are split into four groups:

| Group | Suffix names | Meshes per LOD level |
|-------|-------------|----------------------|
| 10-18 | No          | Single               |
| 20-28 | No          | Multiple (two each)  |
| 30-38 | Yes         | Single               |
| 40-48 | Yes         | Multiple (two each)  |

Each group tests the same nine configurations:

| Configuration | What it tests |
|---------------|---------------|
| `LOD_0` `LOD_1` `LOD_2` `LOD_3` `LOD_4` | All five levels individually |
| `LOD_01` `LOD_23` `LOD_4` | Combined first two, combined middle two, single at end |
| `LOD_01` `LOD_2` `LOD_34` | Combined first, single middle, combined end |
| `LOD_01` `LOD_2` `LOD_3` `LOD_4` | Combined first, rest singles |
| `LOD_0` `LOD_1` `LOD_2` `LOD_34` | Singles first, combined end |
| `LOD_0` `LOD_1` `LOD_2` | Gap at the end (LOD_3 and LOD_4 missing) |
| `LOD_0` `LOD_1` `LOD_3` `LOD_4` | Gap in the middle (LOD_2 missing) |
| `LOD_01` `LOD_1` `LOD_23` `LOD_4` | Overlap: LOD_1 covered by both a combined and a single |
| `LOD_01` `LOD_2` `LOD_23` `LOD_4` | Overlap: LOD_2 covered by both a combined and a single |

### The test models

![All 36 test models in Blender](<metadata/Blender screenshot.png>)

## Results

Observations from running the experiments are in [metadata/findings.md](metadata/findings.md).

## Using the mod

Build a **Village Centre** to unlock the **LOD traffic light monument**, then place it. The building part picker lets you switch between experiments. Move the camera in and out to watch the LOD transitions.

## Running your own experiments

The Blender source is at [metadata/Blender/LOD-traffic-lights.blend](metadata/Blender/LOD-traffic-lights.blend). Change the mesh names or LOD setup, re-export to FBX (double check the settings and that you export to the modeuls/ folder!), and load the mod. The Lua scripts and localization files are repetitive by design, so adding new experiment numbers is just a matter of following the existing pattern.

## Files

```
models/          FBX export
metadata/
  Blender/       Blender source file
  findings.md    Experiment results
scripts/         Lua mod code
localization/    In-game text
```

### Map code used for testing
**50xads9Qb0a0O**