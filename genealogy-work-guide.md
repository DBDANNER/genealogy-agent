# Genealogy Work Guide

**Current operating guide for using ChatGPT Work in the Ancestry project**  
Last updated: 13 September 2026

If conversation context is ever lost, a useful recovery instruction is: **“Find the genealogy Work guide in the root of my ancestry GitHub repository.”**

This file is the practical prompt-building guide for long genealogy investigations. It complements the more general method document at `docs/methods/chat_work_genealogy_research_workflow.md`, but this root-level guide should be treated as the current operational source for future Work prompts.

## 1. Division of labor

Use the following research architecture:

- **Ordinary Chat = principal investigator.** Select and rank targets, stabilize the research question, separate verified facts from inherited assertions, design hypotheses, write the Work prompt, peer-review Work's conclusions, and decide whether any tree change is justified.
- **Work = research associate.** Perform the tedious, high-volume, multi-step online work: FamilySearch browsing, record extraction, deeds/probate/tax/church/military searches, candidate reconstruction, same-name comparisons, FAN analysis, source-chain checking, and report production.
- **User = handoff/intervention layer.** Move prompts/results between Chat and Work, handle human-only authentication/CAPTCHA steps, monitor exceptions, and retain final control over tree edits.

The manual `Chat -> user -> Work -> user -> Chat` handoff is deliberate. It creates an independent peer-review boundary.

**Never let Work directly install a difficult genealogical conclusion into FamilySearch before ordinary Chat peer review.**

## 2. Default Work configuration

For ordinary genealogy investigations, the current default is:

- **Model:** GPT-5.6 Sol
- **Reasoning:** Medium
- **Environment:** Windows ChatGPT app for Work, with Computer access to an authenticated Chrome FamilySearch session when needed
- **GitHub:** native GitHub connector

Sol Medium has been a good balance of reasoning quality and allowance efficiency. Use higher reasoning only for unusually tangled final adjudication: multiple plausible identities, mutually inconsistent primary records, or a subtle source-chain problem not resolving cleanly on Medium. Astra should be exceptional rather than routine.

Do not select a faster/lower-cost model merely to shorten elapsed time if the research question may turn into an identity problem.

## 3. Research question design

Do not assume the inherited FamilySearch identity or parent relationship is correct merely because it appears in the tree.

Frame the question at the deepest uncertain level. For example, instead of:

> Find X's parents.

prefer:

> Determine whether the current adult identity is correct, distinguish same-name people, reconstruct the spouse/children/residence chronology, and only then identify the natal family if defensible evidence permits.

For female spouse cases, use the tested sequence:

**Husband -> prove/grade wife -> prove/grade maiden surname -> reconstruct natal family -> bridge -> ancestry.**

For male cases, exploit surname continuity and land/probate/tax/military/occupation evidence, but guard heavily against same-name conflation and migration-based generation errors.

## 4. Evidence and confidence rules

Use these confidence categories:

- **Established / very high confidence**
- **Strongly supported**
- **Plausible**
- **Weak**
- **Contradicted**
- **Unknown**

Use these source categories:

- original/contemporary
- near-contemporary
- later derivative
- unsourced tree
- inference

Repeated derivative assertions from the same underlying chain are not independent corroboration.

Grade atomic propositions separately. A given name, marriage, maternity, birth date, maiden surname, death place, and parentage may have different evidentiary strength.

If one candidate is clearly strongest but not proved, label it **“Strongest current candidate”** or **“Analytical working hypothesis.”** Do not invent numerical probabilities.

## 5. Standard investigation sequence

A future Work prompt should usually contain these phases, adapted to the case.

### Phase A — Identity stabilization

Establish the target's adult identity before parentage:

- spouse(s)
- children
- residence sequence
- occupation
- migration
- death/probate
- land/tax/church/military evidence
- FamilySearch profile history, merges, alternate names, and provenance of exact dates/relationships

### Phase B — Same-name control

Identify and distinguish other people of the same or similar name in the relevant time and geography. Build explicit exclusion criteria rather than assuming every matching record belongs to the target.

### Phase C — Candidate natal families

Reconstruct only plausible households/families of the parental generation. Compare chronology, geography, known children, migration, probate, deeds, inherited land, sibling proximity, witnesses, associates, occupation, church affiliation, and naming patterns.

### Phase D — Relational bridge

Prioritize records that directly connect generations:

- wills and probate files
- estate distributions
- guardianships
- deeds with father/son or heir language
- inherited parcels
- dower releases
- church/baptism records
- marriage bonds
- tax continuity
- military files
- estate receipts
- sibling/heir deeds

Do not substitute proximity or matching names for a relational bridge.

### Phase E — Source-chain and contradiction audit

Test whether apparently independent claims actually derive from one genealogy/tree; resolve chronology and geography conflicts; record important negative evidence; and identify the strongest surviving alternative explanation.

### Phase F — Stop and report

Stop at one of three endpoints:

1. **Established/strongly supported bridge** sufficient for a proposed tree correction after Chat review.
2. **Clearly strongest candidate but unproved** — preserve as a working hypothesis.
3. **Reasonable online avenues exhausted** — record the unresolved endpoint and identify restricted/offline records that could someday resolve it.

This is an online-only hobby project. Do not turn unresolved branches into open-ended professional archival campaigns.

## 6. FamilySearch operating method

Preferred setup:

- Windows ChatGPT app running Work
- Computer plugin/access available
- Chrome already signed into FamilySearch
- use direct record URLs, catalog images, and FamilySearch Full-Text Search whenever possible

Prefer direct record/full-text/catalog navigation over repetitive graphical browsing. Use screenshots/images only when the underlying image materially resolves a transcription, relationship, parcel, name, or date question.

Audit FamilySearch Tree provenance when useful:

- attached sources and what they actually support
- change history
- removed relationships
- merges/duplicates
- alternate names
- notes/memories/discussions when relevant
- when exact dates, surnames, and parent links first appeared

A precise tree value without a source trail remains an assertion, not a fact.

## 7. CAPTCHA and authentication rule

If a needed site presents login, CAPTCHA, 2FA, or similar human verification:

- do not abandon the source merely because human intervention is required;
- prefer one authorization per site/current Work session when the product supports it;
- when explicit approval is required, prefer a tappable Yes/No choice if available;
- if typed approval is required, accept any contextually clear affirmative response rather than demanding a special phrase;
- if the challenge itself must be solved by the human user, pause for takeover and resume automatically afterward;
- never request passwords or credentials in ordinary chat.

## 8. Compute-efficiency rules

Long genealogy runs can become expensive when browser state and repeated navigation dominate the context. Future prompts should explicitly tell Work to:

- use targeted searches rather than broad browsing;
- move quickly to high-value probate/deed/full-text evidence;
- keep a compact evidence ledger;
- reuse already-settled findings rather than reopening the same records;
- use selective image inspection;
- avoid building enormous collateral trees;
- avoid deep ancestry before the target-generation bridge is established;
- stop researching candidates once decisively eliminated;
- invoke the early-stop rule when decisive evidence is found;
- avoid using a faster premium mode merely for speed;
- do not change the selected model/reasoning setting during the run unless the user asks.

The Henry Trask investigation showed that genuinely difficult same-name/probate problems can justify substantially more compute, but it also showed that earlier movement to targeted probate/deed records and a compact evidence ledger would reduce overhead.

## 9. Visible progress rule

Work should not appear to continue when execution has actually stopped.

At launch:

1. post a short **Starting** message;
2. perform at least one real substantive source/tool action;
3. then post **Active** only after that action has actually occurred.

During the run, give short event-driven updates after meaningful units of work — roughly a source cluster, a resolved hypothesis, or about 3–5 substantive records — rather than relying on fixed timers.

Recommended format:

> **Progress:** what was just completed  
> **Result:** the material finding or negative  
> **Next:** the next research action

Continue automatically after each update unless human intervention is actually required.

The user may periodically ask ordinary Chat to check GitHub telemetry; that is a pull-based supervisory check, not asynchronous monitoring by Chat.

## 10. GitHub telemetry — mandatory prompt clause

The live telemetry file is:

`DBDANNER/ancestry_repo/current-work.txt`

**Use the native GitHub connector directly for this file. Do not use Chrome/browser authentication or the GitHub CLI unless the native connector is genuinely unavailable.**

This rule is important. In the John Morehouse session, Work attempted browser/CLI GitHub access, concluded telemetry was unavailable, and preserved state only locally. A later diagnostic showed that the native GitHub connector had in fact been available and could read/write the repository. The failure was connector selection, not GitHub itself.

Future prompts should make the connector choice explicit.

Overwrite `current-work.txt` rather than creating a new telemetry file for each run.

Recommended schema:

```text
Current work — [Ancestor name PID]

State: ACTIVE | WAITING FOR USER | BLOCKED | ALLOWANCE EXHAUSTED | COMPLETE
Updated: [date/time if practical]
Overall phase: [brief]

Last completed:
[brief]

Result:
[brief]

Now doing:
[brief]

Next:
[brief]

Blocker:
[none or exact blocker]

Important concern:
[brief]

Local checkpoint:
[path]
```

Update telemetry:

- at the start;
- after meaningful research units;
- before a long comparison or potentially fragile step;
- before stopping for allowance/system limits;
- whenever waiting for user intervention;
- at completion.

After every write to `current-work.txt`, immediately re-fetch it using the native GitHub connector and verify that the written file contains only the intended telemetry schema. Never write diagnostic conversation, troubleshooting prose, connector tests, or tool-access discussion into `current-work.txt`.

`current-work.txt` is disposable live telemetry. The durable project queue is `genealogy-ledger.md`.

## 11. Local continuity files — mandatory for long runs

For each substantial investigation, create a predictable local folder:

`Documents\Ancestry Work\[Ancestor name PID]\`

Maintain at least:

- `00_STATUS.txt`
- `01_CHECKPOINT.md`
- `02_EVIDENCE_LEDGER.md`
- a working/final human-readable report, preferably HTML or Markdown

These files are the crash/allowance recovery layer. GitHub telemetry is for supervision; local files preserve detailed continuity if the connector, browser, or Work session fails.

Before any forced stop, write the latest state to both local continuity files and GitHub telemetry whenever possible.

## 12. Allowance/interruption recovery

Before execution may stop because of allowance or another system limitation, Work should preserve:

- last completed phase
- major findings
- eliminated hypotheses
- important source identifiers/URLs
- unresolved contradictions
- exact next action
- telemetry state `ALLOWANCE EXHAUSTED` or other appropriate state

After allowance reset, resume from the checkpoint without repeating completed work.

Do not infer durable product rules from one anomalous allowance reset. Treat the displayed allowance as authoritative for the current session, but keep the workflow resumable regardless.

## 13. Anti-derailment rules

Every prompt should explicitly defend the central question.

Do not spend substantial time on:

- huge unrelated same-surname trees;
- repetitive derivative genealogies that add no new evidence;
- speculative candidates without relational bridges;
- deep ancestry before the target parentage is secured;
- reopening settled records merely for completeness;
- collateral branches that do not help distinguish the target.

When a contradiction appears, ask whether it reflects:

- a bad date/place;
- a wrong spouse;
- a same-name conflation;
- a missing generation;
- a merge artifact;
- a later tree contamination.

The Henry Trask and John Morehouse cases demonstrate why an apparent contradiction should trigger identity/generation analysis before detaching a branch.

## 14. Required final deliverable

Work should return a formal report containing:

- executive conclusion
- final adult identity assessment
- birth/death assessment
- spouses and children
- chronology and migration
- same-name analysis
- candidate families and comparisons
- evidence for and against each important proposition
- parentage conclusion
- eliminated hypotheses
- meaningful negative searches
- source-chain/circularity analysis
- remaining contradictions
- restricted/offline records still worth knowing about
- whether the online road is exhausted
- recommended tree action **after ordinary Chat peer review**
- a 300–500 word handoff capsule for Chat

Save a human-readable local copy before completion.

Do **not** edit FamilySearch relationships/facts during the investigation unless ordinary Chat has already peer-reviewed the evidence and the user explicitly asks for the edit.

## 15. Banking a completed case

After Work finishes:

1. Ordinary Chat reads and peer-reviews the report.
2. Chat classifies the result: established/strongly supported, working hypothesis, identity corrected, or online-exhausted unresolved.
3. If appropriate, Chat proposes precise FamilySearch changes and reason statements; user retains final control.
4. Save/bank the canonical case report in the project repositories when appropriate.
5. Update `genealogy-ledger.md` in both repositories with the completed status, newly exposed branches, and revised queue.
6. Leave `current-work.txt` available for the next Work run to overwrite.

## 16. Recovery after total chat-context loss

A future fresh Chat should be able to recover the project by reading, in this order:

1. `genealogy-ledger.md` — what has been done and what comes next.
2. `genealogy-work-guide.md` — how to construct and supervise Work prompts.
3. relevant case reports under `docs/cases/` or any named root-level Work report.
4. `current-work.txt` only if a Work run is currently active or recently interrupted.

The two root-level memory anchors are therefore:

**genealogy ledger = project state**  
**genealogy Work guide = operating method**

## 17. Optional user monitoring automation

For long Work investigations, the user may optionally ask ordinary Chat to create a scheduled supervisory check of `DBDANNER/ancestry_repo/current-work.txt`. This is a **user monitoring option**, not a responsibility assigned to Work itself. Work's job remains to write accurate telemetry; the scheduled ordinary-Chat check reads and interprets it.

The fastest supported recurring schedule is **once per hour**. A 30-minute recurring check is not supported. Checks may be anchored to elapsed time from creation or to a clock-hour schedule, depending on the user's preference.

The monitoring automation should normally stay silent during ordinary progress and notify the user only when something materially warrants attention. Recommended notification conditions are:

1. **Terminal or intervention state.** Notify when telemetry reports `COMPLETE`, `BLOCKED`, `WAITING FOR USER`, or `ALLOWANCE EXHAUSTED`.
2. **Possible stall or allowance depletion.** If telemetry still says `ACTIVE` but remains materially unchanged for two consecutive hourly checks, notify cautiously that Work may be stalled or may have exhausted its current allowance. Do not treat unchanged telemetry as proof; a legitimate long source-navigation step can also produce no update.
3. **Possible task derailment.** Notify if the telemetry suggests Work has materially departed from the assigned research question or operating rules—for example, switching to the wrong ancestor, expanding into a broad unrelated collateral tree, contradicting settled scope without new evidence, using browser/CLI GitHub access despite the native-connector rule, unexpectedly proposing or making FamilySearch edits, or reporting internally inconsistent `Result`, `Now doing`, `Next`, or `Important concern` fields.
4. **Human intervention required despite nominal ACTIVE state.** Notify if `Blocker`, `Now doing`, or another field indicates CAPTCHA, login, approval, user decision, or takeover is needed even though `State` was not changed appropriately.
5. **Telemetry integrity failure.** Notify if `current-work.txt` becomes malformed, loses required fields, is replaced by diagnostic/troubleshooting prose, unexpectedly refers to the wrong case, regresses to an earlier phase, or reports completion while the promised report/checkpoint is missing or inconsistent.
6. **Major breakthrough.** Optionally notify when telemetry reports a genuinely consequential discovery—for example, an explicit relational bridge that appears to resolve the central genealogy question—even if the run is still active.

Do not send routine “everything is fine” notifications for every hourly check. The purpose is exception monitoring: completion, trouble, probable stalling, material deviation, required human action, telemetry failure, or a major breakthrough.

The automation should interpret telemetry conservatively. It is a supervisory convenience, not an independent research authority; any substantive genealogical conclusion still requires ordinary-Chat peer review before tree editing.
