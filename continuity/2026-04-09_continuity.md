# Continuity File — 2026-04-09

## Session focus
1. Process two harvested FamilySearch mini-trees through the slotmap/tree-builder pipeline.
2. Reconstruct the slotmap command contract.
3. Discuss redesign of the continuity system using GitHub-hosted “constitutional files” plus lighter continuity handoffs.
4. Test whether Google Drive write access is currently available for future weekly constitutional backups.

## Key conclusions reached
- The stage-1 slotmap command contract was successfully re-established.
- The builder does **not** need dozens of ancestor JSON files pasted into chat when run on the laptop; it relies on the already-populated local repo state.
- The relevant contract for stage 1 is repo-root execution with only `--root` and `--depth`; the script then auto-reads local `people/`, `links/links_all.jsonl`, and any auto-detected stoplist/overlay files.
- The recent birth-year patch appears to have done its job for the harvested mini-tree(s): the unwanted non-ancestor/sibling-child contamination did **not** appear in tonight’s queue/build results.
- The continuity concept should likely be split into:
  - **Constitutional files** = durable contracts/architecture/playbooks/index in GitHub.
  - **Continuity file** = short tactical handoff for current checkpoint / next steps.

## Slotmap / builder contract re-established tonight
### Confirmed stage-1 pattern
Example prior command recovered from earlier chat:
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root 2Q1D-8WD --depth 6
```

### Commands run tonight
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root LCVT-GMH --depth 6
```

```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage1_slotmap_v5.py --root KVGS-BMK --depth 6
```

### Stage-1 results
- `LCVT-GMH`
  - `slots_total: 127`
  - `filled_pids: 19`
  - `unknown_placeholders: 0`
  - `stoplist_pids: 5`
  - output folder: `tree_builder_reports\20260410T011214Z\`
- `KVGS-BMK`
  - `slots_total: 127`
  - `filled_pids: 69`
  - `unknown_placeholders: 0`
  - `stoplist_pids: 5`
  - output folder: `tree_builder_reports\20260410T011351Z\`

### Important nuance discovered
Even though user said no commentary overlays were “in play,” the slotmap script auto-detected and used:
`commentary_overlay\ancestor_stop_list.jsonl`
This mattered because both runs reported `stoplist_pids: 5`.

## Stage-2 render contract re-established tonight
### Commands run tonight
```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4.py --root LCVT-GMH --slotmap C:\Users\david\OneDrive\Documents\ancestry_repo\tree_builder_reports\20260410T011214Z\stage1_slotmap.csv --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

```cmd
cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python builder\stage2_render_landscape_by_slabels_v4.py --root KVGS-BMK --slotmap C:\Users\david\OneDrive\Documents\ancestry_repo\tree_builder_reports\20260410T011351Z\stage1_slotmap.csv --template C:\Users\david\OneDrive\Documents\ancestry_repo\tree_spreadsheets\landscape_S_template.xlsx
```

### Stage-2 results
- `LCVT-GMH`
  - output workbook: `tree_builder_reports\20260410T011924Z\LCVT-GMH_landscape.xlsx`
  - `tree_cells_written: 11`
  - `tree_cells_blanked: 116`
  - hidden `_slotmap` metadata sheet regenerated
  - sparse tree expected because immigrant stop is more recent in this line
- `KVGS-BMK`
  - output workbook: `tree_builder_reports\20260410T012413Z\KVGS-BMK_landscape.xlsx`
  - `tree_cells_written: 39`
  - `tree_cells_blanked: 88`
  - hidden `_slotmap` metadata sheet regenerated
  - denser tree looked coherent and human-readable

## Validation outcome
- User compared the mini-trees conceptually against pre-existing paper trees and agreed both outputs looked good.
- The Harvester/Navigator remains highly valuable because the mini-trees now carry PIDs, vitals, and relationship structure rather than names only.

## Constitutional-file discussion — conclusions so far
### Proposed high-level model
Move stable project knowledge out of bloated continuity bundles and into a GitHub-hosted constitutional layer.

### New split
1. **Constitutional repo/docs** (durable, slowly changing)
   - architecture
   - command contracts
   - startup index
   - playbooks
   - repo map
   - common recurring workflows
2. **Continuity file** (short, tactical, current)
   - where we are
   - what worked / failed
   - active files
   - latest validated commands
   - next step

### Why this change is needed
- New chats repeatedly have to reconstruct the same recurring contracts (slotmap, shuttle messages, navigator reseed, etc.).
- This makes work that is smooth in one chat become “archaeological” in the next.
- User expects to perform shuttle messaging, Navigator reseeding, and slotmap/tree building many more times, so recurring contracts need durable storage.

## GitHub findings
- Assistant successfully accessed files in GitHub tonight.
- Visible repos:
  - `DBDANNER/ancestry_repo`
  - `DBDANNER/genealogy-agent`
- New idea agreed in principle:
  - `genealogy-agent` can likely become the constitutional/reference repo.
  - `ancestry_repo` can likely hold a small daily-backup area for constitutional snapshots.

## Backup model discussed
### Working proposal
- **Primary live constitutional files**: GitHub repo `genealogy-agent`
- **Daily backup**: a small dedicated folder/area in `ancestry_repo`
- **Weekly backup**: Google Drive if possible; manual is acceptable because weekly effort is low

### Important reasoning
- User does **not** want the constitutional files stored on the laptop just for the sake of storing them there, since the assistant will consume them through GitHub, not local laptop access.
- A second GitHub repo is meaningful backup **if** it is used as a snapshot/archive layer rather than an always-in-lockstep mirror.

## Google Drive write test
### What happened
- Attempted least-risk test: create a tiny Google Doc in Drive.
- A permission/consent box appeared.
- User clicked **Continue**.
- Screen became fuzzy / overlay-like and then cleared when clicked aside, but the authorization did not complete.

### Current interpretation
- Drive write access is **not currently reliable/confirmed** in this session.
- The issue appears to be incomplete OAuth/consent flow rather than definitive lack of feature.
- Conclusion: do **not** rely on automatic Drive backup yet.
- Manual weekly upload remains acceptable fallback.

## Strong candidate constitutional file set to discuss next session
Potential structure (not yet finalized):
- `docs/00_start_here.md`
- `docs/contracts/shuttle_messages.md`
- `docs/contracts/navigator.md`
- `docs/contracts/slotmap_builder.md`
- `docs/architecture/harvester_navigator_system.md`
- `docs/architecture/repo_map.md`
- `docs/playbooks/common_tasks.md`

## Topics explicitly deferred to next session
1. Detailed contract discussion for constitutional files
2. Backup design refinement
3. Index-file design
4. “Starting file” / startup file design for new chats
5. Internet search: investigate whether other people are using repo-hosted project constitutions / operational handbooks / AI memory layers in similar ways, and what patterns they use

## Active files / outputs from tonight
### Inputs used
- continuity bundle ZIP from prior chat
- `builder/stage1_slotmap_v5.py`
- `builder/stage2_render_landscape_by_slabels_v4.py`
- links file
- template workbook: `tree_spreadsheets\landscape_S_template.xlsx`

### New outputs produced on laptop
- `tree_builder_reports\20260410T011214Z\stage1_slotmap.csv`
- `tree_builder_reports\20260410T011214Z\stage1_slotmap.json`
- `tree_builder_reports\20260410T011351Z\stage1_slotmap.csv`
- `tree_builder_reports\20260410T011351Z\stage1_slotmap.json`
- `tree_builder_reports\20260410T011924Z\LCVT-GMH_landscape.xlsx`
- `tree_builder_reports\20260410T012413Z\KVGS-BMK_landscape.xlsx`

## Status note for constitutional files
As of this handoff point, the constitutional starter files were drafted but not yet confirmed as installed in `genealogy-agent`.

That means the conceptual split was agreed, but the operational installation step still remained to be completed.

## Recommended startup for next chat
1. Read this continuity file.
2. Re-anchor on constitutional-file redesign.
3. Confirm whether `genealogy-agent` will be the live constitutional repo and whether `ancestry_repo` will hold the daily backup area.
4. Discuss exact folder layout and minimal initial file set.
5. Do light web research on analogous systems before writing final contract docs.

## Bottom line
Tonight successfully restored the slotmap/tree-builder contract, validated two mini-tree builds, gave evidence that the birth-year patch is helping, and pushed the project toward a more durable GitHub-based constitutional memory model with lighter continuity files.
