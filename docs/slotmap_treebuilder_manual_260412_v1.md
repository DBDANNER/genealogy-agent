# Slotmap / Treebuilder Manual — 260412 v1

## Purpose
This manual records the current working operational contract for building a slotmap and then rendering a human-readable minitree from existing Harvester / Navigator outputs in the local repo.

It is meant to let a new chat recover the common builder workflow without re-deriving it from source code.

This version covers the currently validated non-Shuttle workflow:
1. Stage 1 slotmap build
2. Stage 2 landscape minitree render

## File dating, versioning, and precedence rule
This file belongs to the `slotmap_treebuilder_manual_YYMMDD_vN.md` family.

Within that family, precedence is determined first by date suffix in `YYMMDD` format, then by version suffix `vN` within the same date. The governing file is the most recent date and, within that date, the highest version number.

## When to use this manual
Use this manual when the user wants to:
- build a slotmap from already harvested local ancestry data
- render a landscape minitree from that slotmap
- validate a harvested line against a paper tree or known family structure
- recover the exact CMD contract for the builder pipeline

## Important scope note
This manual describes the current **CMD window / local Python** workflow.

As of 260412, the current Shuttle server is **not yet validated** for the governing slotmap/treebuilder scripts. The Shuttle builder allowlist appears to point to an older builder path, so the governing workflow remains the direct CMD approach for now.

## Governing files for this workflow
Current known-working scripts and template:
- `builder\stage1_slotmap_v5.py`
- `builder\stage2_render_landscape_by_slabels_v4_1.py`
- `tree_spreadsheets\landscape_S_template.xlsx`

Repo root:
- `C:\Users\david\OneDrive\Documents\ancestry_repo`

## Workflow summary
### Stage 1
Build the slotmap from repo-local ancestry data.

### Stage 2
Render the slotmap into a human-readable landscape workbook using the landscape S template.

## Stage 1 — slotmap build

### Purpose
Build a 127-slot ancestor map rooted at a specified PID using local repo data already harvested by the Harvester / Navigator workflow.

### Inputs needed
- root PID
- depth value

Common validated depth:
- `6`

### Current validated command pattern
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root <PID> --depth 6
```

### Live validated example
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root K1W8-HXS --depth 6
```

### What success looks like
Stage 1 should typically print:
- `root_pid: <PID>`
- `depth: 6`
- `slots_total: 127`
- `filled_pids: <number>`
- `unknown_placeholders: <number>`
- `stoplist_pids: <number>`
- `output_csv: <full path to stage1_slotmap.csv>`
- `output_json: <full path to stage1_slotmap.json>`

### Live validated example result for `K1W8-HXS`
- `slots_total: 127`
- `filled_pids: 49`
- `unknown_placeholders: 0`
- `stoplist_pids: 5`
- stoplist file used: `commentary_overlay\ancestor_stop_list.jsonl`
- output folder: `tree_builder_reports\20260412T010053Z\`
- output CSV: `tree_builder_reports\20260412T010053Z\stage1_slotmap.csv`
- output JSON: `tree_builder_reports\20260412T010053Z\stage1_slotmap.json`
- reported mode: `{"parent_assignment_mode": "sex_based"}`

### Interpretation notes
- `slots_total: 127` is expected for depth 6.
- `filled_pids` will vary depending on how complete the harvested line is.
- sparse output is not necessarily an error; later immigration and stoplists can reduce fill.
- the stoplist overlay may be used automatically even if the user is not actively thinking about overlays.

## Stage 2 — landscape minitree render

### Purpose
Render the Stage 1 slotmap CSV into a readable Excel workbook using the landscape S template.

### Inputs needed
- root PID
- full path to the `stage1_slotmap.csv` produced by Stage 1
- full path to the template workbook

### Current validated command pattern
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4_1.py --root <PID> --slotmap C:\Users\david\OneDrive\Documents\ancestry_repo\tree_builder_reports\<STAMP>\stage1_slotmap.csv --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

### Live validated example
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4_1.py --root K1W8-HXS --slotmap C:\Users\david\OneDrive\Documents\ancestry_repo\tree_builder_reports\20260412T010053Z\stage1_slotmap.csv --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

### What success looks like
Stage 2 should typically print:
- `output_xlsx: <full path>`
- `tree_cells_written: <number>`
- `tree_cells_blanked: <number>`
- `metadata_sheet: _slotmap (hidden, regenerated)`

### Live validated example result for `K1W8-HXS`
- output workbook folder: `tree_builder_reports\20260412T010301Z\`
- output workbook: `tree_builder_reports\20260412T010301Z\K1W8-HXS_landscape.xlsx`
- `tree_cells_written: 31`
- `tree_cells_blanked: 96`
- metadata sheet regenerated: `_slotmap`

## Human validation outcome
The resulting minitree for `K1W8-HXS` was checked by the user against the paper tree and judged:
- human-readable
- structurally correct
- a perfect match to the expected tree

That is a strong live validation of the current Stage 1 + Stage 2 contract for this line.

## Practical operating notes
- Run Stage 1 first.
- Use the exact output folder reported by Stage 1 when constructing the Stage 2 `--slotmap` path.
- Do not guess the Stage 2 slotmap path before Stage 1 finishes.
- The template path is stable and should usually be:
  `C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx`

## Common pitfalls
- Using the wrong Stage 2 script version.
- Pointing Stage 2 to the wrong slotmap CSV path.
- Forgetting that the builder operates from existing local repo data; it does not need raw harvest pasted into chat.
- Treating sparse trees as automatic failure when later immigration or stoplist logic may explain them.
- Assuming Shuttle can already run this exact governing workflow; that still requires a later patch/validation.

## Related files
- Startup file family: `00_start_here_YYMMDD_vN.md`
- File index family: `file_index_YYMMDD_vN.md`
- Shuttle manual family: `shuttle_messages_YYMMDD_vN.md`
- Navigator manual family: `navigator_manual_YYMMDD_vN.md`

## Summary
The currently validated governing builder workflow is:

### Stage 1
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root <PID> --depth 6
```

### Stage 2
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4_1.py --root <PID> --slotmap C:\Users\david\OneDrive\Documents\ancestry_repo\tree_builder_reports\<STAMP>\stage1_slotmap.csv --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

For `K1W8-HXS`, this workflow produced a correct, human-readable minitree that matched the user’s paper tree perfectly.
