# Ancestry Project — Start Here — 260413 v2

## Purpose of this file
This file is the startup orientation document for new chats working on the Ancestry Project. It is meant to provide enough context to orient a new chat quickly, without forcing full restoration of every subsystem at startup.

This file is **not** the full operating manual for every system. It is a routing document. After reading this file, the chat should decide which specialized manual(s) are needed for the current task and fetch only those.

At the start of a new chat, the recommended pattern is:
1. Read this file.
2. Read the continuity file from the previous session.
3. Identify the task of the current session.
4. Read only the relevant manual(s), playbook(s), or code file(s) needed for that task.
5. Avoid unnecessary reconstruction of unrelated subsystems.

At the end of each chat, this file and the associated constitutional/manual files may be updated if doing so improves future startup accuracy or reduces repeated confusion.

## Current cautions for a fresh chat
These are current caution flags that should be kept in mind during startup:

1. Two current governing manuals still use date-only names rather than the newer `YYMMDD_vN` pattern:
   - `docs/shuttle_messages_260412.md`
   - `docs/navigator_manual_260412.md`
   These should be treated as implicit `v1` for their date unless superseded.

2. Shuttle is currently validated for GitHub mirror and Navigator reseed, but **not** yet for the governing slotmap/treebuilder workflow.
   A fresh chat should not assume that Shuttle governs the current slotmap/treebuilder path.
   The current governing builder workflow remains direct CMD.

3. The sibling/child contamination issue in the Navigator queue is still a live known imperfection.
   It is currently tolerated because it is visually obvious against the paper tree and does not block productive work.
   It should not be mistaken for solved.

4. GitHub retrieval works best when the exact repo path or file URL is already known.
   Discovery is weaker than retrieval, especially for renamed artifacts, folders, and binary files such as `.xlsx`.
   A fresh chat should prefer file indexes, inventories, continuity-file paths, and user-supplied paths over guessing.

## File dating, versioning, and precedence rule
Constitutional/reference files in this repo should use a filename suffix in this form:

`YYMMDD_vN`

Examples:
- `00_start_here_260413_v2.md`
- `file_index_260413_v2.md`
- `shuttle_messages_260412_v1.md`
- `navigator_manual_260412_v1.md`

Within any file family, precedence is determined:
1. first by date suffix in `YYMMDD` format
2. then by version suffix `vN` within the same date

The governing file is therefore:
- the most recent date
- and, if multiple files share that date, the highest version number

This rule is preferred over ad hoc labels like `final`, `new`, `revised`, or informal version names.

### Legacy note
Older constitutional files created before this rule may use only the date suffix.
Those should be treated as implicitly `v1` for their date unless a later file supersedes them.

## Canonical startup packet for a fresh chat
Unless a later constitutional file supersedes this section, the preferred startup packet is:

1. The most recent governing `00_start_here_*` file using the date/version precedence rule
2. The latest continuity file
3. The most recent governing `file_index_*` file using the date/version precedence rule
4. Task-specific manual(s) only as needed
5. Code files only if the task requires contract verification or debugging

Special rule:
- If the task involves Shuttle, read the most recent governing Shuttle manual before guessing any Shuttle contract.

## Project goals

### Primary goal
The primary goal of the Ancestry Project is to help the user harvest, structure, store, and analyze ancestor data from online ancestry sites, especially FamilySearch and Ancestry, in a machine-readable form under the user’s control.

The user already has access to a large documented family tree online. Small-scale inspection of that tree is easy, but large-scale analysis is difficult without structured local data. The purpose of the project is to reduce the burden of manual copying and transform harvestable ancestry data into a form suitable for later analysis.

### Secondary goal
The secondary goal is to improve the tools and workflows that support the primary goal. This includes improving the interaction among ChatGPT, the user, Codex, GitHub, Google Drive, and local server/extension tools.

This goal is active, not complete. If a new tool, workflow, or improvement would materially reduce friction or improve reliability, it is within scope to pursue it.

## Ethical boundary
All actions in this project should remain within the user’s ethical boundary.

The user wants ancestor harvesting to remain:
- limited to his own family lines
- personally supervised
- limited to sites he can ethically access, including paid sites for which he has a subscription
- used only for personal, non-commercial analysis
- performed in a way that does not suggest abusive scraping or non-human bulk extraction

The project should favor semi-automated, human-in-the-loop collection rather than indiscriminate scraping.

## Repo roles

### `ancestry_repo`
This is the operational working repo. It contains scripts, harvest outputs, builder inputs/outputs, and other files that may need to run on the laptop.

Use cases:
- active Python scripts
- FamilySearch capture artifacts
- builder outputs
- daily mirror/backup of laptop work
- possible daily backup location for constitutional files stored elsewhere

### `genealogy-agent`
This repo is intended to become the constitutional/reference repo.

Use cases:
- startup file family
- subsystem manuals
- command-contract files
- architecture notes
- playbooks
- file indexes
- other durable “memory/context” files intended to reduce dependence on oversized continuity files

The design intent is:
- `genealogy-agent` = durable reference layer
- `ancestry_repo` = operational working layer

## Current status of the constitutional layer
At this stage, the constitutional files should be treated as drafted starter documents that are now beginning to be installed into `genealogy-agent`.

They are:
- authoritative enough to use as the current reference layer
- expected to improve over time as startup friction reveals gaps
- intended to be read by filename date/version precedence within each file family

A useful shorthand:
- file index = authoritative when it is the governing file in its family
- startup/manual files = current working constitutional documents when they are the governing files in their families
- folder structure = useful, but filename precedence is the primary authority rule

Important clarification:
The constitutional layer is meant to reduce startup friction and preserve recurring contracts.
It is **not** meant to replace continuity files.
Continuity files remain the primary carrier of tactical state, current momentum, deferred observations, and session-to-session trajectory.

## Boundary rule: constitutional material versus case-specific material
The constitutional layer should hold recurring contracts, routing rules, stable workflows, manuals, startup guidance, and other durable operational knowledge.

Continuity files and operational artifacts should hold tactical state, current momentum, deferred observations, and case-specific genealogical findings.

A useful rule of thumb:
- constitutional files = recurring system knowledge
- continuity files = current-session trajectory and live work state
- genealogy-specific corrections or evidence disputes = usually continuity or a dedicated operational evidence artifact, not the constitutional layer

When an item seems to sit near the boundary between those categories, the default response should be to pause and ask the user how it should be classified rather than guessing.

## Startup procedure for a new chat
A new chat should usually do the following:

1. Read the governing startup file.
2. Read the continuity file from the previous session.
3. Determine the current task category, for example:
   - Harvester/Navigator work
   - Slotmap/tree-builder work
   - Shuttle work
   - Codex prompt work
   - constitutional file / GitHub memory work
4. Read only the manual(s) needed for that task.
5. If needed, consult the governing file index and fetch the relevant code file(s) from GitHub.
6. Avoid reading deeply into unrelated systems unless the user asks.

Default assumption when the user names no task:
- treat ancestry operational work as the main line
- then determine whether the practical task is harvesting, tree validation, or debugging
- treat constitutional-layer refinement as a support track unless the continuity file or user request indicates otherwise

The continuity file should provide **current position and trajectory**.
This file should provide **architecture, terminology, and routing**.
The manuals should provide **operational detail**.
The file index should provide the **current governing-in-practice working set**.

## PID discipline rule
This project is heavily PID-dependent, and one-character transcription mistakes can derail reseed commands, harvesting, file lookup, and validation.

When a PID newly typed in conversation differs slightly from a previously validated PID in the current session or continuity context, the default response should be conservative.
The chat should not silently propagate the new PID into commands, file references, or conclusions.

Default behavior:
- prefer previously validated in-session or continuity-context PIDs over newly mistyped-looking variants
- explicitly flag the discrepancy
- pause and ask the user to confirm before proceeding

The purpose of this rule is to prevent small typing errors from becoming operational errors.

## System overview

### Harvester/Navigator system
Purpose:
Harvest ancestor data from FamilySearch, starting from a seed ancestor PID, and navigate ancestor-by-ancestor through the tree.

High-level structure:
- Chrome extension
- local server in CMD
- user clicks extension controls to harvest and move to the next ancestor

Conceptual behavior:
- start from a seed ancestor PID
- harvest page data, including parent PIDs
- add parents to the queue
- move to the next ancestor page
- continue until stopping conditions are reached, such as broken branches or immigrant boundaries

Important note:
This overview is only for orientation. If the current chat needs to operate or modify this system, it should read the relevant Harvester/Navigator manual and, if needed, inspect the currently relevant extension/server code via the file index.

### Slotmap / tree-builder system
Purpose:
Build a structured ancestor slotmap and then render that slotmap into a human-readable mini-tree spreadsheet.

Important clarification:
This is primarily a **local repo + Python script pipeline**, not a Chrome extension workflow.

Current practical pattern:
- stage 1 builds a slotmap from repo-relative inputs already present locally
- stage 2 renders the slotmap into a landscape workbook using a template

Known contract recovered in April 2026:
- stage 1 is run from repo root with `--root` and `--depth`
- it auto-reads local `people/`, `links/links_all.jsonl`, and any auto-detected stoplist/overlay files
- stage 2 is run from repo root with `--root`, `--slotmap`, and `--template`

Human-readable final outputs:
- validated slotmaps and minitrees are renamed with seed-ancestor names and preserved in a human-readable save area in the operational repo
- laptop repo path: `human readable saves/`
- full local working path on the laptop: `C:\Users\david\OneDrive\Documents\ancestry_repo\human readable saves`
- this area is the durable human-facing shelf for completed outputs
- a future chat should prefer that shelf when it needs the stable named final artifacts rather than transient generic output filenames

Important note:
If the current chat needs to use or modify this pipeline, it should read the relevant slotmap/treebuilder manual first.
It should not assume that Shuttle currently governs this workflow.

### Shuttle Message system
Purpose:
Reduce friction between chat and the laptop by replacing repeated manual code-block/CMD/screenshot cycles with structured Shuttle messages handled by a local server/extension system.

High-level behavior:
- ChatGPT emits a numbered Shuttle message
- the extension/server relays it to the laptop
- the server executes the allowed action
- the result is returned to the clipboard or file
- the user pastes the result back into chat

Important note:
Shuttle contracts are easy to forget if they live only in continuity files. This system should therefore have an explicit manual with examples and known-good message patterns.

### Codex use
Purpose:
Accelerate script creation, patching, and debugging.

Standard pattern:
1. ChatGPT generates a prompt for Codex.
2. The user pastes the prompt into Codex on the laptop.
3. Codex generates a file or commentary.
4. The user brings the result back to chat.
5. ChatGPT reviews, tests, or sends a refined request back to Codex.

Important durable prompt-shaping rules:
- always specify a **new target filename** unless overwriting is explicitly desired
- do not rely on the word “patch” alone; Codex may overwrite the existing file
- tell Codex to normalize/update version numbers before finishing
- tell Codex **not** to print the full script at the end unless that is specifically desired

### GitHub use
Purpose:
Provide durable reference storage, backup, and a fetchable memory layer for new chats.

Current working model:
- `ancestry_repo` is used as the operational GitHub mirror of the laptop repo
- Shuttle has a GitHub mirror command for mirroring the laptop repo to `ancestry_repo`
- `genealogy-agent` is the constitutional/reference repo
- constitutional files are expected to be created and updated directly in GitHub by ChatGPT when practical
- constitutional backups are expected to be layered:
  - primary: live files in `genealogy-agent`
  - daily backup: snapshot area in `ancestry_repo`
  - weekly backup: Google Drive, manual or automated depending on connector reliability

Operational retrieval note:
- GitHub retrieval is strongest when the exact repo path or file URL is already known
- discovery is weaker than retrieval, especially for renamed outputs and binary artifacts
- new chats should prefer explicit paths from continuity files, file indexes, inventories, or the user rather than guessing

Important note:
GitHub should be treated as a curated reference shelf, not as an unstructured memory blob. New chats should prefer startup index files, manuals, and file indexes with stable file families and date/version precedence.

## End-of-session routine

### Routine actions
When the user indicates that the evening’s session is ending, and no further discussion is needed, the expected routine is:

1. Generate a continuity file for the user to download.
2. The continuity file should contain new, useful, and interesting session results.
3. The user may copy that continuity file into the laptop repo.
4. The user and ChatGPT should mirror the updated laptop repo to GitHub using Shuttle or a fallback manual method.

### Continuity file minimum contents
A continuity file does not need to be a full manual.
Its job is to carry the next chat across the session boundary with enough tactical state and startup guidance to resume work quickly.

At minimum, a continuity file should include:
- current work state
- current trajectory / likely next tasks
- important deferred observations or unresolved issues
- the exact paths of important files or artifacts discussed in the session, whenever available

### Continuity file startup block for the next chat
Near the top of the continuity file, include a short startup block for the next chat.
That block should:
- name the full repo-qualified path of the governing startup file
- name the full repo-qualified path of the governing file index
- instruct the next chat to read those through the GitHub connector first
- then instruct the next chat to read the continuity file itself as the tactical handoff
- tell the next chat to stop and ask the user for help if any file cannot be found or if there is path, version, or meaning confusion

### Continuity artifact naming rule
If a validated slotmap, minitree, or similarly important output was completed in the session, the continuity file should name the exact saved artifacts involved.
When available, prefer full repo-relative or repo-qualified paths rather than bare filenames.
This is especially useful for report folders, renamed human-readable saves, workbooks, CSVs, and similar outputs that a future chat may need to revisit.

### Conditional actions
If the session revealed durable new information, then constitutional/reference files may also be updated. This can include:
- the startup file family
- manuals
- file indexes
- playbooks
- architecture notes
- contract files

If Shuttle knowledge is needed at end-of-session and has not yet been loaded in the current chat, the chat should read the governing Shuttle manual at that time.

If Shuttle fails or the contract is uncertain, the fallback is to provide the user with the appropriate direct code block or command.

### Weekly backup reminder
The current plan is that constitutional files should also receive a weekly backup to Google Drive.
Whether this is manual or automated is still under development.
Until Drive write access is fully reliable, manual weekly backup is acceptable.

## Legacy note: “tinyloop”
“Tinyloop” is now mainly a historical/legacy term.

Earlier in the project, the user believed a fully automatic ChatGPT agent would be needed for large-scale ancestry harvesting. This led to experiments in creating a dialog workaround for more autonomous looping behavior.

Subsequent experience showed that ChatGPT has variability and context limitations, while a semi-automated invariant extension/server system can already achieve the needed ancestry work at acceptable speed and with high reliability.

Tinyloop may have future uses, but it is not the current operational center of the ancestry workflow.

## What this file should eventually point to
This startup file should eventually route to a stable constitutional set such as:
- startup file family
- Harvester/Navigator manual family
- Slotmap/Treebuilder manual family
- Shuttle manual family
- architecture map
- file index family
- common-task playbooks

Those files should live at fixed paths or stable file families so that a new chat can fetch them quickly and reliably.

## Operating principle for improvement
This file does not need to be perfect immediately.

If a future chat:
- gets lost
- lacks a key contract
- misidentifies a subsystem
- forgets a recurring command
- or reads too much / too little at startup

that gap should be treated as evidence for improving this file or the associated manuals and indexes.
