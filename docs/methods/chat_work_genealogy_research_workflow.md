---
title: Chat + Work Genealogy Research Workflow
status: ACTIVE METHOD
last_reviewed: 2026-09-09
project: Ancestry
purpose: Reusable operating guide for combining Chat judgment, Work execution, and user intervention in difficult online genealogy research.
canonical_paths:
  - ancestry_repo/docs/methods/chat_work_genealogy_research_workflow.md
  - genealogy-agent/docs/methods/chat_work_genealogy_research_workflow.md
---

# Chat + Work Genealogy Research Workflow

## 1. Division of labor

The preferred operating model is:

- **Chat = principal investigator.** Select the target, analyze the landscape, design hypotheses, construct the Work prompt, set scope/evidence/stopping rules, and peer-review the result.
- **Work = research associate.** Perform high-volume browsing, authenticated online research, repetitive record checking, candidate reconstruction, FAN analysis, cross-source comparison, and adaptive multi-step execution.
- **User = handoff and intervention layer.** Manually transfer prompts and results, handle CAPTCHA/login/2FA when needed, monitor long runs, and retain final control over project scope and tree changes.

The manual **Chat -> user -> Work -> user -> Chat** transfer is intentional. It creates a clean adjudication boundary between research execution and acceptance of genealogical conclusions.

Do not normally let the same Work run both research a difficult relationship and install it into the authoritative tree without independent Chat review.

## 2. When to use each mode

### Prefer Chat for

- choosing which broken branch has the highest payoff;
- distinguishing genuine parentage gaps from capture artifacts, generation cutoffs, stoplists, or placeholders;
- deciding what inherited facts are actually uncertain;
- developing historical hypotheses;
- defining evidence standards and online-only scope;
- designing adaptive Work phases;
- reviewing chronology, identity, copied-source circularity, negative evidence, and confidence language;
- deciding whether to update the tree, retain a working hypothesis, or close the case.

### Prefer Work for

- long, repetitive multi-site investigation;
- systematic church/probate/deed/tax/court/military/newspaper/cemetery/book searches;
- authenticated FamilySearch research and Full-Text Search;
- reconstructing candidate families and FAN networks;
- checking name/spelling/date/jurisdiction variants;
- following promising evidence through multiple steps;
- producing a source-by-source report.

## 3. Standard end-to-end loop

### Step 1 — Chat scans the landscape

Before launching Work:

1. identify genuine broken branches;
2. rank by recency, tractability, documentary environment, and ancestral payoff;
3. select one target;
4. identify facts that must remain hypotheses.

### Step 2 — Chat builds a self-contained research packet

Include:

- target person and PIDs/identifiers;
- verified starting facts;
- inherited assertions that must not be assumed;
- already eliminated hypotheses;
- prior searches and important negatives;
- fundamental research question;
- online-only scope;
- ordered adaptive phases;
- evidence-grading scheme;
- hypothesis-pruning rule;
- early-stop rule;
- authentication/CAPTCHA instructions;
- allowance-recovery rule;
- required final report and handoff capsule.

### Step 3 — User transfers the prompt to Work

Copy/paste the final Chat prompt into a new or appropriate Work conversation. This is the deliberate transition from planning to execution.

### Step 4 — Work executes adaptively

Work should not treat the prompt as a flat checklist. It should:

- pursue phases in priority order;
- let early evidence redirect later phases;
- spend effort unevenly according to expected value;
- prune disproved candidates;
- deepen promising lines;
- stop low-value work when decisive evidence appears.

### Step 5 — Work leaves visible checkpoints

For long runs, request a very short checkpoint after each major phase **without pausing the continuing run**.

Recommended format:

> **Phase C complete**  
> Key result: [1–2 sentences]  
> Hypotheses changed: [brief]  
> Next phase: D  
> Human action needed: none / [specific action]

### Step 6 — User handles human-only barriers

When login, CAPTCHA, 2FA, or another human-verification step appears, Work should request the minimum necessary user intervention rather than abandoning the source. Credentials belong only in secure login interfaces, never ordinary chat.

### Step 7 — User monitors exceptions, not every search

For long genealogy runs the user has found it useful to:

- enable all available notifications;
- use phase checkpoints;
- check progress roughly every two hours;
- look for authentication blocks, stalls, or allowance exhaustion.

Cloud Work can continue after leaving the app or closing/turning off the device. The app need not remain in the foreground.

### Step 8 — Handle allowance exhaustion with a resumable checkpoint

Every substantial Work prompt should include:

> If execution may stop because of an allowance or system limitation, first record the last completed phase, major findings, eliminated hypotheses, important source identifiers/URLs, and the exact next action. After allowance reset, resume from that checkpoint without repeating completed work.

After reset, reopen the same Work conversation and tell it to continue from the checkpoint.

### Step 9 — Work returns a full report plus a Chat handoff capsule

The full report should contain:

- conclusion;
- evidence by proposition;
- source citations/URLs;
- candidate comparisons;
- negative searches;
- eliminated hypotheses;
- confidence grading;
- online-road assessment;
- remaining restricted/offline leads.

Also request a **300–500 word Chat handoff capsule** containing the bottom line, strongest evidence, important negatives, eliminated hypotheses, remaining uncertainty, and recommended next action.

### Step 10 — User returns the result to Chat

Paste/upload the Work result into the ordinary Chat research conversation.

### Step 11 — Chat peer-reviews the result

Check:

- whether records really support the claimed propositions;
- same-name identity conflation;
- chronology and geography;
- whether multiple trees are copying one assertion;
- whether negative evidence is valid for the coverage searched;
- whether confidence is calibrated;
- whether the strongest competitor was addressed;
- whether Work obeyed pruning, early-stop, and scope rules.

The Sarah Conger case demonstrated the value of this step when Chat caught a Joel Jones conflation. The Anna Mahurin case demonstrated that peer review can refine the strength of wording even when Work’s practical conclusion is correct.

### Step 12 — Decide the tree outcome

Classify the case as one of:

1. **Established relationship** — adequate evidence for authoritative-tree change.
2. **Working / analytical hypothesis** — useful for scenario analysis but clearly labeled unproved.
3. **Online-exhausted unresolved case** — preserve findings and future leads, then move on.

### Step 13 — Save a durable case report

Store the canonical Markdown report under `docs/cases/` in both repositories, with a stable filename, status, review date, and reopening rule. Create a DOCX copy for local/physical backup when useful.

## 4. Core prompt controls

### Fundamental-question rule

Ask at the deepest uncertain level.

Bad:

> Find Sarah Jones’s parents.

Better:

> Determine who John Conger’s wife or wives were, who Electa Conger’s mother was, whether “Sarah Jones” is a valid inherited identity, and only then identify her natal family if evidence permits.

### Starting-facts rule

Separate:

- contemporary/original evidence;
- near-contemporary evidence;
- strong derivative evidence;
- inherited tree assertions;
- working hypotheses.

Exact unsourced dates must not silently become hard search filters.

### Adaptive-execution rule

> Do not distribute effort evenly across all phases. Let evidence from earlier phases determine which later avenues deserve deeper pursuit.

### Hypothesis-pruning rule

> If a candidate or hypothesis is decisively contradicted, record why, stop researching it merely for completeness, and redirect effort to the remaining viable hypotheses.

### Early-stop rule

> If direct evidence or a tightly convergent independent evidence set resolves the central identity/parentage question and makes remaining planned searches low-value, stop the research loop and report the finding.

Do not early-stop for proximity, naming patterns, copied trees, or one weak derivative claim.

### Online-only stopping rule

> This is an online-only hobby genealogy project. Pursue reasonable digitally accessible evidence aggressively. Do not make physical archive visits, private correspondence campaigns, telephone inquiries, or hired research part of the active plan. If remaining decisive evidence is restricted/offline, identify it precisely, summarize the current best conclusion, grade surviving hypotheses, and stop.

## 5. Evidence grading

Use:

- **Established / very high confidence**
- **Strongly supported**
- **Plausible**
- **Weak**
- **Contradicted**
- **Unknown**

Avoid spurious numeric probabilities without a quantitative basis.

Repeated online trees that derive from one claim are not independent corroboration.

Distinguish clearly among original/contemporary records, near-contemporary records, later derivative genealogies, unsourced trees, and inference.

## 6. Eighteenth-century wife identity / “migration Mama” protocol

The Sarah Conger and Anna Mahurin investigations show that the broader problem is **wife identity resolution**, with migration as one important failure mechanism.

Use this sequence:

1. Start from the husband and documented children.
2. Reconstruct the husband’s complete wife sequence early.
3. Establish or grade the wife’s given name and maternity of children.
4. Treat alleged maiden surname and exact dates as hypotheses.
5. Reconstruct the husband’s pre-marriage and early-marriage geography.
6. Build a compact FAN network from actual relational edges.
7. Search candidate maiden-surname households **inside that network** rather than across the whole region.
8. Reconstruct plausible daughters and their fates.
9. Look for disappearance/appearance timing if migration occurred.
10. Seek direct bridge records: probate, deeds, dower releases, church records, marriage bonds, Bible records, guardianships, estate receipts.
11. Seek bridge people: siblings, cousins, witnesses, neighbors, or fellow migrants in both origin and destination.
12. Extend ancestry only after the identity bridge is sufficiently established.
13. If the bridge fails and the online road is exhausted, document and close the case.

Refined rule:

**Husband -> prove/grade wife -> prove/grade maiden surname -> reconstruct natal family -> bridge -> ancestry.**

### Additional safeguards learned from Anna Mahurin

- **Reconstruct all wives early.** A later spouse’s proven maiden surname can contaminate an earlier spouse’s identity.
- **Audit FamilySearch edit history as provenance evidence.** A late name/date change without a new source may reveal when a modern inference entered the tree.
- **Read the underlying historical image, not the uploader’s title or filename.** User-created labels can silently insert a conclusion absent from the record.
- **Grade atomic propositions separately.** A given name or maternity may be established while maiden surname, birth, death, and parentage remain unknown.
- **Distinguish deed execution from acknowledgment/recording dates.** Administrative dates can otherwise create false spouse overlaps.
- **Let a failed surname premise prune the search.** Do not exhaustively search candidate families for a surname whose attachment has itself collapsed.

## 7. FamilySearch operating procedure

Use FamilySearch for both Tree provenance and historical records, especially Full-Text Search.

When auditing a Tree profile, inspect where accessible:

- attached sources and which facts they support;
- change history;
- removed relationships;
- duplicates;
- notes;
- memories;
- discussions/collaboration fields;
- provenance of exact dates, places, surnames, and relationships.

A precise tree date or name with no source trail is not automatically a fact.

### Authentication and CAPTCHA preferences

The project preference is to minimize repetitive human friction while respecting whatever human-verification boundary the site/product requires.

Future Work prompts should say:

1. **Prefer one authorization per site per Work session when supported.** If Work is permitted to handle later CAPTCHA challenges from the same site after one explicit authorization, ask once and scope that permission only to that site and current Work session.
2. **Prefer a tappable Yes/No approval.** If explicit user authorization is required and the interface supports a choice control, use a simple Yes/No inquiry rather than typed text.
3. **Accept any contextually clear approval.** If typed authorization is required, “yes,” “go ahead,” “please proceed,” or equivalent clear language should count. Do not require a long exact phrase unless the product itself requires it.
4. **Use human takeover when the challenge itself must be solved by the user.** Pause, hand control to the user, and resume automatically from the latest checkpoint afterward.
5. **Do not generalize authorization beyond what is supported.** If permission cannot validly persist to later challenges, request only the minimum additional interaction needed.

Reusable prompt clause:

> If a needed site presents a CAPTCHA or similar human-verification challenge, do not abandon the source. If the product supports one authorization covering CAPTCHA handling for that same site during the current Work session, prefer that option. If per-challenge approval is required, prefer a tappable Yes/No control when available. If typed approval is required, accept any contextually clear affirmative response rather than demanding a prescribed phrase. If the challenge itself must be solved directly by the human user, pause for takeover and resume from the latest checkpoint afterward. Never request passwords in ordinary chat.

## 8. Long-run operating lessons

### Notifications

Enable available notifications and request short phase checkpoints. Work’s native reporting can otherwise be opaque during long investigations.

### Device state

Cloud Work can continue after the user leaves the app or turns off the device. Periodic checks are for exception handling, not to keep the task alive.

### Browser/session state

If Work functions on one device but a browser has a disabled composer despite available allowance, test another device/session before assuming the account is blocked. Clearing ChatGPT/OpenAI site data may repair stale browser state, but do not interrupt a healthy running cloud task unnecessarily.

### Concurrency

A new Work composer may be unavailable while another Work task is actively running, depending on current concurrency limits. A grey send button alone does not prove allowance exhaustion; check usage and existing-task state.

### Allowance management

Reduce wasted compute by:

- narrowing the problem in Chat first;
- using ordered adaptive phases;
- pruning contradicted branches;
- early-stopping after decisive evidence;
- requiring resumable checkpoints;
- monitoring the usage dashboard.

## 9. Standard reusable Work-prompt boilerplate

### Authentication / CAPTCHA

> If a needed site presents login, CAPTCHA, 2FA, or other human verification, do not abandon the source. Prefer one authorization per site/current Work session when supported; otherwise prefer a tappable Yes/No approval; otherwise accept any contextually clear affirmative wording. If direct human solving is required, pause for takeover. Never request credentials in ordinary chat.

### Adaptive execution

> Do not distribute effort evenly across phases. Let earlier evidence determine where later effort goes.

### Pruning

> If a candidate is decisively contradicted, record the reason and stop researching it for completeness.

### Early stopping

> If decisive evidence resolves the central question and makes remaining searches low-value, stop and report the result.

### Allowance recovery

> Before any allowance/system stop, leave a resumable checkpoint with completed phase, findings, eliminated hypotheses, important source identifiers, and exact next action.

### Online endpoint

> If reasonable online avenues are exhausted and decisive remaining evidence is restricted/offline, identify it precisely, state the best-supported conclusion, and stop.

### Deliverable

> Return a full evidence report plus a 300–500 word Chat handoff capsule suitable for independent peer review.

## 10. Pre-tree-change quality checklist

Before accepting a difficult Work conclusion, Chat should be able to answer the relevant questions:

- Has the target identity itself been validated?
- Are exact dates/surnames actually sourced?
- Have all spouse identities and marriage chronology been reconstructed where relevant?
- Are same-name people explicitly distinguished?
- Are chronology and geography coherent?
- Are underlying images read independently of uploader titles/transcriptions?
- Are candidate families reconstructed rather than merely named?
- Is there a real relational bridge rather than proximity alone?
- Have copied derivative chains been recognized?
- Is negative evidence interpreted according to collection completeness?
- Has the strongest competing explanation been tested?
- Has Work respected the online-only stopping rule?
- Has Chat independently reviewed the evidence?

## 11. Repository/document convention

Canonical GitHub format: **Markdown**.

- `docs/cases/` — ancestor-specific research reports.
- `docs/methods/` — reusable methods and operating guides.

Use stable filenames. Put status and review date inside the document rather than proliferating dated copies.

Important case/method files should be mirrored in both project repositories. DOCX copies may be generated for local/physical backup.

Each case report should include:

- target and identifiers;
- status;
- verified facts;
- unsupported inherited assertions;
- candidate/elimination analysis;
- evidence and important negatives;
- online collections searched;
- restricted/offline leads;
- final tree treatment;
- reopening rule.

## 12. Core philosophy

The goal is not maximum autonomy. The goal is a high-throughput, auditable research loop that uses each participant for what it does best:

**Chat plans -> user hands off -> Work investigates -> user returns results -> Chat audits -> tree/document decision -> next target.**

Work supplies extraordinary breadth and persistence. Chat supplies hypothesis design, methodological control, and adversarial review. The user supplies human authentication, scope choices, and final project judgment.
