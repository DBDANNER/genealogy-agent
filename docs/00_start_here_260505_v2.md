# Ancestry Project — Start Here — 260505 v2

## Purpose of this file
This file is the startup orientation document for new chats working on the Ancestry Project. It is a router, not an encyclopedia. After reading it, a new chat should read the latest continuity file, then the governing file index, then only the task-relevant manuals, policy files, or code files.

## Current project phase map

### Phase 1 — Harvesting and rendering: complete
Phase 1 harvested the initial FamilySearch ancestor corpus through the semi-automated Harvester/Navigator workflow and rendered minitrees from Stage 1 slotmaps. The final harvested/rendered minitree in the initial set was Lucy Smith / Lucey Smith, PID `2X9Y-569`. Recent completed roots include Mary Brickett (`LKJ3-G4W`), Isaac Pollard (`2X9Y-5CR`), and Lucy Smith (`2X9Y-569`).

Phase 1 outputs include local/GitHub-mirrored FamilySearch captures, per-person JSONs, relationship links, overlays, Stage 1 slotmaps, and Stage 2 minitree workbooks.

### Phase 1.5 — Review-time extraction and sidecar packet creation: current
Phase 1.5 is no longer framed mainly as "clean the slotmaps until a future smart script can interpret them." The current governing approach is:

**Review each slotmap/minitree pair with human plus AI judgment, extract finished analytical judgments while the evidence is in front of us, and store those judgments in small purpose-built sidecar files.**

The working motto is:

**One analysis question -> one sidecar contract -> one simple compiler.**

The goal is to squeeze the analytical value out of each reviewed slotmap as we go through it, without building a fragile universal interpreter and without turning the sidecars into an audit trail.

Current Phase 1.5 outputs should be organized as sidecar packets, one packet per reviewed seed ancestor.

Recommended packet layout:

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

The `source_slotmap.csv` and `source_minitree.xlsx` files are packet-local copies of the human-readable authoritative files already created after prior sessions. Once copied into the packet, they are the reviewed source files for that packet. The original rendered files remain preserved in their existing session/report locations.

### Phase 2 — Sidecar aggregation and synthesis: next
Phase 2 should be based primarily on aggregation of reviewed sidecar packets, not on raw interpretation of slotmaps by a generalized script.

The scripts should be intentionally dumb:
- migration compilers read migration sidecars;
- genetic/composition compilers read genetic composition sidecars;
- Wikipedia/Wikidata searchers read Wikipedia candidate sidecars;
- rough-spot review tools read rough-spot sidecars.

Compilers should not parse prose notes as authoritative data.

## Startup procedure for a new chat
A new chat should usually do the following:

1. Read the governing `00_start_here_*` file.
2. Read the latest continuity file from the previous session, if provided.
3. Read the governing `file_index_*` file.
4. Identify the current task category.
5. Read only the task-relevant governing files or code files.

For current Phase 1.5 / Phase 2 work, the task-relevant governing files are:
- `docs/phase15_rough_spot_policy_260505_v1.md`
- `docs/phase15_review_time_extraction_contract_260505_v1.md`
- `docs/phase15_slotmap_review_protocol_260505_v2.md`
- `docs/phase2_analysis_plan_260505_v2.md`
- `docs/place_authority_plan_260505_v1.md`

The place authority plan remains useful as a support/reference concept, but it is no longer an up-front blocker for Phase 2. For review-time extraction, place simplification should be done only at the precision needed by the relevant sidecar.

## Current caution flags

1. Do not mutate raw harvested FamilySearch-derived person records casually. Raw captures and merged person records are evidence. Prefer overlays, sidecars, and analysis annotations.

2. The active Stage 1 builder supports `set_parents` and `exclude_person` overlays. The overlay file already contains an `override_birth_place` precedent, but as of the Lucy Smith review the active builder had not yet been patched/tested to apply `override_birth_place` in generated slotmaps. Treat that as an implementation task, not a completed capability.

3. PID-only rows in slotmaps may come from a known Navigator queue imperfection in which missing-parent situations can feed sibling/child PIDs into the queue. The user often recognized these cases and did not harvest those pages. Treat PID-only rows as structural/unharvested artifacts unless separately reviewed.

4. Immigrant-boundary overrun is an analysis-scope problem, not necessarily a genealogical error. Ancestors beyond a foreign-born immigrant endpoint should be identified and excluded from strict genetic/composition analysis unless the line is deliberately reopened.

5. Duplicate PIDs/couples often represent genuine pedigree collapse/cousin marriage. Do not remove them blindly. Count them according to the specific analysis contract.

6. Sidecars store final analytical instructions for compilers, not the full evidence trail. The evidence remains in slotmaps, minitrees, people JSON, raw captures, overlays, and human notes.

## Core distinction for rough spots
Rough spots should be classified into three broad handling modes:

1. Genealogical correction: a reviewed change to relationship or identity data. Store in overlay layer; do not rewrite raw harvests.
2. Analysis annotation: an interpretation label used for inclusion, classification, confidence, or analysis mode. Store in the relevant sidecar if it affects a compiler.
3. Research lead: a plausible clue or curiosity that has not yet been accepted as a correction or analysis input. Store in the rough-spots sidecar.

## Repo roles

### `ancestry_repo`
Operational working repo on the laptop and mirrored to GitHub. It contains scripts, FamilySearch captures, per-person JSONs, links, overlays, builder outputs, templates, extension ZIPs, rendered slotmaps/minitrees, and future Phase 2 sidecar packets.

### `genealogy-agent`
Constitutional/reference repo. It contains startup files, manuals, command contracts, playbooks, file indexes, and policy documents intended to reduce dependence on oversized continuity files.

Design intent:
- `genealogy-agent` = durable reference / governing layer
- `ancestry_repo` = operational working layer

## Ethical boundary
All project work should remain within the user's ethical boundary: personal family-line research, personally supervised, limited to sites the user can ethically access, non-commercial, and not abusive bulk scraping.

## System overview

### Harvester/Navigator
Chrome extension plus local server used to harvest FamilySearch person pages and move through the ancestor queue. It is a semi-automated, human-in-the-loop collection workflow.

### Slotmap / tree-builder
Local Python scripts build a structured Ahnentafel slotmap and render it into a human-readable minitree workbook.

### Phase 2 sidecar packets
Per-root review folders containing packet-local source slotmap/minitree copies plus analysis-specific sidecars. These become the preferred working unit for Phase 1.5 review and Phase 2 compilation.

### Shuttle
Local message relay used to reduce friction between ChatGPT, the laptop, CMD, and GitHub mirror actions. Use the Shuttle manual before guessing message contracts.

### Codex
Used for code creation, patching, and debugging. When writing Codex prompts, specify the target filename, prefer versioned new files, and tell Codex not to print the full code at the end unless explicitly needed.

## End-of-session routine
At normal session end, create or update durable governing files when new reusable lessons were learned. A continuity file is still useful when tactical state would otherwise be lost, but the governing layer should carry stable policies, contracts, and startup routing.
