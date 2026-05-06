# Phase 1.5 Review-Time Extraction Contract — 260505 v1

## Purpose
This file defines the governing contract for creating Phase 2 sidecar packets during Phase 1.5 slotmap review.

The central idea is:

**The sidecar stores the answer for a specific compiler, not the evidence trail.**

Raw data remains in raw captures, per-person JSON, slotmaps, minitrees, overlays, and preserved source files. Sidecars are deliberately small files containing reviewed analytical decisions that later scripts can add, filter, map, or search without complex interpretation.

## Governing design rule
Use this rule for all Phase 2 sidecars:

**One analysis question -> one sidecar contract -> one simple compiler.**

Do not create a universal sidecar. Do not make a sidecar act as a second slotmap. Do not include columns merely because they are interesting.

A column belongs in a sidecar only if the relevant compiler will directly use it.

## Packet layout
For each reviewed seed ancestor, create one packet folder in the operational repo.

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

Folder naming convention:

```text
<PID>_<lowercase_name_with_underscores>
```

Examples:
- `2X9Y-569_lucy_smith`
- `LKJ3-G4W_mary_brickett`
- `2X9Y-5CR_isaac_pollard`

The `source_slotmap.csv` and `source_minitree.xlsx` files should be packet-local copies of the authoritative human-readable files already created after prior sessions.

## Sidecar 1: migration sidecar v1

### Purpose
Support birth-to-death migration visualization.

### Output model
The first migration visualizations should be flow maps:
- one line per included ancestor;
- line runs from birthplace to death place;
- maps grouped by generation;
- generation date labels computed later from the included birth/death years.

Recommended visual outputs:
- one zoomed-out Europe/Canada/United States map;
- one zoomed-in North America map;
- generation panels or generation filters.

### Unit
One row per ancestor whose birth and death places are both known enough to be useful for mapping.

Do not include unknown ancestors, PID-only artifacts, or unusably vague place rows merely to preserve a denominator. Migration is a known-data visualization, not a contribution-denominator analysis.

### Filename
`migration_sidecar_v1.csv`

### Columns
```text
schema_version
root_pid
root_name
ancestor_pid
ancestor_name
generation
birth_year
death_year
birth_place_raw
birth_map_place
birth_place_precision
death_place_raw
death_map_place
death_place_precision
movement_class
note
```

### Place simplification rule
Preserve precision. Never silently increase it.

Examples:
```text
Haverhill, Essex, Massachusetts Bay Colony, British Colonial America
-> Haverhill, Massachusetts, USA
precision = town

Middlesex, England
-> Middlesex, England, United Kingdom
precision = county_region

England
-> England, United Kingdom
precision = country_region

Massachusetts Bay Colony
-> Massachusetts, USA
precision = state_colony_region

British Colonial America
-> too broad for migration v1 unless a reviewed choice is made
```

Do not map "England" to London. Do not map "Massachusetts" to Boston.

### Controlled `birth_place_precision` / `death_place_precision`
```text
town
county_region
state_colony_region
country_region
too_broad
unknown
```

### Controlled `movement_class`
```text
international
domestic_north_america
same_region_or_local
canada_to_usa
usa_to_canada
unknown_scale
```

### Compiler rule
A migration compiler should:
1. read all `migration_sidecar_v1.csv` files;
2. use only rows where both endpoints have acceptable precision;
3. geocode `birth_map_place` and `death_map_place`;
4. group by generation;
5. draw birth-to-death lines;
6. compute generation labels from included `birth_year` and `death_year`.

Compiler should not parse `note`.

## Sidecar 2: genetic composition sidecar v1

### Purpose
Support comparison between documented expected ancestry-origin contribution and DNA ethnicity results.

This is a documentary/expected contribution analysis, not a claim about exact inherited DNA percentages after recombination.

### Unit
One row per origin bucket per reviewed slotmap.

This sidecar is aggregated. It is not one row per ancestor. The review session does the hard judgment about endpoints, weights, pedigree collapse, and unknowns.

### Filename
`genetic_composition_sidecar_v1.csv`

### Counting rule
Use weighted contribution, not raw immigrant count.

Later immigrants count more because their slot contribution is larger. Repeated appearances through pedigree collapse count according to repeated slot contribution.

Include `Unknown` or `Unresolved` rows as needed so the total does not silently pretend certainty.

### Columns
```text
schema_version
root_pid
root_name
origin_area
origin_subarea
strict_fraction
strict_decimal
expanded_fraction
expanded_decimal
endpoint_occurrences
note
```

### `origin_area`
Use sturdy country/equivalent buckets first.

Examples:
```text
England
Scotland
Ireland
Wales
Germany
France
Netherlands
Canada
Other
Unknown
Unresolved
```

`origin_area` is the governing comparison level.

### `origin_subarea`
Optional softer bucket.

Examples:
```text
Yorkshire
Norfolk
East Anglia
Nova Scotia
unknown_subregion
not_applicable
```

Subregions are useful for flavor, especially in England, but should be treated cautiously. Country/equivalent origin is more robust than fine regional comparison with commercial DNA estimates.

### Compiler rule
A genetic composition compiler should:
1. read all `genetic_composition_sidecar_v1.csv` files;
2. group by `origin_area`;
3. sum `strict_decimal` for the strict report;
4. sum `expanded_decimal` for the expanded report;
5. optionally group by `origin_area + origin_subarea` for a softer regional report;
6. check that strict and expanded totals are sensible.

Compiler should not infer weights from raw slotmaps.

## Sidecar 3: Wikipedia candidates sidecar v1

### Purpose
Provide a unique-ancestor search manifest for later Wikidata/Wikipedia matching.

This sidecar identifies who should be searched and gives enough biographical/family context to avoid same-name false positives.

### Unit
One row per unique ancestor from the reviewed slotmap.

This is not slot-weighted. It is not a composition file.

### Filename
`wikipedia_candidates_sidecar_v1.csv`

### Columns
```text
schema_version
root_pid
root_name
ancestor_pid
ancestor_name
search_name
alternate_names
birth_year
death_year
birth_place
death_place
spouse_names
parent_names
generation_min
generation_max
slots_seen
search_priority
note
```

### `search_priority`
Suggested values:
```text
high
medium
low
skip
```

Search priority should favor ancestors with unusual names, complete identifying data, known prominence, immigrant endpoint interest, repeated appearance, or possible famous-person clues.

### Matching approach
The preferred search approach is Wikidata-first, Wikipedia-second.

A later automated or semi-automated matcher should:
1. combine all candidate sidecars;
2. deduplicate by `ancestor_pid`;
3. search Wikidata for humans by name and aliases;
4. compare dates, places, spouse names, parent names, and family context;
5. rank candidates;
6. send strong/ambiguous cases to human/AI review;
7. write accepted results to a separate match-results file.

The script may propose matches. Only reviewed matches become accepted matches.

### Future result file
Do not store attempted matches in this candidate sidecar. Use a separate later file such as:

```text
wikipedia_matches_v1.csv
```

Potential result columns:
```text
schema_version
ancestor_pid
ancestor_name
wikidata_qid
wikipedia_title
wikipedia_url
candidate_birth_year
candidate_death_year
candidate_birth_place
candidate_death_place
matched_spouse
matched_parent
match_status
confidence
review_note
```

## Sidecar 4: rough spots sidecar v1

### Purpose
Preserve human/AI notes about ancestors, slots, or issues that may deserve later research, repair, overlay, or review.

This is a work queue and memory aid. It is not an arithmetic compiler input.

If a rough spot affects a specific analysis, the actual compiler instruction belongs in that analysis sidecar. The rough-spots sidecar preserves the reason and possible follow-up.

### Unit
One row per issue or research lead.

### Filename
`rough_spots_sidecar_v1.csv`

### Columns
```text
schema_version
root_pid
root_name
ancestor_pid
ancestor_name
slot_or_context
issue_type
research_value
recommended_action
priority
note
```

### Controlled `issue_type`
```text
missing_birthplace
missing_deathplace
missing_parent
duplicate_pid
possible_wrong_parent
pid_only_artifact
immigrant_boundary_question
place_ambiguity
possible_famous_connection
interesting_biography
other
```

### Controlled `recommended_action`
```text
ignore_for_now
check_familysearch
check_ancestry
check_wikidata
create_overlay
manual_review
research_later
```

### Controlled `priority`
```text
high
medium
low
```

### Compiler rule
No Phase 2 arithmetic compiler should depend on prose in the rough-spots sidecar.

## Review-time extraction workflow
For each slotmap/minitree packet:

1. Copy the authoritative human-readable slotmap and minitree into the packet folder as `source_slotmap.csv` and `source_minitree.xlsx`.
2. Review the minitree visually for structural problems.
3. Review the slotmap data layer for places, endpoint patterns, duplicates, PID-only rows, and missing data.
4. Create only the sidecars needed for the analyses being pursued.
5. Keep each sidecar narrow. Do not add columns merely because they might be interesting.
6. Use the rough-spots sidecar for research notes, not for compiler instructions.
7. Treat the packet as the unit of future retrieval and analysis.

## Non-goals
The sidecar packet is not:
- a replacement for raw evidence;
- a complete audit trail;
- a universal fact table;
- a second slotmap;
- a professional genealogical proof report.

It is a set of small, compiler-safe extraction files created while the reviewed slotmap context is fresh.
