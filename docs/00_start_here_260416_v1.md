# Ancestry Project — Start Here — 260416 v1

## Purpose
This is the governing startup orientation file for new chats working on the Ancestry Project. It is a routing document, not a full manual.

A fresh chat should use this file to get oriented quickly, then read only the manuals and code needed for the current task.

## Governing precedence
Within each constitutional file family, the governing file is determined:
1. first by date suffix in `YYMMDD` format
2. then by version suffix `vN` within the same date

Older date-only constitutional files should be treated as implicit `v1` unless superseded.

## Governing startup packet
Unless superseded later, the preferred startup packet is:
1. the most recent governing file in the `00_start_here_*` family
2. the most recent governing file in the `file_index_*` family
3. the latest continuity file
4. task-specific manuals only as needed
5. code files only if the task requires contract verification or debugging

## Unified startup order for a new chat
A new chat should usually do the following in this order:
1. read the governing startup file from the `00_start_here_*` family
2. read the governing file index from the `file_index_*` family
3. read the continuity file from the previous session
4. determine the immediate task category
5. read only the needed manuals and code
6. avoid reconstructing unrelated subsystems unless the user asks

This order supersedes older wording that placed the continuity file before the governing file index.

## Current caution notes
1. constitutional files that still use date-only names should be treated as implicit `v1` unless superseded
2. Shuttle is validated for GitHub mirror and Navigator reseed, but not yet as the governing path for the slotmap/treebuilder workflow
3. the sibling/child contamination issue in the Navigator queue is still a live imperfection and should not be mistaken for solved
4. GitHub retrieval is much stronger when exact paths are known; discovery is weaker than retrieval

## Constitutional boundary rule
The constitutional layer should hold recurring contracts, routing rules, stable workflows, startup guidance, manuals, playbooks, and other durable operational knowledge.

Continuity files should hold tactical state, current momentum, one-session observations, and case-specific genealogical findings.

Operational test:
- elevate something into the constitutional layer when a future fresh chat would predictably do worse if that information were missing from the governing layer
- leave it in continuity when it is mainly tactical, one-off, ancestor-specific, or not yet clearly part of the recurring operating contract

If an item sits near the boundary, pause and ask the user rather than classifying it unilaterally.

## PID discipline rule
When a newly typed PID differs slightly from a previously validated PID in the same session or continuity context, do not proceed silently.

Default behavior:
- prefer the previously validated PID
- flag the discrepancy explicitly
- ask the user before using the new PID in commands, file references, or reasoning

## Artifact and path reference convention
For important operational artifacts, continuity files should prefer both:
1. the full local Windows path, for laptop execution and direct local lookup
2. the repo-relative path, for GitHub retrieval and repo reasoning

Working rule:
- governing startup and index pointers should usually use full repo-qualified GitHub-style paths when helpful
- operational artifacts should usually use full local Windows path plus repo-relative path
- bare filenames should be avoided when a fuller path is known

If only one form can be included, prefer the form most likely to matter for the next task.

## Project layer distinction
- `genealogy-agent` = constitutional/reference layer
- `ancestry_repo` = operational working layer

The constitutional layer is meant to reduce startup friction and preserve recurring contracts. It is not meant to replace continuity files.

## End-of-session continuity minimum
A continuity file should, at minimum, include:
- current work state
- likely next tasks
- important deferred observations
- exact paths of important artifacts whenever available

For important operational artifacts, prefer both the full local Windows path and the repo-relative path whenever practical.

## Companion rule
After reading the governing startup file, a fresh chat should read the current governing file index from the `file_index_*` family, as determined by the date/version precedence rule above.
