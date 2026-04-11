# Ancestry Project File Index — 260411

## Purpose
This file is a quick index of the currently important operational files in the Ancestry Project.

A new chat should use this file when it needs to:
- locate the current script for a subsystem
- inspect a known-working code file
- confirm a contract against source code
- find the current builder scripts and template
- understand which repo/file is likely relevant to the current task

This file is not a full architecture manual. It is a fast lookup aid.

## File dating and precedence rule
Constitutional/reference files in this repo should use a date suffix in **YYMMDD** format.

Examples:
- `00_start_here_260411.md`
- `file_index_260411.md`
- `shuttle_messages_260411.md`

Within any file family, the file with the most recent date suffix is the governing version unless the file explicitly states otherwise.

This dating rule is preferred over ad hoc labels like `final`, `new`, `revised`, or informal version names.

---

## Repo roles

### `ancestry_repo`
Operational working repo on the laptop and mirrored to GitHub.
Contains scripts, captures, builder inputs/outputs, templates, and extension ZIPs.

### `genealogy-agent`
Constitutional/reference repo.
Intended to hold startup files, manuals, contracts, playbooks, and indexes like this one.

---

## Confirmed active files

### Harvester / Navigator
**Server script**
`C:\Users\david\OneDrive\Documents\ancestry_repo\server\navfix_v0_1_4.py`

Purpose:
Current known-working/active Harvester-Navigator server candidate for queue hygiene and mini-tree harvesting.

When to read:
- Navigator reseed questions
- queue behavior
- immigrant-stop behavior
- birth-year filter behavior
- harvesting/navigation bugs

**Extension ZIP**
`C:\Users\david\OneDrive\Documents\ancestry_repo\extension\familysearch_dom_capture_tinyloop_v0_1_11.zip`

Purpose:
Current known-working/active Harvester-Navigator extension package.

When to read:
- extension UI/button behavior
- capture flow
- browser-side harvesting logic
- extension/server integration questions

---

### Shuttle Message System
**Server script**
`C:\Users\david\OneDrive\Documents\ancestry_repo\shuttle_server_v24_github_mirror_poc_fix1.py`

Purpose:
Current known-working Shuttle server script.

Important known fact:
This script supports the GitHub mirror action as:
- `target: "cmd"`
- `action: "github_mirror"`

When to read:
- Shuttle message contract questions
- GitHub mirror questions
- supported Shuttle target/action families
- clipboard/file return behavior
- debugging Shuttle command failures

**Extension ZIP**
`C:\Users\david\OneDrive\Documents\ancestry_repo\extension\shuttle_workflow_v49.zip`

Purpose:
Current known-working Shuttle extension package.

When to read:
- browser-side Shuttle message detection/handling
- numbering/injection behavior
- extension/server interaction questions

---

### Slotmap / Tree Builder
**Stage-1 slotmap builder**
`C:\Users\david\OneDrive\Documents\ancestry_repo\builder\stage1_slotmap_v5.py`

Purpose:
Builds the ancestor slotmap from repo-local inputs.

Known practical contract:
Run from repo root with:
- `--root`
- `--depth`

The script auto-reads:
- `people/`
- `links/links_all.jsonl`
- auto-detected stoplist/overlay files if present

When to read:
- slotmap contract questions
- parent assignment behavior
- stoplist behavior
- stage-1 output structure

**Stage-2 landscape renderer**
`C:\Users\david\OneDrive\Documents\ancestry_repo\builder\stage2_render_landscape_by_slabels_v4_1.py`

Purpose:
Renders a stage-1 slotmap CSV into a human-readable landscape workbook using the template.

Known practical contract:
Run from repo root with:
- `--root`
- `--slotmap`
- `--template`

When to read:
- tree rendering questions
- workbook output structure
- stage-2 contract questions

**Template workbook**
`C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx`

Purpose:
Landscape spreadsheet template used by stage 2.

When to read/use:
- tree rendering runs
- template-layout questions
- slot label placement questions

---

## Playbooks and recovery files

### Crash recovery playbook
**Playbook**
`docs/playbooks/crash_recovery_windows.md`

Purpose:
Documents how to restore the standard Windows CMD workspace after a crash, reboot, or accidental closure of the working command windows.

When to read:
- post-crash recovery
- restoring the standard four-window CMD layout
- understanding which local windows normally support operations
- checking which server filenames and repo-root shell windows are part of the normal workspace

**Batch utility**
`tools/windows/restore_cmd_windows.bat`

Purpose:
One-click local utility that restores the standard four CMD windows used in normal operation.

When to read/use:
- immediately after a crash
- when rebuilding the local shell environment
- when verifying the current standard CMD workspace layout

---

## Quick routing guide

### If the user wants to harvest or navigate FamilySearch ancestors
Start with:
1. `navfix_v0_1_4.py`
2. `familysearch_dom_capture_tinyloop_v0_1_11.zip`

### If the user wants to mirror the laptop repo to GitHub using Shuttle
Start with:
1. the most recent dated Shuttle manual
2. `shuttle_server_v24_github_mirror_poc_fix1.py`
3. `shuttle_workflow_v49.zip`

### If the user wants to build or render a mini-tree
Start with:
1. `stage1_slotmap_v5.py`
2. `stage2_render_landscape_by_slabels_v4_1.py`
3. `landscape_S_template.xlsx`

### If the user wants to recover the normal Windows CMD workspace after a crash
Start with:
1. `docs/playbooks/crash_recovery_windows.md`
2. `tools/windows/restore_cmd_windows.bat`

---

## Known-good operational notes

### GitHub mirror via Shuttle
Known-good Shuttle contract as of April 2026:
```json
_SHUTTLE_MESSAGE_00002_
{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}
```

Important pitfall:
GitHub mirror is **not** a `repo` action. It is a `cmd` action.

### Stage-1 slotmap build pattern
Known-good pattern:
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root <PID> --depth 6
```

### Stage-2 render pattern
Known-good pattern:
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4_1.py --root <PID> --slotmap <slotmap_csv_path> --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

---

## Maintenance rule
If a file version changes and becomes the new governing version, create a new dated file in the same family rather than relying on informal naming.

If a future chat gets lost looking for a script that should have been obvious, that is evidence that this file should be improved.
