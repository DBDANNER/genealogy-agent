# Ancestry Project — Start Here — 260505 v1

## Purpose of this file
This file is the startup orientation document for new chats working on the Ancestry Project. It should orient a new chat quickly without forcing it to reconstruct every subsystem or reread every historical continuity file.

This file is a router, not an encyclopedia. After reading it, the chat should read the latest continuity file and then only the task-relevant manuals, policy files, or code files.

## Current project phase map

### Phase 1 — Harvesting and rendering: complete
Phase 1 harvested the initial FamilySearch ancestor corpus through the semi-automated Harvester/Navigator workflow and rendered minitrees from Stage 1 slotmaps. The final harvested/rendered minitree in the initial set was Lucy Smith / Lucey Smith, PID `2X9Y-569`. Recent completed roots include Mary Brickett (`LKJ3-G4W`), Isaac Pollard (`2X9Y-5CR`), and Lucy Smith (`2X9Y-569`).

Phase 1 outputs include local/GitHub-mirrored FamilySearch captures, per-person JSONs, relationship links, overlays, Stage 1 slotmaps, and Stage 2 minitree workbooks.

### Phase 1.5 — Rough-spot policy and corpus interpretation: current
Phase 1.5 is the current transition layer between harvesting and analysis. Its job is to review representative slotmaps/minitrees, classify rough spots, and define interpretation rules so later scripts do not silently turn partial or uncertain data into false certainty.

Current Phase 1.5 themes:
- immigrant-boundary overrun
- PID-only / unharvested queue artifacts
- missing birthplace handling
- missing maiden name handling
- duplicate PIDs / pedigree collapse
- place-authority and birthplace classification
- distinction between genealogical correction, analysis annotation, and research lead

### Phase 2 — Analysis and synthesis: next
Phase 2 will analyze the stabilized corpus. It should not begin with interpretive reports until Phase 1.5 has produced enough rules for safe automation.

Likely Phase 2 workstreams include coverage/missingness reports, consolidated unique ancestor table, immigrant-boundary audit, migration/geography summaries, documented origin composition, photos/memories enrichment, and famous-person/Wikidata matching.

## Startup procedure for a new chat
A new chat should usually do the following:

1. Read the governing `00_start_here_*` file.
2. Read the latest continuity file from the previous session.
3. Read the governing `file_index_*` file.
4. Identify the current task category.
5. Read only the task-relevant governing files or code files.

For current Phase 1.5 / Phase 2 startup, the task-relevant governing files are:
- `docs/phase15_rough_spot_policy_260505_v1.md`
- `docs/phase2_analysis_plan_260505_v1.md`
- `docs/phase15_slotmap_review_protocol_260505_v1.md`
- `docs/place_authority_plan_260505_v1.md`

If the task involves Harvester/Navigator, Shuttle, or Slotmap/Treebuilder code modification, read the relevant subsystem manual and then inspect the active code listed in the file index.

## Current caution flags

1. Do not mutate raw harvested FamilySearch-derived person records casually. Raw captures and merged person records are evidence. Prefer overlays and analysis annotations.

2. The active Stage 1 builder currently supports `set_parents` and `exclude_person` overlays. The overlay file already contains an `override_birth_place` precedent, but as of the Lucy Smith review the active builder had not yet been patched/tested to apply `override_birth_place` in generated slotmaps. Treat that as a next-session implementation task, not a completed capability.

3. PID-only rows in slotmaps may come from a known Navigator queue imperfection in which missing-parent situations can feed sibling/child PIDs into the queue. The user often recognized these cases and did not harvest those pages. Treat PID-only rows as structural/unharvested artifacts unless separately reviewed.

4. Immigrant-boundary overrun is an analysis-scope problem, not necessarily a genealogical error. Ancestors beyond a foreign-born immigrant endpoint should be identified and excluded from strict Phase 2 analysis unless the line is deliberately reopened.

5. Duplicate PIDs/couples often represent genuine pedigree collapse/cousin marriage. Do not remove them blindly. Count them differently depending on the analysis.

## Core distinction for rough spots
Rough spots should be classified into three broad handling modes:

1. Genealogical correction: a reviewed change to relationship or identity data. Store in overlay layer; do not rewrite raw harvests.
2. Analysis annotation: an interpretation label used for inclusion, classification, confidence, or analysis mode. It does not claim the FamilySearch record is wrong.
3. Research lead: a plausible clue from Ancestry, WikiTree, FamilySearch hints, Find a Grave, or another source that has not yet been accepted as a correction or annotation.

## Repo roles

### `ancestry_repo`
Operational working repo on the laptop and mirrored to GitHub. It contains scripts, FamilySearch captures, per-person JSONs, links, overlays, builder outputs, templates, and extension ZIPs.

### `genealogy-agent`
Constitutional/reference repo. It contains startup files, manuals, command contracts, playbooks, file indexes, and policy documents intended to reduce dependence on oversized continuity files.

Design intent:
- `genealogy-agent` = durable reference / governing layer
- `ancestry_repo` = operational working layer

## Ethical boundary
All project work should remain within the user’s ethical boundary: personal family-line research, personally supervised, limited to sites the user can ethically access, non-commercial, and not abusive bulk scraping.

## System overview

### Harvester/Navigator
Chrome extension plus local server used to harvest FamilySearch person pages and move through the ancestor queue. It is a semi-automated, human-in-the-loop collection workflow.

### Slotmap / tree-builder
Local Python scripts build a structured Ahnentafel slotmap and render it into a human-readable minitree workbook.

### Shuttle
Local message relay used to reduce friction between ChatGPT, the laptop, CMD, and GitHub mirror actions. Use the Shuttle manual before guessing message contracts.

### Codex
Used for code creation, patching, and debugging. When writing Codex prompts, specify the target filename, prefer versioned new files, and tell Codex not to print the full code at the end unless explicitly needed.

## End-of-session routine
At normal session end, create or update durable governing files when new reusable lessons were learned. A continuity file is still useful when tactical state would otherwise be lost, but the governing layer should carry stable policies, contracts, and startup routing.
