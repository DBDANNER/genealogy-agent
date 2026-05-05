# Phase 2 Analysis Plan — 260505 v1

## Purpose
This file defines the staged plan for Phase 2 analysis of the harvested ancestry corpus. Phase 2 should begin only after enough Phase 1.5 rough-spot and place-authority policy exists to prevent crude assumptions from contaminating results.

## Analysis posture
Early Phase 2 should be read-only. Do not mutate raw harvested records. Do not automatically write broad overlays. Add overlays only for user-reviewed corrections. Add analysis annotations only when the policy layer defines a field, basis, and confidence.

## Primary data sources
Use these sources as structured inputs:
- Stage 1 slotmap CSVs in `tree_builder_reports`
- Stage 1 slotmap JSON files where useful
- per-person JSON files in `people`
- relationship links in `links/links_all.jsonl`
- overlays in `commentary_overlay`
- place-authority table once created

Rendered minitree workbooks are excellent human visual aids but should not be the primary structured source for scripts.

## Phase 1.5 prerequisites
Before major Phase 2 reports:
1. complete enough rough-spot review to stabilize categories;
2. create a place-string inventory;
3. classify all distinct birthplace strings in a place-authority table;
4. define strict versus expanded analysis rules;
5. implement or specify the immigrant-boundary audit;
6. implement or specify PID-only artifact exclusion;
7. decide how accepted overlays and analysis annotations are loaded.

## Phase 2A: missingness and coverage report
Build a coverage report across all slotmaps.

Questions:
- How many slots are filled per root minitree?
- How many unknown placeholders exist?
- How many PID-only rows exist?
- How many missing/broken branches exist?
- How many stops are intentional immigrant boundaries?
- How many filled slots are downstream of immigrant endpoints and out of strict scope?
- Which broken branches have high lost-slot impact and deserve repair?

Important distinction: missing data and over-included data are different. Immigrant-boundary crossings are over-included/out-of-scope data, not missingness.

## Phase 2B: place authority / birthplace classification
Create a complete place authority table from all distinct birthplaces and, later if useful, death places.

The place table should become the single source of truth for immigrant-boundary classification, origin grouping, and historic-place normalization.

See `docs/place_authority_plan_260505_v1.md`.

## Phase 2C: consolidated unique ancestor table
Build a consolidated ancestor table keyed by PID.

Suggested fields:
`pid, preferred_name, sex, birth_year, birth_place_raw, birth_place_normalized, birth_country_equivalent, immigrant_boundary_class, death_year, death_place_raw, generation_min, generation_max, root_trees_present, slot_count, source_files, rough_spot_flags, overlay_flags, strict_analysis_include, expanded_analysis_include, notes`

This table supports later migration, composition, photo, and famous-person work.

## Phase 2D: duplicate PID / pedigree-collapse accounting
Support at least two counting modes.

### unique_person_mode
Each PID counts once. Use for:
- unique ancestor lists
- migration maps
- photo/memory searching
- biographical enrichment
- famous-person matching
- “how many unique ancestors?” questions

### slot_weighted_mode
Each occupied slot counts. Use for:
- documented pedigree composition
- genetic-composition-style analysis
- ancestor-contribution questions
- pedigree-collapse weighting

Do not deduplicate before choosing mode. Repeated PIDs may be real cousin marriage/pedigree collapse.

## Phase 2E: migration and geography analysis
Use slotmaps, the unique ancestor table, and the place-authority table to summarize movement by generation, line, region, and time.

Potential outputs:
- birthplaces by generation
- immigrant endpoints by root and line
- movements from Europe/Canada to colonies/states
- colonial/state concentration over time
- tabular or mapped migration paths where data supports them

Run strict analysis first. Expanded analysis may use labeled annotations only.

## Phase 2F: documented origin composition
Estimate documented pedigree origin composition. Keep it clearly separate from commercial DNA ethnicity estimates.

Strict mode should use documented places and accepted overlays only.

Expanded mode may use labeled best guesses, such as a reviewed domestic-birth inference from parents, but must report that those entries are inferred.

Use slot-weighted mode when answering genetic-composition-style questions; use unique-person mode for simple ancestor inventory/origin diversity questions.

## Phase 2G: FamilySearch photos and memories pass
Use the stabilized corpus to drive a human-curated enrichment pass through FamilySearch memories/photos.

Suggested manifest fields:
`pid, name, root_context, photo_count_seen, saved_files, source_url, notes, reviewed_timestamp`

## Phase 2H: Wikipedia/Wikidata/famous-person matching
Use the consolidated unique ancestor table to search for candidates in Wikidata/Wikipedia.

Treat matches as leads, not proofs. Confidence scoring should be conservative, especially for common names.

Suggested fields:
`ancestor_pid, ancestor_name, birth_year, death_year, birth_place, candidate_title, candidate_birth_year, candidate_death_year, candidate_url, confidence, reason, review_status`

## Candidate first implementation tasks
After Phase 1.5 policy stabilizes, good first Codex/local script tasks are:
1. place-string inventory;
2. place-authority table starter file;
3. immigrant-boundary audit;
4. PID-only artifact report;
5. missingness/coverage report;
6. consolidated unique ancestor table.

Codex prompts should specify a versioned new target filename and should tell Codex not to print the full code at the end unless explicitly needed.
