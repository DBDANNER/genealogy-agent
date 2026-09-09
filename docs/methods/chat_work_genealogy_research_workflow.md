---
title: Chat + Work Genealogy Research Workflow
status: ACTIVE METHOD
last_reviewed: 2026-09-09
project: Ancestry
purpose: Reusable operating guide for combining Chat judgment and Work execution in difficult genealogy research.
canonical_paths:
  - ancestry_repo/docs/methods/chat_work_genealogy_research_workflow.md
  - genealogy-agent/docs/methods/chat_work_genealogy_research_workflow.md
---

# Chat + Work Genealogy Research Workflow

## Purpose

This guide records the operating method developed during the Sarah Conger / “Sarah Jones” investigation for combining ordinary Chat with ChatGPT Work on difficult genealogy problems.

The central division of labor is:

- **Chat = principal investigator:** target selection, landscape analysis, hypothesis design, prompt construction, evidence standards, peer review, and decisions about the authoritative tree.
- **Work = research associate:** high-volume browsing, authenticated online research, repetitive record checking, cross-source comparison, adaptive multi-step execution, and structured reporting.
- **User = handoff and intervention layer:** manually transfers prompts/results between Chat and Work, handles CAPTCHA/sign-in/2FA steps, monitors long runs, and retains final control over project scope and archival decisions.

The manual Chat <-> Work transfer is intentional. It creates a useful adjudication boundary between research execution and acceptance of genealogical conclusions.

## 1. When to use Chat and when to use Work

### Prefer ordinary Chat for

- deciding which ancestor is worth researching;
- scanning the shape of the available genealogy and identifying high-payoff gaps;
- distinguishing genuine missing parentage from capture artifacts or intentional stop conditions;
- developing historical hypotheses;
- choosing evidence standards and project scope;
- designing an adaptive Work prompt;
- reviewing Work’s conclusions;
- catching identity conflations, chronology errors, copied-source circularity, and unsupported inferences;
- deciding whether to update the authoritative tree, preserve a graded hypothesis, or close the branch.

### Prefer Work for

- long, repetitive, multi-site online investigation;
- systematic searches across church, probate, deed, tax, court, military, newspaper, cemetery, and digitized-book sources;
- authenticated FamilySearch research;
- reconstructing candidate families and FAN networks;
- checking many variants, dates, jurisdictions, or record sets;
- following evidence-driven branches over many steps;
- producing a source-by-source research report.

### Avoid delegating the final genealogical judgment automatically

For difficult identity or parentage questions, do **not** let the same Work run both research a relationship and directly install it into the authoritative tree without independent Chat review.

The Sarah investigation showed why: Work performed an excellent broad investigation but conflated two Joel Jones identities. Chat peer review caught the problem before it propagated into the tree.

## 2. Standard end-to-end loop

### Step 1 — Chat scans the landscape

Before launching Work, determine the shape of the problem.

For a set of tree gaps, Chat should:

- identify genuine broken branches;
- distinguish missing data from generation cutoffs, incomplete capture, stoplists, or known placeholders;
- rank candidates by recency, tractability, documentary environment, and potential ancestral payoff;
- select one target rather than asking Work to wander through the entire tree without priorities.

### Step 2 — Chat builds a self-contained research packet

Every substantial Work prompt should include enough context that Work does not need to reconstruct prior reasoning from scattered chats.

Include:

- verified starting facts;
- source IDs/PIDs and known localities;
- inherited assertions that must remain hypotheses;
- already eliminated candidates;
- prior searches and negative findings;
- the research question;
- scope limitations;
- ordered adaptive phases;
- evidence standards;
- hypothesis-pruning rules;
- early-stop rules;
- the required final deliverable.

### Step 3 — User manually transfers the prompt from Chat to Work

Copy the final prompt into Work.

The manual transfer is useful because it marks a deliberate transition from **planning/judgment** to **execution**. It also gives the user a chance to verify that the task being delegated is the task actually intended.

### Step 4 — Work executes adaptively

Work should not treat a long prompt as a flat checklist.

A good prompt instructs it to:

- work through phases in priority order;
- let early evidence redirect later phases;
- spend effort unevenly according to expected value;
- abandon disproved candidate lines;
- deepen promising lines;
- stop early if decisive evidence makes later steps redundant.

### Step 5 — Work leaves visible checkpoints

For long runs, request short visible checkpoints after each major phase without stopping the continuing research run.

Recommended format:

> **Phase C complete**  
> Key result: [one or two sentences].  
> Hypotheses changed: [briefly].  
> Next phase: D.  
> Human action needed: none / [specific action].

These checkpoints make an otherwise opaque long Work run auditable at a glance.

### Step 6 — User handles human-only access barriers

If Work encounters:

- FamilySearch login;
- CAPTCHA / “prove you are human”;
- two-factor authentication;
- a secure sign-in step;
- another explicitly human verification;

Work should **pause and request human takeover**, not abandon the source.

The user should enter credentials only through the secure authentication/browser interface, never in ordinary Work or Chat text.

After verification, return control to Work and instruct it to continue from the latest checkpoint.

### Step 7 — User monitors long runs periodically

Cloud Work can continue after leaving the conversation or closing the device; the app does not need to remain in the foreground.

For long genealogy runs, the user found it helpful to:

- enable all available notifications;
- request phase checkpoints;
- check progress approximately every two hours;
- look specifically for CAPTCHA/sign-in requests, stalls, or compute-allowance exhaustion.

This is not constant supervision. It is periodic exception handling.

### Step 8 — Handle allowance exhaustion with resumable checkpoints

Long Work runs may exhaust a short-window compute allowance before the research is complete.

Every long prompt should contain a recovery rule such as:

> If execution is about to stop because of an allowance or other system limitation, first record a resumable checkpoint containing the last completed phase, major discoveries, eliminated hypotheses, important source identifiers, and the exact next action. After the allowance resets, resume from that checkpoint without repeating completed work.

When the allowance resets:

1. verify available usage in the usage dashboard;
2. reopen the same Work conversation;
3. instruct Work to continue from its checkpoint;
4. avoid restarting the research from the beginning.

If one device/session appears stuck but another can operate Work, continue from the functioning device rather than interrupting the research unnecessarily.

### Step 9 — Work produces both a full report and a handoff capsule

The full report should contain the evidence, citations, negative searches, candidate comparisons, confidence grading, and stopping assessment.

It is also useful to request a concise **Chat handoff capsule**, approximately 300-500 words, containing:

- bottom-line conclusion;
- strongest evidence;
- important negative evidence;
- hypotheses eliminated;
- surviving hypotheses and confidence;
- whether the online road is exhausted;
- next highest-value step;
- identity ambiguities or possible errors noticed by Work.

For difficult cases, transfer the **full report** back to Chat as well. The handoff capsule accelerates orientation; it does not replace peer review.

### Step 10 — User manually transfers Work’s result back to Chat

Paste or upload the Work result into the ordinary Chat research conversation.

This is the second deliberate handoff boundary.

### Step 11 — Chat peer-reviews Work

Chat should review at least:

- whether cited records actually support the claimed propositions;
- whether same-name people have been conflated;
- chronology and geography;
- whether multiple online trees are merely copying one source;
- negative evidence and whether the searched collection was complete enough for absence to matter;
- whether confidence language is calibrated to the evidence;
- whether a “best candidate” actually distinguishes itself from alternatives;
- whether Work followed scope, pruning, and stopping rules.

If necessary, Chat then writes a narrower second-pass Work prompt based on the first run’s discoveries.

### Step 12 — Decide the tree outcome

After peer review, classify the case into one of three states:

1. **Established relationship** — sufficient evidence to update the authoritative tree.
2. **Working / analytical hypothesis** — useful for scenario analysis but clearly labeled as unproved and kept separate from ordinary genealogical truth.
3. **Online-exhausted unresolved case** — preserve the evidence and remaining offline leads, then move on.

Do not force every Work run to produce ancestors.

### Step 13 — Save a durable case summary

For every substantial closed or paused case, preserve a compact project document containing:

- target person and identifiers;
- status;
- verified facts;
- inherited/unsupported assertions;
- leading candidates;
- eliminated candidates;
- evidence for and against;
- online collections searched;
- important negative findings;
- specific restricted/offline leads;
- last research date;
- rule for reopening the case.

This prevents future Chat/Work sessions from repeating completed research.

## 3. Prompt architecture for difficult genealogy

A robust Work prompt should contain the following control sections.

### A. Fundamental question

Phrase the question at the deepest uncertain level.

Bad:

> Find Sarah Jones’s parents.

Better:

> Determine who John Conger’s wife or wives were, who Electa Conger’s mother was, whether the inherited identity “Sarah Jones” is valid, and only then identify her natal family if evidence permits.

### B. Starting facts versus inherited assertions

Separate:

- contemporary/near-contemporary evidence;
- strong derivative evidence;
- inherited tree assertions;
- working hypotheses.

Do not allow exact unsourced dates to become accidental hard filters.

### C. Ordered adaptive phases

Earlier phases should have high information value and be allowed to reshape later ones.

Example:

1. validate target identity;
2. reconstruct husband geographically;
3. build FAN network;
4. reconstruct candidate natal families;
5. search deeds/probate/full text for bridge evidence;
6. compare origin and destination migration cluster;
7. extend ancestry only if the bridge is established.

### D. Hypothesis-pruning rule

Include:

> If an early phase decisively disproves a hypothesis or candidate, record the elimination and stop researching that branch merely for completeness. Redirect effort to the remaining viable hypotheses.

### E. Early-stop rule

Include:

> If a record or tightly convergent set of records directly establishes the identity, maiden surname, parentage, or equivalent decisive bridge, stop lower-value planned searches and report the finding immediately.

Do **not** trigger early stopping for proximity alone, naming patterns, copied online trees, or one weak derivative claim.

### F. Online-only stopping rule

For this hobby project:

> Pursue reasonable online and digitally accessible evidence aggressively. Do not make physical archive visits, private correspondence campaigns, telephone inquiries, or hired local research part of the active plan. If the remaining decisive evidence is restricted/offline, identify it precisely, summarize the best-supported conclusion, grade surviving hypotheses, and stop.

This keeps a brick wall from becoming an open-ended professional research project.

## 4. Evidence grading

Use consistent categories across cases:

- **Established / very high confidence**
- **Strongly supported**
- **Plausible**
- **Weak**
- **Contradicted**
- **Unknown**

Avoid spurious numeric probabilities unless there is a real quantitative basis for them. “Weak candidate” is often more honest than “12% likely.”

Distinguish source types:

- original/contemporary record;
- near-contemporary record;
- later derivative genealogy;
- unsourced online tree;
- inference.

Repeated trees that descend from the same underlying assertion are not independent corroboration.

## 5. Special method for eighteenth-century disconnected wives: “migration Mama”

The Sarah Conger investigation developed a reusable protocol for women whose natal identity may have been separated from their married identity by migration.

Use this sequence:

1. Start from the husband and documented children.
2. Prove or grade the wife’s given name and number of marriages.
3. Establish maternity of children where possible.
4. Treat the alleged maiden surname and exact dates as hypotheses.
5. Reconstruct the husband’s pre-marriage and early-marriage residence.
6. Build a compact FAN network from real relational edges.
7. Search candidate maiden-surname households **inside that network**, not across the entire region.
8. Reconstruct plausible daughters and their fates.
9. Look for disappearance/appearance timing.
10. Seek direct bridge records: probate, deeds, dower releases, church transfers, marriage bonds, family Bibles, guardianship, estate receipts.
11. Seek bridge people: siblings, cousins, witnesses, neighbors, or fellow migrants appearing in both origin and destination communities.
12. Extend ancestry only after the identity bridge is sufficiently established.
13. If the bridge fails and the online road is exhausted, document and close the case.

The refined rule is:

**Husband -> prove wife -> prove maiden surname -> reconstruct natal family -> bridge -> ancestry.**

## 6. FamilySearch operating procedure

FamilySearch is valuable for both Tree metadata and historical records, especially authenticated Full-Text Search.

Every FamilySearch Work prompt should include:

> If FamilySearch requests login, CAPTCHA, 2FA, “prove you are human,” or another human verification, pause and ask the user to take over the browser. Do not abandon FamilySearch because verification is required. Do not request passwords in ordinary chat.

When reviewing a FamilySearch Tree profile, inspect not only attached sources but also:

- change history;
- removed relationships;
- duplicate profiles;
- notes;
- memories;
- discussions/collaboration fields where available;
- provenance of exact dates and places.

A precise tree date with no source trail should not be promoted to fact merely because it is precise.

## 7. Operational lessons from long Work runs

### Notifications and visibility

Enable available notifications and request very short phase checkpoints. Work’s default reporting can be opaque during long research; explicit checkpoint instructions greatly improve usability.

### App/device state

Cloud Work can continue when the user leaves the app or turns off the device. There is no need to keep the iPad in the foreground. Periodic manual checks remain useful for exception handling.

### Browser/session problems

If Work functions on one device but a browser shows a disabled composer despite available allowance, test another device/session before assuming the account is blocked. Clearing ChatGPT/OpenAI site data can resolve stale browser state, but do not disturb a running cloud task unnecessarily.

### Concurrency

A new Work composer may be unavailable while another Work task is actively running, depending on current account/session concurrency limits. Do not treat a greyed send button alone as proof of exhausted allowance; verify usage and the state of any existing Work task.

### Allowance management

Long searches can consume substantial short-window allowance. A good strategy is therefore:

- use Chat first to narrow the problem aggressively;
- make Work prompts adaptive so low-value branches are pruned;
- use early stopping for decisive evidence;
- require resumable checkpoints;
- monitor the usage dashboard rather than guessing from the composer state.

## 8. Repository and file-management convention

Use **Markdown as the canonical GitHub format** because it is searchable, diffable, and easy for future Chat/Work sessions to read.

For substantial documents, also create **DOCX copies** for local/physical backup and comfortable human reading.

Recommended repository convention:

- `docs/cases/` — ancestor-specific research reports;
- `docs/methods/` — reusable research methods and operating guides.

Recommended file header:

- title;
- status;
- last reviewed date;
- project scope;
- canonical paths;
- reopening rule where appropriate.

Use stable filenames and update the file in place. Put revision dates and status **inside** the document rather than creating many nearly identical dated filenames.

For redundancy, important case and method Markdown files should be stored in both project repositories. Local DOCX/Markdown copies can then be backed up to physical media by the user.

## 9. Suggested standard Work prompt boilerplate

The following clauses can be reused in future prompts.

### Authentication

> If a needed site requests login, CAPTCHA, 2FA, or other human verification, pause and request human takeover rather than abandoning the source. Never request credentials in ordinary chat.

### Adaptive execution

> Do not distribute effort evenly across all phases. Let evidence from earlier phases determine which later avenues deserve deeper pursuit.

### Pruning

> If a candidate or hypothesis is decisively contradicted, record why, stop researching it for completeness, and redirect effort.

### Early stopping

> If decisive direct evidence or a tightly convergent independent evidence set resolves the central question and makes remaining searches low-value, stop the research loop and report the finding.

### Allowance checkpoint

> If execution may stop because of allowance or another system limitation, record the last completed phase, major findings, eliminated hypotheses, source identifiers, and exact next action so the run can resume without repetition.

### Online endpoint

> This is an online-only hobby research project. If reasonable online avenues are exhausted and the remaining decisive evidence is restricted/offline, identify it precisely, summarize the current best conclusion, and stop.

### Deliverable

> Return a full evidence report plus a concise Chat handoff summary suitable for independent peer review.

## 10. Quality-control checklist before accepting a Work genealogy result

Before changing the authoritative tree, Chat should be able to answer “yes” to the relevant items:

- Has the target person’s identity itself been validated?
- Are alleged exact dates actually sourced?
- Are same-name people explicitly distinguished?
- Are chronology and geography coherent?
- Are candidate families reconstructed rather than merely named?
- Is there a real relational bridge, not just proximity?
- Have derivative/copying chains been recognized?
- Are negative searches interpreted according to record completeness?
- Has the strongest competing hypothesis been addressed?
- Has Work respected the online-only scope?
- If unresolved, is there a clear stopping reason and a precise future lead?
- Has Chat independently reviewed the evidence before the tree is updated?

## 11. Recommended durable outputs per difficult ancestor

For each substantial case, retain:

1. **Full case report** — evidence, hypotheses, source trail, negatives, offline leads, status.
2. **Short case capsule** — quick future orientation.
3. **Work prompt(s)** when unusually reusable or methodologically important.
4. **Final Chat peer-review decision** incorporated into the case report.

This preserves not only the conclusion but also the path that produced it.

## 12. Core philosophy

The goal is not to make Work autonomous for its own sake. The goal is to use each mode for what it does best.

Work provides extraordinary breadth, persistence, and speed across tedious multi-step online research. Chat provides the slower layer of target selection, hypothesis design, methodological control, and adversarial review. The user supplies authentication, scope choices, and final project judgment.

The preferred loop is therefore:

**Chat plans -> user hands off -> Work investigates -> user returns results -> Chat audits -> tree/documentation decision -> next target.**

That loop produced a much more defensible result in the Sarah Conger case than either a broad unsupervised search or a purely manual hobbyist investigation would likely have produced.
