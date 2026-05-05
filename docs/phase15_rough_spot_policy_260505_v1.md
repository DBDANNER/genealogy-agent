# Phase 1.5 Rough-Spot Policy — 260505 v1

## Purpose
This file governs how rough spots discovered in the completed Phase 1 minitree corpus should be classified before Phase 2 analyses begin. Phase 1 harvested and rendered the corpus. Phase 1.5 classifies uncertainty, missingness, artifacts, and out-of-scope material so that Phase 2 scripts do not silently convert rough data into false certainty.

The guiding principle is: preserve harvested evidence, add overlays only for accepted corrections, and add analysis annotations only when inference is explicit and labeled.

## Core distinction

### Genealogical correction
A reviewed correction to relationship, identity, or factual person data. Store in the overlay layer. Do not rewrite raw harvested person records.

Examples: corrected parents, rejected wrong-parent candidate, accepted externally sourced birthplace.

### Analysis annotation
A label used to control inclusion, confidence, analysis mode, or interpretation. It does not claim the FamilySearch record is wrong.

Examples: immigrant-boundary exclusion, inferred domestic birthplace for expanded analysis, PID-only artifact flag.

### Research lead
A plausible clue that has not been accepted as a correction or annotation.

Examples: Ancestry/WikiTree/Find a Grave hints that may identify a missing birthplace but have not yet been reviewed.

## Strict versus expanded analysis

Strict analysis uses documented captured facts and human-reviewed overlays only.

Expanded or sensitivity analysis may use clearly marked inferences, but only when the basis and confidence are recorded.

No script should silently infer missing maiden name, parentage, birthplace, immigrant status, or country of origin from surrounding family context without an explicit rule and confidence label.

## Rough-spot categories

### acceptable_missing_maiden_name_with_own_origin
A person, usually a female spouse, has a missing maiden surname or incomplete name, but has her own documented birthplace/origin.

Rule: include as-is for origin, migration, and composition analyses using her own documented place. Preserve the name limitation. Do not infer her parents. Missing maiden name is not significant for current Phase 2 analyses unless a later analysis specifically depends on naming or parentage.

Examples:
- Isaac Pollard tree: Grace (`PCJF-B17`), missing surname but own England origin.
- Isaac Pollard tree: Lydia or Rebecca (`PS2F-Q29`), uncertain given name/missing surname but own England origin.
- Lucy Smith tree: Hannah, wife of George Martin, only first name but own England birth.
- Lucy Smith tree: Rachel, wife of William Barnes, only first name but own Towcester, Northamptonshire, England birth.

### immigrant_endpoint
A person is classified as foreign-born/immigrant relative to the intended U.S./colonial line boundary. The person is included as the endpoint of that line.

Rule: include the immigrant endpoint itself in strict analysis, but do not include that person’s parents or earlier ancestors in strict immigrant-limited analysis unless the line is deliberately reopened.

### immigrant_boundary_crossed
A slotmap contains parent/ancestor slots beyond an immigrant endpoint.

Rule: identify and ignore those beyond-endpoint slots in strict Phase 2 analyses. This is normally an analysis-scope issue, not a genealogical correction.

Examples:
- Isaac Pollard tree: Thomas Lothrop (`M1PZ-RZF`) is an England-born immigrant endpoint; his parents should be excluded from strict Isaac analysis.
- Lucy Smith tree: many England-born immigrant endpoints have parent slots present in generation 6 or elsewhere; those parent slots should be excluded from strict analysis unless deliberately reopened.

### pid_only_unharvested_queue_artifact
A slot has a PID but no name, sex, birth/death dates, or birth/death places. The user suspects many such rows derive from a known Navigator queue imperfection where missing-parent situations can feed sibling/child PIDs into the queue. In practice, the user often recognized the problem and did not harvest those pages.

Rule: preserve structurally, but exclude from Phase 2 demographic, migration, origin, and composition analyses unless separately reviewed and harvested. Do not treat as a meaningful ancestor data point.

### relationship_known_demographics_absent
A relationship appears structurally known, but usable demographic fields are absent or incomplete.

Rule: keep the relationship structure, but exclude missing fields from strict demographic analysis. If the missing field affects immigrant classification, mark for review.

### birthplace_missing_review_required
A person has no birthplace, and birthplace matters for immigrant-boundary or origin analysis.

Rule: handle case by case. Do not infer strict birthplace automatically from spouse, child, death place, surname, or surrounding family unless an accepted overlay or explicit annotation exists.

Subtypes:
- evidence_backed_overlay_candidate: external evidence has been reviewed and may justify an overlay.
- inferred_domestic_from_parents: family context suggests domestic/colonial birth because both parents are known immigrants or known domestic-line parents; use only as annotation unless evidence is accepted.
- inferred_domestic_from_spouse_context: spouse and surrounding family context suggest domestic/colonial birth; weaker than parent-based inference and should not be strict unless corroborated.
- unresolved_broken_branch: birthplace and parents remain unresolved.

Lucy Smith examples:
- Daniel Ladd Sr. (`LRYD-YBN`): FamilySearch-derived person record has birth date but no birthplace. User found Ancestry.com origin data. Planned handling: accepted birthplace overlay after exact wording/source is recorded, then builder patch/test to apply `override_birth_place` overlays.
- Mary Haggett (`P87C-6PX`): no own birthplace in slotmap, but parents Henry Haggett and Ann Hannah Pinder are English immigrants. Best guess may be domestic/colonial birth, but store as an analysis annotation unless a direct source is found.
- Ezekiel Worthen Sr. (`MPKG-QVT`): no birth year/place in slotmap; married to Hannah Martin, a non-immigrant colonial-line spouse. Best guess may be domestic/colonial birth, but this is spouse/context inference and should be lower confidence. Preserve broken-branch status.

### broken_branch_missing_parents
A person appears in the tree, but upstream parents are missing, unavailable, suspicious, or not captured.

Rule: record and impact-score before repair. Low-impact terminal broken branches can usually remain unresolved. Early-generation high-impact broken branches may justify targeted research.

### historically_suspect_place
A place string is anachronistic, jurisdictionally awkward, or likely to confuse automated classification.

Rule: do not hand-correct ad hoc. Route through the place-authority table. Preserve raw strings while assigning normalized place and immigrant-boundary class.

Examples include variants such as Massachusetts Bay Colony, Province of Massachusetts Bay, British Colonial America, British America, USA, United States, county changes such as Norfolk/Essex, and bare country names like England.

### pedigree_collapse_duplicate_pid
The same PID or ancestral couple appears in multiple slots because of cousin marriage / pedigree collapse.

Rule: do not remove or “fix” as a duplicate. Preserve slot occurrences. Scripts must support at least two counting modes:

- unique_person_mode: count each PID once. Useful for migration maps, unique ancestor lists, biographical/photo searching, and “who appears in the corpus?” questions.
- slot_weighted_mode: count each slot occurrence. Useful for documented pedigree composition and genetic-composition-style analyses, where the same ancestor may contribute through more than one line.

Lucy Smith example: repeated John Page / Mary Marsh and related Marsh/Page ancestors appear to represent genuine pedigree collapse rather than an error.

### external_source_candidate
An outside source supplies possible missing or corrected data.

Rule: if user-reviewed and accepted, create an overlay with source and rationale. If not accepted, record only as a research lead.

## Required automated audits for Phase 2 prep

### Immigrant-boundary audit
For every filled slot:
1. classify birth place using the place-authority table;
2. if the slot is foreign-born/immigrant endpoint, check whether parent slots are filled;
3. flag downstream parent slots as `immigrant_boundary_crossed`;
4. exclude those slots from strict immigrant-limited analysis unless overridden.

### PID-only audit
Flag slots with PID but no name and no usable demographics as `pid_only_unharvested_queue_artifact` or `relationship_known_demographics_absent`, depending on context.

### Duplicate-PID audit
Produce both unique-PID counts and slot-weighted counts. Do not collapse duplicate PIDs before deciding analysis mode.

### Missing birthplace audit
Flag people whose birthplace is blank or too vague to classify. Split into overlay candidate, annotation candidate, and unresolved cases.

## Overlay and annotation posture
Accepted overlays can be used in strict analysis. Analysis annotations can be used in expanded/sensitivity analysis or as explicitly labeled assumptions. Raw harvested records should remain unchanged unless a future workflow deliberately creates a derived corrected record layer.
