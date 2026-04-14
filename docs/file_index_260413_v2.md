# Ancestry Project File Index — 260413 v2

## Purpose
This file is a quick index of the currently important operational and constitutional files in the Ancestry Project.

A new chat should use this file when it needs to:
- locate the current script for a subsystem
- inspect a known-working code file
- confirm a contract against source code
- find the current manuals and playbooks
- understand which repo/file is likely relevant to the current task

This file is not a full architecture manual. It is a fast lookup aid.

## File dating, versioning, and precedence rule
Constitutional/reference files in this repo should use a filename suffix in this form:

`YYMMDD_vN`

Examples:
- `00_start_here_260413_v2.md`
- `file_index_260413_v2.md`
- `shuttle_messages_260412_v1.md`
- `slotmap_treebuilder_manual_260412_v1.md`

Within any file family, precedence is determined:
1. first by date suffix in `YYMMDD` format
2. then by version suffix `vN` within the same date

The governing file is therefore:
- the most recent date
- and, if multiple files share that date, the highest version number

### Legacy note
Older constitutional files created before this rule may use only the date suffix.
Those should be treated as implicitly `v1` for their date unless a later file supersedes them.

---

## Repo roles

### `ancestry_repo`
Operational working repo on the laptop and mirrored to GitHub.
Contains scripts, captures, builder inputs/outputs, templates, and extension ZIPs.

### `genealogy-agent`
Constitutional/reference repo.
Intended to hold startup files, manuals, contracts, playbooks, and indexes like this one.

---

## Current caution notes for a fresh chat
1. Two current governing manuals still use date-only names rather than the newer `YYMMDD_vN` pattern:
   - `docs/shuttle_messages_260412.md`
   - `docs/navigator_manual_260412.md`
   These should be treated as implicit `v1` unless superseded.

2. Shuttle is validated for GitHub mirror and Navigator reseed, but **not** yet for the governing slotmap/treebuilder workflow.
   The builder workflow should still be treated as direct CMD unless and until Shuttle is separately revalidated for that path.

3. The sibling/child contamination issue in the Navigator queue is still a live known imperfection.
   It is currently tolerated, not solved.

4. Use manuals for recurring contracts and routine workflows.
   Use live code when the task is debugging, when the manual is silent, or when observed behavior contradicts documentation.

5. GitHub retrieval is much more reliable when the exact repo path or URL is known.
   Discovery is weaker than retrieval, especially for renamed outputs, folders, and binary artifacts such as `.xlsx`.
   Prefer explicit paths from continuity files, inventories, file indexes, or the user.

6. When a PID differs slightly from a previously validated PID, do not proceed silently.
   Flag the discrepancy and ask the user to confirm before using the new PID in commands, file references, or reasoning.

---

## Governing constitutional files currently known

### Startup file family
**Current governing startup file**
`docs/00_start_here_260413_v2.md`

Purpose:
Primary startup orientation and routing file for new chats.

### File index family
**Current governing file index**
`docs/file_index_260413_v2.md`

Purpose:
Fast lookup file for manuals, scripts, templates, and known-working operational artifacts.

### Shuttle manual family
**Current governing Shuttle manual**
`docs/shuttle_messages_260412.md`

Purpose:
Records the currently validated Shuttle message patterns for common recurring tasks, including GitHub mirror and Navigator reseed.

Note:
This file predates the `_vN` suffix rule and should be treated as implicit `v1` for its date.

### Navigator manual family
**Current governing Navigator manual**
`docs/navigator_manual_260412.md`

Purpose:
Records the currently validated operational contract for Navigator queue reset and reseed.

Note:
This file predates the `_vN` suffix rule and should be treated as implicit `v1` for its date.

### Slotmap / Treebuilder manual family
**Current governing builder manual**
`docs/slotmap_treebuilder_manual_260412_v1.md`

Purpose:
Records the currently validated CMD workflow for Stage 1 slotmap build and Stage 2 landscape minitree render.

### Playbooks
**Crash recovery playbook**
`docs/playbooks/crash_recovery_windows.md`

Purpose:
Documents how to restore the standard Windows CMD workspace after a crash, reboot, or accidental closure of the working command windows.

### Recovery utility
**Batch utility**
`tools/windows/restore_cmd_windows.bat`

Purpose:
One-click local utility that restores the standard four CMD windows used in normal operation.

---

## Confirmed active operational files

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

It also supports Navigator control indirectly via:
- `target: "cmd"`
- `action: "http_test"`
- POST to `http://127.0.0.1:5000/nav_control`

When to read:
- Shuttle message contract questions
- GitHub mirror questions
- Navigator control through Shuttle
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

**Human-readable saves shelf**
Local working path:
`C:\Users\david\OneDrive\Documents\ancestry_repo\human readable saves`

Repo-relative concept/path:
`human readable saves/`

Purpose:
Validated slotmaps and minitrees are renamed with seed-ancestor names and preserved in this human-readable destination in the operational repo.
This is the durable human-facing shelf for final named outputs.

When to rely on it:
- when continuity mentions a validated finished artifact
- when a future chat needs the stable named output rather than a transient generic report filename
- when a file path should be recorded explicitly for later retrieval

---

## Quick routing guide

### If the user wants to start a new chat correctly
Start with:
1. `docs/00_start_here_260413_v2.md`
2. latest continuity file
3. `docs/file_index_260413_v2.md`

### If the user wants to mirror the laptop repo to GitHub using Shuttle
Start with:
1. `docs/shuttle_messages_260412.md`
2. `shuttle_server_v24_github_mirror_poc_fix1.py`
3. `shuttle_workflow_v49.zip`

### If the user wants to clear and reseed the Navigator queue
Start with:
1. `docs/navigator_manual_260412.md`
2. `docs/shuttle_messages_260412.md`
3. `server/navfix_v0_1_4.py`

### If the user wants to harvest or navigate FamilySearch ancestors
Start with:
1. `docs/navigator_manual_260412.md`
2. `navfix_v0_1_4.py`
3. `familysearch_dom_capture_tinyloop_v0_1_11.zip`

### If the user wants to build or render a minitree
Start with:
1. `docs/slotmap_treebuilder_manual_260412_v1.md`
2. `stage1_slotmap_v5.py`
3. `stage2_render_landscape_by_slabels_v4_1.py`
4. `landscape_S_template.xlsx`

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

### Navigator queue reset / reseed via Shuttle
Known-good Shuttle contract as of 260412:
```json
_SHUTTLE_MESSAGE_00003_
{"target":"cmd","action":"http_test","request":{"host":"127.0.0.1","port":5000,"method":"POST","path":"/nav_control","json_body":{"action":"reset_to_pid","pid":"K1W8-HXS"}},"return_mode":"clipboard","clipboard_format":"json_pretty"}
```

General reusable pattern:
```json
_SHUTTLE_MESSAGE_<NNNNN>_
{"target":"cmd","action":"http_test","request":{"host":"127.0.0.1","port":5000,"method":"POST","path":"/nav_control","json_body":{"action":"reset_to_pid","pid":"<PID>"}},"return_mode":"clipboard","clipboard_format":"json_pretty"}
```

### Stage-1 slotmap build pattern
Known-good pattern:
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root <PID> --depth 6
```

Live validated example:
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root K1W8-HXS --depth 6
```

### Stage-2 render pattern
Known-good pattern:
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4_1.py --root <PID> --slotmap C:\Users\david\OneDrive\Documents\ancestry_repo\tree_builder_reports\<STAMP>\stage1_slotmap.csv --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

Live validated example:
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4_1.py --root K1W8-HXS --slotmap C:\Users\david\OneDrive\Documents\ancestry_repo\tree_builder_reports\20260412T010053Z\stage1_slotmap.csv --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

### Important builder note
As of 260413, the governing slotmap/treebuilder workflow is validated through direct CMD commands, not Shuttle. The current Shuttle server’s builder allowlist appears to target an older builder pipeline and should not yet be treated as governing for slotmap/treebuilder work.

### Continuity-writing operational note
A continuity file should make the next startup easier, not harder.
When naming important files for the next chat, prefer full repo-qualified or repo-relative paths rather than bare filenames.
The next chat should be able to use those paths with GitHub retrieval directly, or else know to pause and ask the user if a path is missing or unclear.

---

## Maintenance rule
If a file version changes and becomes the new governing version, create a new dated/versioned file in the same family rather than relying on informal naming.

If a future chat gets lost looking for a script or manual that should have been obvious, that is evidence that this file should be improved.
