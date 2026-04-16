# Ancestry Project File Index — 260415 v1

## Purpose
This is the governing quick index for the currently important constitutional and operational files in the Ancestry Project.

Use it to:
- locate the current governing manuals
- identify the current operational scripts and artifacts
- choose the right file family for the current task
- reduce path guessing during startup and handoff

## Governing precedence
Within each constitutional file family, the governing file is determined:
1. first by date suffix in `YYMMDD` format
2. then by version suffix `vN` within the same date

Older date-only constitutional files should be treated as implicit `v1` unless superseded.

## Current governing constitutional files
### Startup file family
Current governing startup file:
- `docs/00_start_here_260414_v1.md`

### File index family
Current governing file index:
- `docs/file_index_260415_v1.md`

### Shuttle manual family
Current governing Shuttle manual:
- `docs/shuttle_messages_260412.md`

### Navigator manual family
Current governing Navigator manual:
- `docs/navigator_manual_260412.md`

### Slotmap / treebuilder manual family
Current governing builder manual:
- `docs/slotmap_treebuilder_manual_260412_v1.md`

### Playbooks
Current crash recovery playbook:
- `docs/playbooks/crash_recovery_windows.md`

Recovery utility:
- `tools/windows/restore_cmd_windows.bat`

## Unified startup order
A fresh chat should usually start in this order:
1. `docs/00_start_here_260414_v1.md`
2. `docs/file_index_260415_v1.md`
3. latest continuity file
4. immediate task determination
5. only the needed manuals/code

Accordingly, the practical startup packet for future chats should be treated as:
1. `docs/00_start_here_260414_v1.md`
2. `docs/file_index_260415_v1.md`
3. latest continuity file

## Artifact and path reference convention
For important operational artifacts, continuity files should prefer both:
1. the full local Windows path
2. the repo-relative path

Working rule:
- governing startup/index pointers should usually use full repo-qualified GitHub-style paths when helpful
- operational artifacts should usually use full local Windows path plus repo-relative path
- avoid bare filenames when a fuller path is known

This convention is now part of the governing layer because it improves GitHub retrieval, laptop execution, continuity usefulness, and handoff reliability.

## Current caution notes
1. `docs/shuttle_messages_260412.md` and `docs/navigator_manual_260412.md` still use date-only names and should be treated as implicit `v1`
2. Shuttle is validated for GitHub mirror and Navigator reseed, but not yet as the governing path for the slotmap/treebuilder workflow
3. the sibling/child contamination issue in the Navigator queue remains live and tolerated, not solved
4. exact-path retrieval is much stronger than discovery, especially for renamed outputs and binary artifacts
5. when a PID differs slightly from a previously validated PID, do not proceed silently; flag and confirm

## Confirmed active operational files
### Harvester / Navigator
Server script:
- `C:\Users\david\OneDrive\Documents\ancestry_repo\server\navfix_v0_1_4.py`

Extension ZIP:
- `C:\Users\david\OneDrive\Documents\ancestry_repo\extension\familysearch_dom_capture_tinyloop_v0_1_11.zip`

### Shuttle
Server script:
- `C:\Users\david\OneDrive\Documents\ancestry_repo\shuttle_server_v24_github_mirror_poc_fix1.py`

Extension ZIP:
- `C:\Users\david\OneDrive\Documents\ancestry_repo\extension\shuttle_workflow_v49.zip`

### Slotmap / Tree Builder
Stage-1 slotmap builder:
- `C:\Users\david\OneDrive\Documents\ancestry_repo\builder\stage1_slotmap_v5.py`

Stage-2 landscape renderer:
- `C:\Users\david\OneDrive\Documents\ancestry_repo\builder\stage2_render_landscape_by_slabels_v4_1.py`

Template workbook:
- `C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx`

Human-readable saves shelf:
- local path: `C:\Users\david\OneDrive\Documents\ancestry_repo\human readable saves`
- repo-relative concept/path: `human readable saves/`

## Quick routing guide
### If the user wants to start a new chat correctly
Start with:
1. `docs/00_start_here_260414_v1.md`
2. `docs/file_index_260415_v1.md`
3. latest continuity file

### If the user wants Shuttle contracts
Start with:
1. `docs/shuttle_messages_260412.md`
2. the active Shuttle server script
3. the active Shuttle extension ZIP

### If the user wants Navigator reseed or harvesting behavior
Start with:
1. `docs/navigator_manual_260412.md`
2. `docs/shuttle_messages_260412.md` when Shuttle is involved
3. the active Navigator server script
4. the active Navigator extension ZIP

### If the user wants minitree build/render work
Start with:
1. `docs/slotmap_treebuilder_manual_260412_v1.md`
2. `stage1_slotmap_v5.py`
3. `stage2_render_landscape_by_slabels_v4_1.py`
4. `landscape_S_template.xlsx`

## Maintenance rule
If a file becomes the new governing version, create a new dated/versioned file in the same family rather than relying on informal labels.
