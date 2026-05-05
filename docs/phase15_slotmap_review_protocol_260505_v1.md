# Phase 1.5 Slotmap Review Protocol — 260505 v1

## Purpose
This protocol defines how to review a minitree/slotmap pair during Phase 1.5. The goal is not to fix every issue immediately. The goal is to classify rough spots, identify policy lessons, and prepare safe inputs for Phase 2 scripts.

## Inputs
For each reviewed root, use:
- rendered minitree workbook or user visual review notes;
- Stage 1 slotmap CSV;
- Stage 1 slotmap JSON if needed;
- relevant per-person JSONs for disputed fields;
- overlays in `commentary_overlay` if applicable.

## Review order

### 1. Visual minitree review
Use the workbook or user’s visual review to catch obvious name/shape problems:
- blank visible names;
- unexpected missing branches;
- obvious wrong-generation/person placement;
- parent order problems;
- visible duplicate-couple patterns.

### 2. Slotmap data-layer review
Use the CSV/JSON to audit fields that are hard to see visually:
- PID-only rows;
- missing birthplaces;
- missing names with PIDs;
- foreign-born/immigrant endpoints;
- parent slots downstream of immigrant endpoints;
- duplicate PIDs;
- historically awkward place strings;
- parent assignment review flags;
- unknown placeholders.

### 3. Classify each rough spot
Use the categories in `phase15_rough_spot_policy_260505_v1.md`:
- `acceptable_missing_maiden_name_with_own_origin`
- `immigrant_endpoint`
- `immigrant_boundary_crossed`
- `pid_only_unharvested_queue_artifact`
- `relationship_known_demographics_absent`
- `birthplace_missing_review_required`
- `broken_branch_missing_parents`
- `historically_suspect_place`
- `pedigree_collapse_duplicate_pid`
- `external_source_candidate`

### 4. Assign handling mode
For each rough spot, decide whether it is:
- no action / acceptable as-is;
- strict-analysis exclusion;
- expanded-analysis annotation;
- overlay candidate;
- research lead;
- future code/spec lesson.

### 5. Separate correction from analysis
Do not convert an analysis assumption into a genealogical fact. For example:
- accepted Ancestry birthplace for Daniel Ladd may become an overlay after exact wording/source is recorded;
- inferred domestic birth for Mary Haggett may be an annotation, not a raw birthplace;
- PID-only rows are usually artifacts to ignore, not ancestors to repair;
- duplicate PIDs are often pedigree collapse, not duplicates to remove.

## Suggested rough-spot review CSV fields
`root_name, root_pid, slot, ancestor_pid, ancestor_name, issue_type, issue_description, proposed_handling, analysis_effect, evidence_or_basis, confidence, needs_overlay, needs_research, notes`

## Consensus rules from Isaac Pollard and Lucy Smith pilots

1. Missing maiden name is not a blocker when the person has her own documented birthplace/origin. Include as-is and preserve the name limitation.

2. Ancestors beyond immigrant endpoints should be identified and excluded from strict Phase 2 analysis unless the line is deliberately reopened.

3. PID-only rows should not be used in Phase 2 analyses unless later reviewed and harvested.

4. Missing birthplace cases are case-by-case. Accepted external evidence can become an overlay; family-context guesses should be analysis annotations with confidence.

5. Duplicate PIDs/couples should be preserved. Use unique-person mode or slot-weighted mode depending on the analysis.

6. Historic place strings should be normalized through a place-authority table, not ad hoc script logic.

## Immediate Lucy Smith follow-up items
- Daniel Ladd Sr. (`LRYD-YBN`): user found Ancestry origin data. Create accepted birthplace overlay after exact wording/source is recorded. Then patch/test builder so `override_birth_place` affects slotmap output.
- Mary Haggett (`P87C-6PX`): no own birthplace; parents are English immigrants. Possible domestic/colonial best guess for expanded analysis only unless sourced.
- Ezekiel Worthen Sr. (`MPKG-QVT`): no birth year/place; spouse context suggests domestic/colonial, but weaker. Preserve broken-branch status and use only as annotated inference if needed.
