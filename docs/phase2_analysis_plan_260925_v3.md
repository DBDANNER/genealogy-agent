# Phase 2 Analysis Plan — 260925 v3

## Status
Current durable roadmap for final analytical work after the broken-branch cycle and the Ancestry.com evidence sweep.

This file supersedes `docs/phase2_analysis_plan_260505_v2.md` for planning purposes while preserving v1/v2 as historical records.

## Preconditions before final analyses

Complete these first:

1. Finish the active broken-branch investigations and ordinary-Chat peer review.
2. Complete the targeted Ancestry.com sweep for genuinely new evidence only.
3. Preserve useful Ancestry DNA analysis/conclusions and relevant photographs before reducing the subscription.
4. Apply the accepted `tree-alterations-indicated-by-broken-branch-research.md` overlay to analytical inputs without silently rewriting the base mini-trees.
5. Run a coverage/missingness review so every final quantitative analysis reports how much pedigree weight is documented, unresolved, or excluded.
6. Use reviewed place-authority rules for country and region assignment.

## Core analytical architecture

Retain the Phase 2 v2 design rule:

**One analysis question -> one reviewed sidecar contract -> one simple compiler.**

Raw harvests, people JSON, mini-trees, slotmaps, canonical case reports, and source images remain the evidence base.

Sidecars are compiler-safe summaries of reviewed analytical judgments, not evidence archives.

## Primary workstreams

### 1. Migration and geography analysis

Purpose: show the broad shape of documented ancestor movement.

Potential outputs:
- immigrant endpoints by line and generation;
- Europe/Canada -> colonial/U.S. movements;
- birth-to-death movement maps;
- North American concentration over time;
- generation panels with date labels;
- strict versus expanded views where inference is clearly labeled.

Important limitation: birth-to-death lines are not complete residence histories.

### 2. Documented origin composition

Purpose: estimate expected genealogical ancestry composition from documented immigrant/origin endpoints.

This is **documentary/genealogical composition**, not a claim about exact inherited DNA.

Counting rules:
- use slot-weighted contribution, not raw immigrant counts;
- repeated appearances caused by pedigree collapse retain their repeated slot contribution;
- carry `Unknown / Unresolved` explicitly rather than renormalizing uncertainty away;
- use reviewed country-equivalence/place-authority assignments;
- preserve historical-region labels in notes when a modern-country equivalent is an imperfect simplification.

Recommended outputs:
- modern-country-equivalent composition;
- optional historical-region composition;
- strict and, where useful, clearly labeled expanded versions;
- documented-coverage percentage alongside every composition.

### 3. Recent-ancestor compositional profiles — NEW 25 Sep 2026

Purpose: calculate the documentary origin composition of the user's recent ancestors individually, through the great-grandparent generation.

Target profile set:
- user aggregate;
- 2 parents;
- 4 grandparents;
- 8 great-grandparents.

For each target person, ask:

**What percentage of that person's expected genealogical ancestry traces to each reviewed country/equivalent origin?**

Method:
1. Treat the selected recent ancestor as the temporary root.
2. Trace each ancestral slot backward to the project's reviewed immigrant/origin boundary.
3. Weight each endpoint by its Mendelian genealogical expectation relative to that root: `1 / 2^g` for an endpoint g generations above the root.
4. If pedigree collapse causes the same person to occupy multiple ancestral slots, preserve the repeated slot weights.
5. If a branch cannot be carried to a defensible origin, assign that weight to `Unknown / Unresolved`.
6. Do not silently renormalize the primary table to 100% known ancestry. The primary profile must sum to 100% including unknown/unresolved weight.
7. A secondary "known-only" normalized view may be shown for readability, but only beside the full-coverage result.
8. Carry evidence/confidence and coverage metadata so a visually precise percentage is not mistaken for equally precise genealogy.

Recommended output:
- one matrix with recent ancestors as rows and origin countries as columns;
- one profile chart per recent ancestor if useful;
- coverage/unknown column;
- optional historical-region notes;
- aggregate user profile computed from the same slot-weighted system.

This analysis should use the tree-alteration overlay. Unsupported natal places or parents must not generate origin weight merely because they remain in a base tree.

### 4. Documentary composition versus Ancestry DNA

Purpose: use Ancestry DNA ethnicity/parental-inheritance estimates as an external reasonableness check on the documentary composition.

Comparison posture:
- compare broad patterns, not exact equality;
- distinguish expected genealogical ancestry from realized inherited DNA after recombination;
- remember that Ancestry's maternal/paternal estimates are inferred from the user's DNA rather than direct genotypes from both parents unless separate parental tests exist;
- expect category mismatch where Ancestry uses reference regions that do not map one-to-one to modern countries;
- treat disagreement as a diagnostic clue, not automatically as proof that either the genealogy or DNA estimate is wrong.

Useful comparisons:
- aggregate maternal documentary composition versus Ancestry's maternal-side estimate;
- aggregate paternal documentary composition versus Ancestry's paternal-side estimate;
- whole-user documentary composition versus whole-user DNA ethnicity;
- investigate only large or structurally meaningful discrepancies.

### 5. Rough spots / needs-work queue

Preserve:
- unresolved branches;
- suspicious chronology;
- place ambiguities;
- overlay candidates;
- high-impact missingness;
- contradictions revealed by final analyses.

This remains a research queue, not a numerical input unless the relevant analytical sidecar explicitly encodes the effect.

### 6. Wikipedia/Wikidata / biographical enrichment

After pedigree stabilization:
- deduplicate by PID for unique-person searches;
- use Wikidata-first candidate discovery;
- conservatively verify name/dates/places/family context;
- keep match results separate from search manifests.

### 7. Photo/memory enrichment

Use stabilized ancestor manifests for:
- FamilySearch memories/photos;
- saved family photographs;
- source-linked image review where useful.

## Place authority rule

Use the reviewed place-authority table as the single source of truth for country/equivalent origin bins.

Minimum fields remain:
`raw_place, normalized_place, modern_country_equivalent, historic_region, immigrant_boundary_class, use_for_origin_analysis, use_for_migration_analysis, confidence, notes`

Never silently increase geographic precision.

Examples:
- "England" must not become London.
- "Massachusetts Bay Colony" is not a European origin.
- historical Palatine/Germanic labels should preserve historical context even when grouped under a modern-country-equivalent category for a chart.

## Counting modes

### unique_person_mode
Use for:
- unique ancestor inventories;
- biographical enrichment;
- photo searches;
- famous-person matching;
- "how many distinct ancestors?" questions.

### slot_weighted_mode
Use for:
- documented origin composition;
- recent-ancestor compositional profiles;
- expected ancestry-contribution questions;
- analyses where pedigree collapse must retain genealogical weight.

Do not deduplicate before choosing the counting mode.

## Final sequencing

After the remaining broken branches:

1. Targeted Ancestry.com evidence sweep.
2. Review/update canonical reports and analytical overlay for any genuinely new evidence.
3. Preserve Ancestry DNA conclusions/photos needed for later comparison.
4. Coverage/missingness and place-authority cleanup.
5. Recent-ancestor compositional profiles.
6. Whole-pedigree documented origin composition.
7. DNA-versus-documentary comparison.
8. Migration/geography analyses.
9. Other enrichment/synthesis workstreams.
10. Deliberate final tree reconciliation only after the analytical consequences of unresolved/corrected branches are visible.

## Governing caution

The goal of quantitative analysis is not false precision.

Every percentage, map, and comparison should remain traceable to:
- reviewed pedigree slots;
- explicit origin classification;
- explicit unknown/unresolved weight;
- accepted analytical overlays;
- clear separation between documented fact, inference, and DNA-based estimate.
