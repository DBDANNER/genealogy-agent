# Phase 1.5 Slotmap Review Protocol — 260505 v2

## Purpose
This protocol defines how to review a minitree/slotmap pair during Phase 1.5.

The goal is now broader than rough-spot classification alone. The goal is to review one slotmap deeply, extract the analysis-specific judgments needed for Phase 2, and save those judgments in a small sidecar packet.

In short:

**Review the slotmap once. Squeeze out the useful Phase 2 products while the evidence is in front of us. Save the products in simple sidecars.**

## Inputs
For each reviewed root, use:
- packet-local `source_slotmap.csv`;
- packet-local `source_minitree.xlsx`;
- Stage 1 slotmap JSON if needed;
- relevant per-person JSONs for disputed fields;
- overlays in `commentary_overlay` if applicable;
- prior human review notes if available.

The packet-local source files should be copied from the current authoritative human-readable slotmap/minitree files created after prior sessions.

## Recommended packet setup
Before review, create or confirm a packet folder:

```text
phase2_sidecars/
  <PID>_<lowercase_name_with_underscores>/
    source_slotmap.csv
    source_minitree.xlsx
```

During review, create sidecars as needed:

```text
migration_sidecar_v1.csv
genetic_composition_sidecar_v1.csv
wikipedia_candidates_sidecar_v1.csv
rough_spots_sidecar_v1.csv
```

See `docs/phase15_review_time_extraction_contract_260505_v1.md`.

## Review order

### 1. Packet setup
Confirm:
- the root PID and name;
- packet folder name;
- source slotmap file;
- source minitree workbook;
- which sidecars will be created in this review pass.

Do not reorganize the entire past corpus in bulk. Create packets forward as each slotmap is reviewed.

### 2. Visual minitree review
Use the workbook or user's visual review to catch obvious name/shape problems:
- blank visible names;
- unexpected missing branches;
- obvious wrong-generation/person placement;
- parent order problems;
- visible duplicate-couple patterns.

### 3. Slotmap data-layer review
Use the CSV/JSON to audit fields that are hard to see visually:
- PID-only rows;
- missing birthplaces;
- missing death places if migration sidecar is being created;
- missing names with PIDs;
- foreign-born/immigrant endpoints;
- parent slots downstream of immigrant endpoints;
- duplicate PIDs;
- historically awkward place strings;
- parent assignment review flags;
- unknown placeholders.

### 4. Create analysis sidecars
Create sidecars according to the analysis being pursued.

#### Migration sidecar
Use only ancestors with both birth and death places usable enough to map. Simplify places without increasing precision. Do not force unknowns into the migration sidecar for denominator accounting.

#### Genetic composition sidecar
Create aggregated rows by origin bucket. Use weighted contribution, not raw endpoint count. Include Unknown/Unresolved rows as needed so totals do not imply false certainty.

#### Wikipedia candidates sidecar
Create one row per unique ancestor with enough identity data for future Wikidata/Wikipedia matching: name, dates, places, spouse, parents, slots seen, and search priority.

#### Rough spots sidecar
Record issues, research leads, overlay candidates, curiosities, and possible famous-person clues. This file is a notes/work-queue file, not a compiler ledger.

### 5. Classify rough spots
Use the categories in `phase15_rough_spot_policy_260505_v1.md` and the rough-spots sidecar contract.

Common rough spot categories include:
- `missing_birthplace`
- `missing_deathplace`
- `missing_parent`
- `duplicate_pid`
- `possible_wrong_parent`
- `pid_only_artifact`
- `immigrant_boundary_question`
- `place_ambiguity`
- `possible_famous_connection`
- `interesting_biography`
- `other`

### 6. Separate correction from analysis
Do not convert an analysis assumption into a genealogical fact.

Examples:
- accepted Ancestry birthplace for Daniel Ladd may become an overlay after exact wording/source is recorded;
- inferred domestic birth for Mary Haggett may be an expanded-analysis judgment, not a raw birthplace;
- PID-only rows are usually artifacts to ignore, not ancestors to repair;
- duplicate PIDs are often pedigree collapse, not duplicates to remove.

### 7. Keep compilers dumb
If a decision affects a compiler, put the final instruction in the relevant sidecar.

If a decision is merely a reason, clue, or explanation, put it in the rough-spots sidecar note.

Do not expect a Phase 2 compiler to read prose and decide what to do.

## Consensus rules from Isaac Pollard and Lucy Smith pilots

1. Missing maiden name is not a blocker when the person has her own documented birthplace/origin. Include as-is and preserve the name limitation.

2. Ancestors beyond immigrant endpoints should be identified and excluded from strict genetic/composition analysis unless the line is deliberately reopened.

3. PID-only rows should not be used in Phase 2 analyses unless later reviewed and harvested.

4. Missing birthplace cases are case-by-case. Accepted external evidence can become an overlay; family-context guesses should be analysis annotations with confidence or expanded-only treatment if needed.

5. Duplicate PIDs/couples should be preserved. Use unique-person mode or slot-weighted mode depending on the analysis.

6. Historic place strings should be simplified only to the precision required by the relevant sidecar. A global place authority file may be useful later, but it is not an up-front blocker for review-time extraction.

7. For migration sidecars, never increase place precision silently. If the source says only "England," map it as England, not London.

8. For genetic-style composition, use weighted contribution. Raw immigrant count is secondary.

9. For Wikipedia/Wikidata matching, spouse and parent agreement are important identity checks after name, dates, and places.

## Immediate Lucy Smith follow-up items retained from v1
- Daniel Ladd Sr. (`LRYD-YBN`): user found Ancestry origin data. Create accepted birthplace overlay after exact wording/source is recorded if this remains worthwhile. Then patch/test builder only if the overlay needs to affect future slotmap output.
- Mary Haggett (`P87C-6PX`): no own birthplace; parents are English immigrants. Possible domestic/colonial best guess for expanded analysis only unless sourced.
- Ezekiel Worthen Sr. (`MPKG-QVT`): no birth year/place; spouse context suggests domestic/colonial, but weaker. Preserve broken-branch status and use only as annotated inference if needed.

## End state of a reviewed packet
A reviewed packet should make later retrieval and compilation easy.

Minimum desirable end state:
- packet-local source slotmap and minitree exist;
- sidecars created for analyses pursued in that pass;
- rough spots captured if any;
- no compiler-critical judgment exists only in chat prose.

If a sidecar is not created for a given analysis, that analysis should not silently infer from the raw slotmap later unless a future contract explicitly allows it.
