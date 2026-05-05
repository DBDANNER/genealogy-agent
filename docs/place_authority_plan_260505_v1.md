# Place Authority Plan — 260505 v1

## Purpose
This file defines the plan for building a place-authority table for the Ancestry Project. The table is required before major Phase 2 analyses so that birthplace and death-place strings are classified consistently.

The core need is an immigrant-country / birthplace classification table: collect every distinct birthplace string in the harvested corpus and explicitly classify whether it indicates domestic/proto-U.S., foreign/immigrant, ambiguous, or unknown status for the project’s immigrant-boundary rules.

## Why this matters
Raw place strings vary heavily:
- `United States`
- `USA`
- `Massachusetts Bay Colony`
- `Province of Massachusetts Bay`
- `British Colonial America`
- `British America`
- bare `England`
- English counties and parishes
- Canadian provinces/colonies
- county names that changed or became obsolete

Scripts should not independently guess what each string means. Place classification should come from one reviewed table.

## Starter table columns
Recommended columns:
`raw_place, normalized_place, modern_country_equivalent, historic_region, immigrant_boundary_class, use_for_origin_analysis, use_for_migration_analysis, confidence, notes`

Optional later columns:
`state_or_province, county_or_shire, town_or_parish, latitude, longitude, date_scope, reviewed_by, reviewed_at, source_rule`

## Immigrant-boundary classes
Suggested initial classes:

### domestic_us
Modern U.S. locations after U.S. formation.

### proto_us_colonial
Colonial locations that later become part of the United States, such as Massachusetts Bay Colony or Province of Massachusetts Bay. Treat as domestic/proto-U.S. for immigrant-boundary purposes unless a specific analysis asks otherwise.

### foreign_immigrant
Locations outside the U.S./proto-U.S. colonial boundary, such as England, Scotland, Ireland, Wales, Netherlands, France, Germany, and similar foreign origins.

### canada_special
Canadian locations should be explicitly classified, not casually merged with U.S. or generic British colonial strings. For U.S.-line immigrant-boundary purposes, Canada-born ancestors are foreign-born unless a later analysis deliberately uses a broader North American/British-colonial category.

### ambiguous_review_required
Place strings that cannot safely classify immigrant status without review.

### unknown_or_blank
Blank, unknown, deceased-only, or non-place strings.

## Strict versus expanded use
Strict analysis should use only reviewed place classes and accepted overlays.

Expanded analysis may use inferred/annotated classifications, but they must be clearly labeled as inferred and kept separate from strict results.

## Initial implementation plan

### Step 1: collect raw strings
Scan all relevant slotmap CSV/JSON files and/or people records for distinct birth_place strings. Include counts and example PIDs/roots for each raw string.

### Step 2: create starter table
Generate a CSV with one row per distinct raw birthplace. Pre-fill obvious values where safe, but mark uncertain rows for review.

### Step 3: review and classify
User/assistant review ambiguous strings. Do not let scripts make unreviewed assumptions for historically tricky cases.

### Step 4: use table in audits
Use the reviewed table for:
- immigrant-boundary audit;
- missingness/coverage report;
- consolidated unique ancestor table;
- origin composition;
- migration/geography summaries.

## Lucy Smith examples that motivate the table
Lucy Smith’s slotmap contains many place-string variants that scripts must normalize carefully:
- `Haverhill, Essex, Massachusetts, United States`
- `Haverhill, Essex, Massachusetts Bay Colony, British Colonial America`
- `Haverhill, Essex, Massachusetts Bay, British Colonial America`
- `Ipswich, Essex County, Province of Massachusetts Bay, British America`
- `Amesbury, Essex, Province of Massachusetts Bay, British Colonial America`
- `Middlesex, England`
- `England`
- `Salisbury, Wiltshire, England, United Kingdom`
- `Kirk Ella, Yorkshire, England, United Kingdom`

## Non-goals for first pass
Do not attempt perfect historical GIS. The first pass only needs reliable classification for project analyses:
- domestic/proto-U.S. versus foreign/immigrant;
- usable normalized country/region labels;
- ambiguous rows flagged for human review.
