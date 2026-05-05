# Ancestry Project File Index — 260505 v1

## Purpose
This file indexes the currently important operational and constitutional files in the Ancestry Project. It is a fast lookup aid, not a full architecture manual.

## File precedence
Within any constitutional file family, the governing file is the newest `YYMMDD` suffix and, within that date, the highest `_vN` suffix.

## Repo roles

### `genealogy-agent`
Constitutional/reference repo. Holds startup files, subsystem manuals, policy files, playbooks, and indexes.

### `ancestry_repo`
Operational working repo on the laptop and mirrored to GitHub. Holds scripts, captures, people records, links, overlays, builder outputs, templates, and extension ZIPs.

## Current governing constitutional files

### Startup
`docs/00_start_here_260505_v1.md`

Primary startup orientation and routing file.

### File index
`docs/file_index_260505_v1.md`

This file.

### Phase 1.5 rough-spot policy
`docs/phase15_rough_spot_policy_260505_v1.md`

Governing rough-spot categories and handling rules for the post-harvest / pre-analysis transition.

### Phase 2 analysis plan
`docs/phase2_analysis_plan_260505_v1.md`

Governing staged analysis plan for the stabilized corpus.

### Slotmap review protocol
`docs/phase15_slotmap_review_protocol_260505_v1.md`

Practical protocol for reviewing a slotmap/minitree pair during Phase 1.5.

### Place authority plan
`docs/place_authority_plan_260505_v1.md`

Plan/spec for collecting all birthplace/place strings and classifying them for immigrant-boundary and origin analysis.

### Shuttle manual
`docs/shuttle_messages_260412.md`

Current governing Shuttle manual. Legacy date-only name; treat as implicit v1 unless superseded.

### Navigator manual
`docs/navigator_manual_260412.md`

Current governing Navigator manual. Legacy date-only name; treat as implicit v1 unless superseded.

### Slotmap / Treebuilder manual
`docs/slotmap_treebuilder_manual_260412_v1.md`

Current governing builder manual for direct CMD Stage 1/Stage 2 workflow.

### Crash recovery playbook
`docs/playbooks/crash_recovery_windows.md`

Windows CMD workspace recovery instructions.

### Recovery utility
`tools/windows/restore_cmd_windows.bat`

Local batch utility to restore the standard CMD workspace.

## Confirmed active operational files in `ancestry_repo`

### Harvester / Navigator
Server script:
`server\navfix_v0_1_4.py`

Extension ZIP:
`extension\familysearch_dom_capture_tinyloop_v0_1_11.zip`

Read these for queue behavior, harvesting/navigation bugs, immigrant-stop behavior, and extension/server interaction.

### Shuttle
Server script:
`shuttle_server_v24_github_mirror_poc_fix1.py`

Extension ZIP:
`extension\shuttle_workflow_v49.zip`

Known GitHub mirror action:
`{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}`

### Slotmap / Tree Builder
Stage 1 builder:
`builder\stage1_slotmap_v5.py`

Stage 2 renderer:
`builder\stage2_render_landscape_by_slabels_v4_1.py`

Template:
`tree_spreadsheets\landscape_S_template.xlsx`

Known direct CMD Stage 1 pattern:
`cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root <PID> --depth 6`

Known direct CMD Stage 2 pattern:
`cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4_1.py --root <PID> --slotmap <exact_stage1_slotmap_csv> --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx`

## Important recent operational context
Phase 1 minitree harvesting/rendering is complete. The final initial-set minitree was Lucy Smith / Lucey Smith, PID `2X9Y-569`.

Important mirrored Lucy files in `ancestry_repo`:
- `tree_builder_reports/20260504T001108Z/Lucy Smith slotmap.csv`
- `tree_builder_reports/20260504T001108Z/stage1_slotmap.json`
- `tree_builder_reports/20260504T001204Z/Lucy Smith minitree.xlsx`

Recent completed roots:
- Mary Brickett, PID `LKJ3-G4W`
- Isaac Pollard, PID `2X9Y-5CR`
- Lucy Smith, PID `2X9Y-569`

## Current Phase 1.5 cautions
1. `override_birth_place` exists as an overlay precedent, but `stage1_slotmap_v5.py` had not yet been patched/tested to apply it in slotmap output as of the Lucy Smith rough-spot review.
2. Daniel Ladd Sr. (`LRYD-YBN`) is a planned first test case for a birthplace overlay once the builder patch is implemented and tested.
3. PID-only rows should be ignored in Phase 2 analyses unless separately reviewed and harvested.
4. Duplicate PID/couple occurrences should be preserved and counted according to analysis mode, not blindly deduplicated.

## Quick routing guide

### New chat in current project state
Read:
1. `docs/00_start_here_260505_v1.md`
2. latest continuity file, if provided
3. `docs/file_index_260505_v1.md`
4. task-relevant Phase 1.5/Phase 2 files

### Rough-spot review / Phase 1.5
Read:
1. `docs/phase15_rough_spot_policy_260505_v1.md`
2. `docs/phase15_slotmap_review_protocol_260505_v1.md`
3. relevant slotmap CSV / minitree workbook

### Place classification / immigrant-boundary work
Read:
1. `docs/place_authority_plan_260505_v1.md`
2. `docs/phase15_rough_spot_policy_260505_v1.md`
3. relevant slotmaps and people records

### Builder patching or rendering
Read:
1. `docs/slotmap_treebuilder_manual_260412_v1.md`
2. `builder\stage1_slotmap_v5.py`
3. `builder\stage2_render_landscape_by_slabels_v4_1.py`
4. relevant overlays and output files

### Shuttle / GitHub mirror
Read:
1. `docs/shuttle_messages_260412.md`
2. `shuttle_server_v24_github_mirror_poc_fix1.py` if behavior must be verified

## Maintenance rule
If a file version changes and becomes governing, create a new dated/versioned file in the same family. Do not rely on informal names like final, revised, or current.
