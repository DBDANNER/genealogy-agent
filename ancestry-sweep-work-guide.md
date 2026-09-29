# Ancestry Sweep Work Guide

**Version 1 — calibration baseline**
**Created:** 29 September 2026

## Purpose

This guide governs the targeted Ancestry.com evidence sweep that follows completion of the broken-branch cycle.

The Ancestry phase is not a new general genealogy project. Its purpose is to test the already peer-reviewed direct-line cases against Ancestry.com for genuinely new evidence, unique images, useful DNA conclusions, photographs, or other material not already represented in the canonical case reports.

Each ancestor investigation will normally run in a fresh ChatGPT Work instance. Therefore every Work prompt must remain self-contained even when this guide is also read.

## Stable operating principles

1. Treat the canonical GitHub case report as the governing evidence state for the ancestor.
2. Do not redo already settled FamilySearch research unless Ancestry exposes genuinely new evidence.
3. Prefer original records and images over indexes, member trees, hints, and derivative compilations.
4. Treat Public Member Trees and unsourced user trees as finding aids only.
5. Do not count multiple indexes or tree repetitions of the same underlying source as independent evidence.
6. Preserve exact source provenance whenever possible: collection title, record title, URL, database/collection number, image number, page, volume/book, record ID, and exact relationship wording.
7. Do not make Ancestry tree edits, attach/detach records, merge people, alter facts, or save changes unless a later prompt explicitly authorizes it.
8. Human takeover for login, CAPTCHA, or other authentication interruptions is acceptable when needed. Do not request passwords.
9. Keep the search bounded by the specific ancestor and the explicit unresolved propositions in the prompt.
10. If a new Ancestry source materially changes a peer-reviewed conclusion, preserve the evidence and flag it for ordinary-Chat review rather than silently changing the canonical conclusion.

## Live telemetry

Use only the active repository:

DBDANNER/ancestry_repo/ancestry-sweep-current.txt

Overwrite this file with the current run's status.

Recommended states:
- ACTIVE
- WAITING FOR USER
- BLOCKED
- ALLOWANCE EXHAUSTED
- COMPLETE

After every telemetry write, immediately re-fetch the file and verify that only intended telemetry was written.

Do not place troubleshooting prose or research narrative in the telemetry file.

## Cumulative problem log

Use:

DBDANNER/ancestry_repo/ancestry-sweep-problem-log.md

This is append-only operational memory for the Ancestry phase.

Log both unresolved and successfully solved problems.

Each entry should include:
- date/run
- ancestor/task
- category
- what Work was trying to do
- what happened
- page/view/context
- impact
- attempts made
- workaround/resolution
- whether user intervention was needed
- recurrence risk
- classification: local problem or generalizable lesson
- prompt implication

A generalizable lesson is one that should change future Work prompts or this guide.

A local problem should remain in the log but normally should not enlarge all future prompts.

## Per-run final output

Each run should produce:
1. a genealogy/evidence report;
2. an operational lessons section summarizing problems and successful workarounds from that run;
3. updates to the cumulative problem log;
4. final telemetry.

## Calibration principle

Before the first full ancestor sweep, use a small known-source task to learn the Ancestry interface.

The first calibration target is the 1738 Samuel Talbot probate relevant to the Abigail Kils/Kiles case.

The calibration should test:
- authenticated access
- direct record navigation
- collection navigation
- image viewer behavior
- transcription from image
- source metadata capture
- distinction between original image and derivative index/tree information
- browser/UI obstacles
- problem-log discipline
- telemetry discipline

## Guide evolution

Ordinary Chat will review the problem log and Work report after each run.

Only lessons that are genuinely reusable should be promoted into later versions of this guide and into the introductory portion of subsequent Work prompts.
