# Phase 2 Analysis Plan — 260925 v4

## Status
Current durable roadmap for final analytical work after the broken-branch cycle and the targeted Ancestry.com evidence sweep.

This file supersedes `docs/phase2_analysis_plan_260925_v3.md` for planning purposes while preserving earlier versions as historical records.

## Preconditions before final analyses

Complete these first:

1. Finish the active broken-branch investigations and ordinary-Chat peer review.
2. Complete the targeted Ancestry.com sweep for genuinely new evidence only.
3. Preserve useful Ancestry DNA analysis/conclusions, photographs, and other unique material before reducing the subscription.
4. Apply the accepted `tree-alterations-indicated-by-broken-branch-research.md` overlay to analytical inputs without silently rewriting the base mini-trees.
5. Run a coverage/missingness review so every final quantitative analysis reports how much pedigree weight is documented, unresolved, or excluded.
6. Use reviewed place-authority rules for country and region assignment.

## Core analytical architecture

Retain the Phase 2 design rule:

**One analysis question -> one reviewed sidecar contract -> one simple compiler.**

Raw harvests, people JSON, mini-trees, slotmaps, canonical case reports, source images, and provenance records remain the evidence base.

Sidecars are compiler-safe summaries of reviewed analytical judgments, not evidence archives.

---

# PRIMARY ANALYSES

## 1. Migration and geography through time

Purpose: show the broad shape and flavor of documented ancestor movement, with time as an explicit dimension.

Potential outputs:
- immigrant endpoints by line and generation;
- Europe -> North America flows, including Canada;
- Europe/Canada -> colonial/U.S. destinations;
- birth-to-death movement lines where defensible;
- North American concentration over time;
- state/colony and regional settlement waves;
- generation panels with computed date labels;
- animated or sequential maps where practical;
- maternal/paternal or grandparent-line comparisons;
- strict versus expanded views where inference is clearly labeled.

Useful map sequence:
1. European origin regions.
2. First North American destinations.
3. Colonial / early U.S.-Canada distribution.
4. Nineteenth-century internal migration.
5. More recent convergence toward the user's recent family geography.

Important limitation: birth-to-death lines are not complete residence histories. Never invent intermediate stops.

## 2. Documented origin composition

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

## 3. Recent-ancestor compositional profiles

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
7. A secondary known-only normalized view may be shown for readability, but only beside the full-coverage result.
8. Carry evidence/confidence and coverage metadata so a visually precise percentage is not mistaken for equally precise genealogy.

Recommended output:
- one matrix with recent ancestors as rows and origin countries as columns;
- one profile chart per recent ancestor if useful;
- coverage/unknown column;
- optional historical-region notes;
- aggregate user profile computed from the same slot-weighted system.

This analysis must use the tree-alteration overlay. Unsupported natal places or parents must not generate origin weight merely because they remain in a base tree.

## 4. Documentary composition versus Ancestry DNA

Purpose: use Ancestry DNA ethnicity/parental-inheritance estimates as an external reasonableness check on documentary composition.

Comparison posture:
- compare broad patterns, not exact equality;
- distinguish expected genealogical ancestry from realized inherited DNA after recombination;
- remember that parental-side estimates inferred from the user's DNA are not complete genotypes of either parent unless separately tested;
- expect category mismatch where commercial reference regions do not map one-to-one to countries;
- treat disagreement as a diagnostic clue, not automatically as proof that either genealogy or DNA estimate is wrong.

Useful comparisons:
- maternal documentary composition versus Ancestry maternal-side estimate;
- paternal documentary composition versus Ancestry paternal-side estimate;
- whole-user documentary composition versus whole-user DNA ethnicity;
- investigate only large or structurally meaningful discrepancies.

## 5. Coverage, missingness, and confidence

Before interpreting percentages or maps, quantify:
- documented pedigree weight;
- unknown/unresolved pedigree weight;
- intentionally stopped immigrant boundaries;
- uncertain but usable branches;
- branches altered by the research overlay;
- high-impact missing branches.

Potential output:
- coverage by generation;
- coverage by parent/grandparent/great-grandparent line;
- “how much of this result is actually known?” indicators beside every quantitative analysis.

---

# VISUAL / BIOGRAPHICAL ENRICHMENT

## 6. Ancestor photo and portrait archive

Purpose: assemble a curated visual archive that makes the family history feel human rather than merely tabular.

Search sources, where reasonable:
- Ancestry.com;
- FamilySearch Memories/photos;
- existing family files;
- Find a Grave where photographs are present and reusable for personal study;
- historical societies, libraries, archives, university collections, Internet Archive, Wikimedia Commons, and other web sources;
- general web search for named ancestors when the identity is sufficiently distinctive.

Search priorities:
- highest priority: direct-line ancestors;
- next: spouses or close relatives when the image adds context;
- prioritize people born late enough that photographs or reliable portraits could realistically exist;
- do not spend disproportionate effort searching for photographs of people who died before photography;
- for recent ancestors with many images, curate a representative set rather than saving everything.

Recommended archive per person:
- best original portrait(s);
- source/provenance;
- approximate date;
- identification confidence;
- copyright/reuse note where relevant;
- optional contextual image such as home, workplace, grave, church, town, ship, or military unit when genuinely informative.

### AI restoration / enhancement

Preserve the original image unchanged.

Optional derivative versions may include:
- scratch/dust/tear repair;
- contrast and exposure correction;
- careful sharpening/upscaling;
- restrained colorization;
- reconstruction of damaged areas when clearly labeled;
- experimental modernized portrait versions with contemporary clothing/hairstyle to emphasize the person rather than period fashion.

Rules:
- originals and derivatives must never be confused;
- every AI-edited image should be labeled as restored, colorized, reconstructed, or modernized;
- do not treat generated facial detail as historical evidence;
- modern-clothes/hairstyle versions are interpretive art, not restoration;
- keep provenance linking every derivative back to its original.

A useful final presentation could show:
**Original | Restored | Optional modernized interpretation**

## 7. Famous / notable ancestor analysis

Purpose: identify ancestors with significant historical, political, religious, scientific, military, literary, civic, or cultural biographies.

Method:
1. deduplicate ancestors globally by PID;
2. search Wikidata first, Wikipedia second;
3. compare name, dates, places, spouses, parents, children, occupation, and known family context;
4. manually/AI-review plausible matches;
5. require genealogical identity to be independently secure before calling someone an ancestor;
6. store confirmed and rejected matches separately.

Potential outputs:
- notable ancestor list;
- brief biography;
- exact genealogical path from user to notable ancestor;
- historical significance;
- confidence/provenance.

William Bradford is an example of the type of person this workstream should detect if the genealogical path is supported.

## 8. Deep-history / “cocktail-party ancestry” connections

Purpose: explore interesting very-deep connections to famous historical figures such as Charlemagne, medieval royalty, or other frequently claimed gateway lineages.

This is intentionally separate from the evidence-grade core pedigree.

Method:
- begin only from a well-supported gateway ancestor in the reviewed pedigree;
- use reputable published medieval genealogy / scholarly compilations where available;
- distinguish each bridge by evidence quality;
- never infer a connection merely because an online tree reaches a famous person;
- stop when the chain becomes genealogically speculative.

Recommended labels:
- **documented direct-line pedigree**
- **accepted scholarly medieval reconstruction**
- **traditional / disputed**
- **fun but unproved**

Potential output:
- “If the accepted gateway lineage is correct, the documented/reconstructed path to X is …”
- short explanation of why very deep famous ancestry becomes statistically unsurprising and genealogically hard to prove.

This workstream is entertainment and historical context, not a foundation for the main pedigree.

---

# SOCIAL / DEMOGRAPHIC ANALYSES — CANDIDATES

## 9. Pedigree collapse and repeated ancestors

Questions:
- how many nominal slots versus unique people?
- where does pedigree collapse first appear?
- which ancestors recur most often?
- what fraction of expected genealogical contribution comes through repeated ancestors?
- are particular communities/endogamous populations responsible?

Potential outputs:
- unique-versus-slot counts by generation;
- most repeated ancestors;
- heat map/tree annotations for collapse.

## 10. Generational timing

Questions:
- median parental age by generation;
- generation interval by maternal versus paternal line;
- unusually long or short generations;
- how far back in calendar time each generation reaches.

Useful for explaining why different branches reach the immigrant boundary at very different nominal generations.

## 11. Longevity and family structure

Possible descriptive analyses:
- lifespan by birth cohort;
- age at marriage;
- age at first/last documented child;
- number of documented children;
- widowhood/remarriage patterns;
- infant/child mortality where the data are sufficiently complete.

Strong caveat: incomplete historical records create survivorship and ascertainment bias. Treat this as descriptive genealogy, not epidemiology.

## 12. Occupation / social-history profile

Where source data support it:
- occupations and trades;
- farming versus urban work;
- clergy, military, maritime, craft, professional, industrial categories;
- continuity of occupations across generations;
- changes accompanying migration or urbanization.

Potential output:
- occupational distribution by era;
- short “what kind of lives did these people live?” synthesis.

## 13. Religious / community affiliation

Where evidence exists:
- church/denomination;
- Quaker, Puritan/Congregational, Reformed, Catholic, etc.;
- shifts across generations;
- relationship between religious community and migration;
- church-centered FAN clusters.

Do not infer religion merely from ethnicity or location.

## 14. Military and major-event intersections

Match reviewed ancestors to historically relevant events when evidence supports presence or service:
- colonial wars;
- American Revolution;
- War of 1812;
- Civil War;
- major migrations;
- epidemics;
- industrialization;
- westward settlement;
- immigration waves.

Purpose: create context, not manufacture participation.

## 15. Geographic persistence versus mobility

Measure:
- families that stayed in one county/region for generations;
- branches with unusually high mobility;
- distance moved by generation where places are precise enough;
- rural-to-urban or coast-to-interior shifts.

## 16. Surname and lineage persistence

Possible questions:
- which surnames persist longest in the direct pedigree?
- which disappear quickly through female-line descent?
- which surnames recur through pedigree collapse or cousin marriage?
- which unusual surnames are most genealogically distinctive?

This is mainly descriptive/fun.

## 17. Founder / immigrant contribution ranking

Using slot-weighted mode:
- which immigrant/gateway ancestors contribute the largest expected genealogical share?
- which origin families account for large portions of a recent ancestor's composition?
- which immigrant ancestors recur through pedigree collapse?

Keep this separate from realized DNA contribution.

## 18. Historical “family atlas” / narrative synthesis

Potential final product:
- selected maps;
- composition charts;
- portraits;
- notable ancestors;
- representative occupations;
- major migration waves;
- short family-line narratives;
- explicit uncertainty markers.

Goal: convert the analytical corpus into a readable family-history product rather than leaving it as only spreadsheets and reports.

---

# ROUGH SPOTS / NEEDS-WORK QUEUE

## 19. Rough spots and contradiction queue

Preserve:
- unresolved branches;
- suspicious chronology;
- place ambiguities;
- overlay candidates;
- high-impact missingness;
- contradictions revealed by final analyses;
- records that become newly accessible.

This remains a research queue, not a numerical input unless a relevant analytical sidecar explicitly encodes the effect.

---

# PLACE AUTHORITY RULE

Use the reviewed place-authority table as the single source of truth for country/equivalent origin bins.

Minimum fields:
`raw_place, normalized_place, modern_country_equivalent, historic_region, immigrant_boundary_class, use_for_origin_analysis, use_for_migration_analysis, confidence, notes`

Never silently increase geographic precision.

Examples:
- “England” must not become London.
- “Massachusetts Bay Colony” is not a European origin.
- historical Palatine/Germanic labels should preserve historical context even when grouped under a modern-country-equivalent category for a chart.

---

# COUNTING MODES

## unique_person_mode
Use for:
- unique ancestor inventories;
- biographical enrichment;
- photo searches;
- famous-person matching;
- “how many distinct ancestors?” questions.

## slot_weighted_mode
Use for:
- documented origin composition;
- recent-ancestor compositional profiles;
- expected ancestry-contribution questions;
- founder contribution;
- analyses where pedigree collapse must retain genealogical weight.

Do not deduplicate before choosing the counting mode.

---

# FINAL SEQUENCING

After the remaining broken branches:

1. Targeted Ancestry.com evidence sweep.
2. Review/update canonical reports and analytical overlay for any genuinely new evidence.
3. Preserve Ancestry DNA conclusions, photographs, and other unique material needed later.
4. Coverage/missingness and place-authority cleanup.
5. Build the curated cross-source ancestor photo archive.
6. Recent-ancestor compositional profiles.
7. Whole-pedigree documented origin composition.
8. DNA-versus-documentary comparison.
9. Migration/geography analyses.
10. Famous/notable ancestor matching.
11. Optional deep-history/gateway-ancestor exploration.
12. Pedigree-collapse, demographic, occupation, religion, mobility, event-context, and other candidate analyses as interest warrants.
13. Assemble a possible family-atlas / narrative synthesis.
14. Deliberate final tree reconciliation only after the analytical consequences of unresolved/corrected branches are visible.

---

# GOVERNING CAUTIONS

The goal of quantitative or visual analysis is not false precision or false realism.

Every percentage, map, portrait, famous-person claim, and historical connection should remain traceable to:
- reviewed pedigree slots;
- explicit origin classification;
- explicit unknown/unresolved weight;
- accepted analytical overlays;
- source provenance;
- clear separation between documented fact, inference, scholarly reconstruction, and entertainment;
- clear separation between original historical images and AI-altered derivatives.
