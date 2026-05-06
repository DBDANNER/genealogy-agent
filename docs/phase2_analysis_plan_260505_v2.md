# Phase 2 Analysis Plan — 260505 v2

## Purpose
This file defines the revised Phase 2 analysis plan for the harvested ancestry corpus.

The governing change from v1 is that Phase 2 should not depend on a generalized script trying to interpret raw slotmaps. Instead, Phase 2 should aggregate small, purpose-built sidecar files created during Phase 1.5 slotmap review.

## Core strategy
The current strategy is:

**Use the slotmap review session to extract the finished analytical judgments while the evidence is in front of us. Then store those judgments in small, purpose-built sidecars that dumb compilers can trust.**

The goal is to use the user's review plus ChatGPT's language analysis and file-creation abilities to squeeze the analytical value out of each slotmap as it is reviewed.

The governing design rule is:

**One analysis question -> one sidecar contract -> one simple compiler.**

This replaces the older tendency to make one universal sidecar or one universal interpreter.

## Analysis posture
Phase 2 compilers should be narrow and intentionally simple.

A compiler should:
- read only the sidecar family relevant to its analysis;
- treat sidecar columns as final reviewed instructions;
- avoid parsing prose notes;
- avoid inferring missing facts from raw slotmaps unless a later contract explicitly allows it.

Raw harvests, people JSON, minitrees, and slotmaps remain evidence. Sidecars are not evidence archives. Sidecars are compiler-safe summaries of reviewed analytical judgments.

## Phase 1.5 / Phase 2 packet architecture
For each reviewed seed ancestor, create a packet folder in the operational repo.

Recommended layout:

```text
phase2_sidecars/
  2X9Y-569_lucy_smith/
    source_slotmap.csv
    source_minitree.xlsx
    migration_sidecar_v1.csv
    genetic_composition_sidecar_v1.csv
    wikipedia_candidates_sidecar_v1.csv
    rough_spots_sidecar_v1.csv
```

The `source_slotmap.csv` and `source_minitree.xlsx` files should be copies of the current human-readable authoritative files for that seed ancestor. They are copied into the packet so future review and compilation do not have to hunt through report folders.

The packet-local copies are the reviewed source files for that packet. The original files remain preserved in their existing report/session locations.

## Primary Phase 2 workstreams

### 1. Migration visualization
Purpose: show the broad shape and flavor of known ancestor movement.

Version 1 model:
- one row per ancestor with both birth and death places usable enough to map;
- one line from birthplace to death place;
- maps grouped by generation;
- generation date labels computed later from included birth/death years.

Recommended outputs:
- zoomed-out Europe/Canada/United States flow maps;
- zoomed-in North America flow maps;
- generation panels with computed labels such as "Generation 7 — median birth year 1715."

Important limitation:
This is not a complete residence history. It shows known birth-to-death movement only.

Sidecar:
`migration_sidecar_v1.csv`

### 2. Genetic-style documented origin composition
Purpose: compare expected/documentary ancestry-origin contribution with DNA ethnicity results.

This is not a claim about exact inherited DNA percentages after recombination. It is a slot-weighted expected ancestry composition derived from reviewed genealogy.

Counting rule:
- use weighted contribution, not raw immigrant count;
- later immigrants count more because their slot weight is larger;
- repeated appearances through pedigree collapse count according to repeated slot contribution;
- include `Unknown` or `Unresolved` rows where needed so totals do not falsely imply certainty.

Recommended output:
- country/equivalent origin chart;
- optional softer subregion chart, especially for English regional origins, treated cautiously.

Sidecar:
`genetic_composition_sidecar_v1.csv`

### 3. Wikipedia/Wikidata candidate matching
Purpose: identify unique ancestors who may have Wikipedia/Wikidata entries.

The best search approach is Wikidata-first, Wikipedia-second:
1. deduplicate candidate sidecars globally by PID;
2. search Wikidata by name/dates and filter to humans;
3. score candidates by name, birth/death years, places, spouses, parents, and family context;
4. review promising/ambiguous candidates manually or with AI assistance;
5. store confirmed matches in a separate match-results file.

The slotmap-level candidate sidecar is not the match-results file. It is the search manifest.

Sidecar:
`wikipedia_candidates_sidecar_v1.csv`

Future result file:
`wikipedia_matches_v1.csv` or equivalent global reviewed match table.

### 4. Rough spots / needs-work queue
Purpose: preserve repair leads, research curiosities, suspicious rows, overlay candidates, missing-place cases, and other issues worth later attention.

This file is not an arithmetic input. If a rough spot affects migration or composition, the actual compiler instruction belongs in the relevant analysis sidecar. The rough-spots file preserves the human reason and possible follow-up.

Sidecar:
`rough_spots_sidecar_v1.csv`

## Secondary/future workstreams
Other Phase 2 analyses may be added later, but should follow the same rule: define the final output first, then create the minimum sidecar contract needed for that output.

Potential later workstreams:
- FamilySearch photos/memories enrichment;
- Find a Grave enrichment;
- intergenerational birth-to-birth migration;
- global unique ancestor inventory;
- famous-ancestor/network analysis.

Do not add columns to existing sidecars merely because a future analysis might want them. Create a new sidecar contract if a new analysis needs different data.

## Relationship to place authority work
The place authority concept remains useful, but it is no longer an up-front blocker for Phase 2.

For migration sidecars, the reviewer should simplify places only to the level needed for mapping and should preserve precision:
- town stays town;
- county/region stays county/region;
- state/colony stays state/colony;
- country stays country;
- vague continent-scale or "British Colonial America" style places may be marked too broad or omitted from migration v1.

Never silently increase precision. Do not map "England" to London or "Massachusetts" to Boston.

## Candidate first implementation tasks
After initial packet contracts are accepted, good first implementation tasks are:

1. Create the `phase2_sidecars` directory structure in `ancestry_repo`.
2. Build the first reviewed packet from a completed slotmap, likely Lucy Smith (`2X9Y-569`), by copying its authoritative slotmap/minitree into a packet folder.
3. Create the four v1 sidecars for that packet.
4. Write a dumb migration compiler for migration sidecars.
5. Write a dumb genetic composition compiler for genetic composition sidecars.
6. Write a global Wikidata candidate search/scoring tool from Wikipedia candidate sidecars.

Codex prompts should specify versioned new target filenames and should tell Codex not to print the full code at the end unless explicitly needed.
