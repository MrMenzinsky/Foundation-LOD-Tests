# LOD Experiment Findings

Observations from running the 36 experiments in-game. Each entry notes whether LOD transitions behaved as expected and any unexpected behaviour.

**Setup:** Foundation version `1.11.0.17`, mod version `0.1.0`

All models LOD behaviours *should* work as intended (but many won't, hence all of this testing). The Result column notes if the LOD transitions were **Correct** or **Broken**, and the Notes column describes any unexpected behaviour or edge cases.

## Group 10–18: Single mesh per level, no suffix names

| # | Configuration | Result | Notes |
|---|---------------|--------|-------|
| 10 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Renders all five LODs as expected. |
| 11 | `LOD_01`, `LOD_23`, `LOD_4` | Correct | Renders all three LODs as expected. |
| 12 | `LOD_01`, `LOD_2`, `LOD_34` | Broken | All LODs get the same color as LOD_01. Instead of Green (01), Blue (2), Red (34) you get Green (01), Green (2), Green (34). |
| 13 | `LOD_01`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Interesting that this one works but #12 doesn't. |
| 14 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_34` | Broken | Same behavior as #12. It seems that if you have a "double" LOD (like LOD_34) at the end, it somehow triggers *all* LODs to get the same color as LOD_0 (in this case Green). |
| 15 | `LOD_0`, `LOD_1`, `LOD_2` (gap at end) | Correct | Renders all three LODs as expected.|
| 16 | `LOD_0`, `LOD_1`, `LOD_3`, `LOD_4` (gap in middle) | Broken | No LODs after the gap renders, in this case LOD_3 and LOD_4 are not visible. |
| 17 | `LOD_01`, `LOD_1`, `LOD_23`, `LOD_4` (overlap at LOD_1) | Broken | Only LOD_01 renders. At LOD 1 distance, only LOD_01 is visible, but not the LOD_1 square. At LOD 2-4 distance, nothing is visible. |
| 18 | `LOD_01`, `LOD_2`, `LOD_23`, `LOD_4` (overlap at LOD_2) | Broken | Identical behavior as #17. |

## Group 20–28: Multiple meshes per level, no suffix names

| # | Configuration | Result | Notes |
|---|---------------|--------|-------|
| 20 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Renders all five LODs as expected. |
| 21 | `LOD_01`, `LOD_23`, `LOD_4` | Correct | Renders all three LODs as expected. |
| 22 | `LOD_01`, `LOD_2`, `LOD_34` | Broken | Same as #12 and #14, all LODs get the same color as the first LOD, in this case Green (01). |
| 23 | `LOD_01`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Same as #13. |
| 24 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_34` | Broken | Same behavior as #12 and #14. It seems that if you have a "double" LOD (like LOD_34) at the end, it somehow triggers *all* LODs to get the same color as LOD_0 (in this case Green). |
| 25 | `LOD_0`, `LOD_1`, `LOD_2` (gap at end) | Correct | Same as #15. Renders all three LODs as expected. |
| 26 | `LOD_0`, `LOD_1`, `LOD_3`, `LOD_4` (gap in middle) | Broken | No LODs after the gap renders, in this case LOD_3 and LOD_4 are not visible. Same as #16. |
| 27 | `LOD_01`, `LOD_1`, `LOD_23`, `LOD_4` (overlap at LOD_1) | Broken | Only LOD_01 renders. At LOD 1 distance, only LOD_01 is visible, but not the LOD_1 square. At LOD 2-4 distance, nothing is visible. Same as #17. |
| 28 | `LOD_01`, `LOD_2`, `LOD_23`, `LOD_4` (overlap at LOD_2) | Broken | Identical behavior as #27. |

**General Observation:** All 20-28 experiments rendered both meshes for each LOD level, confirming that multiple meshes per LOD level is supported. However, the same issues with combined LODs (like LOD_01 or LOD_34) and gaps/overlaps are present regardless of whether there are single or multiple meshes per level, as in experiments 10-18.

## Group 30–38: Single mesh per level, with suffix names

| # | Configuration | Result | Notes |
|---|---------------|--------|-------|
| 30 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Renders all five LODs as expected. |
| 31 | `LOD_01`, `LOD_23`, `LOD_4` | Correct | Renders all three LODs as expected. |
| 32 | `LOD_01`, `LOD_2`, `LOD_34` | Broken | Same as #12, #14, #22, and #24, all LODs get the same color as the first LOD, in this case Green (01). |
| 33 | `LOD_01`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Renders all four LODs as expected. |
| 34 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_34` | Broken | Same behavior as #12, #14, #22, #24, and #32. It seems that if you have a "double" LOD (like LOD_34) at the end, it somehow triggers *all* LODs to get the same color as LOD_0 (in this case Green). |
| 35 | `LOD_0`, `LOD_1`, `LOD_2` (gap at end) | Correct | Renders all three LODs as expected. |
| 36 | `LOD_0`, `LOD_1`, `LOD_3`, `LOD_4` (gap in middle) | Broken | No LODs after the gap render, in this case LOD_3 and LOD_4 are not visible. Same as #16 and #26. |
| 37 | `LOD_01`, `LOD_1`, `LOD_23`, `LOD_4` (overlap at LOD_1) | Broken | Only LOD_01 renders. At LOD 1 distance, only LOD_01 is visible, but not the LOD_1 square. At LOD 2-4 distance, nothing is visible. Same as #17 and #27. |
| 38 | `LOD_01`, `LOD_2`, `LOD_23`, `LOD_4` (overlap at LOD_2) | Broken | Identical behavior as #37. |

**Observation:** The presence of suffix names (like LOD_0.Green, LOD_1.Cyan, etc.) does not affect the LOD behavior. The same issues with combined LODs, gaps, and overlaps are present regardless of suffix names, as seen in experiments 10-18. I.e. there seems to be no difference if the suffix is only a ".001" or ".002" (as in experiments 10-18) or a descriptive name like ".Green", ".Green.001", ".Blue" or ".Blue.001" (as in experiments 30-38).

## Group 40–48: Multiple meshes per level, with suffix names

| # | Configuration | Result | Notes |
|---|---------------|--------|-------|
| 40 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Renders all five LODs as expected. |
| 41 | `LOD_01`, `LOD_23`, `LOD_4` | Correct | Renders all three LODs as expected. |
| 42 | `LOD_01`, `LOD_2`, `LOD_34` | Broken | Same behavior as #12, #14, #22, #24, #32, and #34. All LODs get the same color as the first LOD, in this case Green (01). |
| 43 | `LOD_01`, `LOD_2`, `LOD_3`, `LOD_4` | Correct | Renders all four LODs as expected. |
| 44 | `LOD_0`, `LOD_1`, `LOD_2`, `LOD_34` | Broken | Same behavior as #12, #14, #22, #24, #32, #34, and #42. It seems that if you have a "double" LOD (like LOD_34) at the end, it somehow triggers *all* LODs to get the same color as LOD_0 (in this case Green). |
| 45 | `LOD_0`, `LOD_1`, `LOD_2` (gap at end) | Correct | Renders all three LODs as expected. |
| 46 | `LOD_0`, `LOD_1`, `LOD_3`, `LOD_4` (gap in middle) | Broken | No LODs after the gap render, in this case LOD_3 and LOD_4 are not visible. Same as #16, #26, and #36. |
| 47 | `LOD_01`, `LOD_1`, `LOD_23`, `LOD_4` (overlap at LOD_1) | Broken | Only LOD_01 renders. At LOD 1 distance, only LOD_01 is visible, but not the LOD_1 square. At LOD 2-4 distance, nothing is visible. Same as #17, #27, and #37. |
| 48 | `LOD_01`, `LOD_2`, `LOD_23`, `LOD_4` (overlap at LOD_2) | Broken | Identical behavior as #47. |

**Observation:** The presence of multiple meshes per LOD level and suffix names does not affect the LOD behavior. The same issues with combined LODs, gaps, and overlaps are present regardless of multiple meshes or suffix names, as seen in experiments 10-18, 20-28,and 30-38.

## Summary

The 36 experiments were run across four variable groups: suffix names (yes/no) and mesh count per LOD level (one/two). Each group tested the same nine LOD configurations. The short version: suffix names and mesh count are irrelevant. The failures are driven entirely by LOD naming structure.

### What works

Individual LOD levels (`LOD_0` through `LOD_4`) work reliably in all tested combinations. Combined ranges at the start of the sequence (`LOD_01`) also work, as long as the sequence ends on a single level. Gaps at the end of the sequence (`LOD_0`, `LOD_1`, `LOD_2` with nothing further) work too -- the model just stops switching beyond the last defined level, which is probably the intended behaviour.

### What breaks, and how

Three failure modes were found, each consistent across all four variable groups:

**1. Combined range at the end of the sequence**
Any configuration ending in a combined range (`LOD_34`) causes all LOD levels to render using the material of the first level. In the test models, this means everything renders green regardless of camera distance. Experiments 12, 14, 22, 24, 32, 34, 42, and 44 all fail this way. Notably, a combined range at the *start* (`LOD_01`) works fine -- the problem is specific to the last entry in the sequence. Why Foundation treats the first and last combined ranges differently is unclear.

**2. Gap in the middle of the sequence**
If a LOD level is missing from the middle of an otherwise contiguous sequence (e.g. `LOD_0`, `LOD_1`, `LOD_3`, `LOD_4` with `LOD_2` absent), all levels after the gap disappear entirely. Experiments 16, 26, 36, and 46 confirm this. A gap at the end is harmless; a gap anywhere earlier is fatal for everything that follows it.

**3. Overlapping definitions**
When a LOD level is covered by both a combined range and an individual entry (e.g. `LOD_01` and `LOD_1` both present), only the first LOD in the sequence renders. Everything beyond it becomes invisible. Experiments 17, 18, 27, 28, 37, 38, 47, and 48 all fail this way.

### What makes no difference

Suffix names have no effect on any of the above. Whether mesh names are `LOD_0`, `LOD_0.001` (Blender's auto-generated duplicate suffix), or `LOD_0.Green`, the LOD behaviour is identical. Groups 10-18 and 30-38 produced matching results in every experiment, as did 20-28 and 40-48.

Multiple meshes per LOD level are supported. Foundation renders all meshes assigned to a given LOD level, which is useful for composite models. This also holds in the failure cases -- when a configuration breaks, all meshes at that level fail together.

### Practical takeaways for modders

- Single LOD levels work. Combined ranges (`LOD_01`, `LOD_23`) work if used at the start, not the end.
- Never end your LOD sequence on a combined range.
- Never leave a gap in the middle of your LOD sequence.
- Do not define a LOD level both as part of a combined range and as a standalone entry.
- Suffix names are irrelevant to LOD resolution, so Blender's auto-generated `.001`, `.002` suffixes are harmless.
- Multiple meshes per LOD level work and can be used freely.
