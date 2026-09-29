# Ancestry Sweep — Ordinary Chat Continuity

**Created:** 29 September 2026  
**Purpose:** durable handoff for ordinary Chat supervision of the Ancestry.com evidence-sweep phase.

## How to recover this project in a fresh Chat

Use the native GitHub connector and read, in this order:

1. `genealogy-ledger.md` — canonical project state and completed broken-branch conclusions.
2. `ancestry-sweep-continuity.md` — this handoff file for the current Ancestry phase.
3. `ancestry-sweep-work-guide.md` — current Ancestry operating method; prompts for fresh Work instances should include its latest generalizable lessons.
4. `ancestry-sweep-current.txt` — live telemetry for the currently running Ancestry Work instance.
5. `ancestry-sweep-problem-log.md` — cumulative operational lessons and Ancestry-specific problems/workarounds.
6. The named canonical case report under `docs/cases/` for whatever ancestor is being swept.
7. `tree-alterations-indicated-by-broken-branch-research.md` when downstream pedigree interpretation matters.
8. `docs/phase2_analysis_plan_260925_v4.md` for the post-sweep analysis roadmap.

The active repository is:

`DBDANNER/ancestry_repo`

The redundancy/documentation mirror is:

`DBDANNER/genealogy-agent`

Use the active repo first.

## Current project phase

The ten-case broken-branch cycle is COMPLETE and peer-reviewed.

The current stage is a targeted Ancestry.com evidence sweep, performed through the user's signed-in Ancestry session on the laptop.

The purpose of the Ancestry sweep is NOT to redo general genealogy. It is to look for genuinely new evidence, unique images, useful DNA conclusions, photographs, or other Ancestry-only material that could supplement or modify the already banked case conclusions.

Each of the ten ancestor sweeps is expected to run in a fresh Work instance with a self-contained introductory operating header plus ancestor-specific instructions.

## Current calibration state

Calibration 1 — Samuel Talbot 1738 probate — COMPLETE.

Key calibration-1 result:
- Work can navigate authenticated Ancestry without user intervention.
- Recommended known-collection route: Card Catalog → exact collection → collection-specific search.
- The targeted Samuel Talbot image was a scanned typed probate abstract, not the original handwritten will.
- It confirmed “Sarah Kiles (Widow)” as Samuel Talbut's daughter, but did not name her husband, children, or Abigail.
- The true original remains a focused reopening target at probate book 9, pp. 124–126.
- Four operational lessons were logged.

Major reusable lesson:
An Ancestry image is not necessarily an original historical document. Every source must be classified as original instrument, record-book copy, published abstract/transcript, index, hint, member tree, or other derivative before evidentiary weight is assigned.

The Ancestry Work guide was updated after Calibration 1 to:

**Version 2 — post-Samuel-Talbot calibration**

## Current live Work run

Calibration 2 — Abigail Kils/Kiles miniature sweep — ACTIVE as of 29 September 2026.

Live telemetry file:

`ancestry-sweep-current.txt`

Current task:
- locate Abigail Kils/Kiles in the user's Ancestry tree;
- audit the person page;
- inspect sources, hints, and bounded search results;
- compare potentially new items against the canonical Abigail case;
- test Work's ability to distinguish genuinely new evidence from repetitions, derivatives, trees, and already-known sources.

Read-only posture:
- do not accept hints;
- do not attach records;
- do not modify the Ancestry tree.

Current local checkpoint:

`Documents\Ancestry Work\Calibration Abigail Mini Sweep\`

Expected GitHub raw report:

`Ancestry_calibration_Abigail_Kils_mini_sweep.html`

When the user asks whether Work is done or asks to “check Ancestry Work,” first read `ancestry-sweep-current.txt`. If COMPLETE, read:
- `ancestry-sweep-problem-log.md`
- the raw calibration/report named in telemetry

Then ordinary Chat should peer-review both:
1. genealogy/evidence quality;
2. operational lessons and whether they should change the reusable Ancestry operating header / Work guide.

## Ancestry telemetry architecture

Live telemetry:

`ancestry-sweep-current.txt`

Typical states:
- ACTIVE
- WAITING FOR USER
- BLOCKED
- ALLOWANCE EXHAUSTED
- COMPLETE

Work must re-fetch immediately after every telemetry write and verify the intended contents.

Ordinary Chat should normally READ telemetry only, not modify it.

## Cumulative problem log

`ancestry-sweep-problem-log.md`

This is append-only operational memory across fresh Work instances.

Each meaningful issue records:
- task/ancestor
- category
- classification: local problem or generalizable lesson
- what Work was trying to do
- what happened
- page/view/context
- impact
- attempts
- resolution/workaround
- whether user intervention was required
- recurrence risk
- prompt implication

Solved problems are intentionally logged because successful workarounds are reusable.

Ordinary Chat reviews the problem log after each run and promotes only genuinely reusable lessons into later prompt introductions and new versions of `ancestry-sweep-work-guide.md`.

## Stable Ancestry research posture

- Treat canonical GitHub case reports as the governing evidence state.
- Search for genuinely new evidence rather than redoing settled FamilySearch work.
- Prefer original records/images over indexes, hints, trees, and derivative compilations.
- Explicitly classify the source layer before assigning evidentiary weight.
- Do not count repeated presentations of one underlying record as independent evidence.
- Public Member Trees and unsourced trees are finding aids only.
- Verify indexed names/dates/relatives against visible images and packet boundaries.
- Known collections: prefer Card Catalog → exact collection → collection-specific search.
- Viewer canvases may briefly load blank/stale after navigation; visually confirm the requested page before reading.
- Citation metadata may need to be assembled from multiple Ancestry surfaces.
- Close save/attach panels immediately; no tree changes unless specifically authorized.
- Human takeover is acceptable for CAPTCHA/login confirmation, but never request passwords.

## Planned workflow after Calibration 2

1. Ordinary Chat reviews Calibration 2 report + cumulative problem log.
2. Update `ancestry-sweep-work-guide.md` only if Calibration 2 produces new generalizable lessons.
3. Finalize the reusable introductory operating header.
4. Begin the ten ancestor-specific Ancestry sweeps, normally one fresh Work instance per ancestor.
5. After each run:
   - inspect live telemetry/report/problem log;
   - peer-review genealogical findings;
   - update reusable operating instructions only when justified;
   - bank any genuinely new evidence in the appropriate durable project files.
6. After all ten sweeps:
   - preserve useful Ancestry DNA analysis/conclusions and photographs/unique material;
   - test Pro Tools if still useful;
   - then proceed to the coverage/place-authority and larger analytical phase.

## Ordinary-Chat role

Ordinary Chat remains the principal investigator / peer reviewer.

Work is the operational research associate.

Ordinary Chat should:
- design each Work prompt;
- monitor via GitHub;
- review reports and problem-log lessons;
- distinguish new evidence from duplicates or weaker derivative material;
- bank conclusions only after peer review;
- update the Ancestry Work guide when warranted.

## Recovery shorthand

A useful fresh-chat instruction is:

**“Read the Ancestry sweep continuity file in my ancestry GitHub repository and resume ordinary-Chat supervision from there.”**

If broader project context is needed, also say:

**“Check the genealogy ledger.”**
