# Ancestor Investigation Status

**Canonical working ledger for the Chat + Work genealogy project**  
Last updated: 12 September 2026

This file preserves the active ancestor-research queue independently of any single Chat or Work conversation. It should be updated after each completed Work investigation and ordinary-Chat peer review, and whenever a completed investigation exposes a new broken branch.

`current-work.txt` is transient telemetry for the currently running Work job. **This file is the durable project-state ledger.**

## Immediate state

- **John Morehouse LH3N-NZT** — Work investigation complete; ordinary Chat peer review still pending before any FamilySearch edits.
- **Next planned Work case:** Nathaniel Peck M4DP-DRQ.
- **Then:** investigate the newly exposed unknown wife of the predeceased John Morehouse who appears to have been the true father of LH3N-NZT.
- No FamilySearch relationship changes should be made from Work findings until ordinary Chat has peer-reviewed the case.

## Original broken-branch roster

| Original rank | Ancestor | PID | Current status | Current conclusion / next action |
|---|---|---|---|---|
| 1 | Sarah Jones / Sarah surname unknown | LCRC-GYJ | **Completed — online-exhausted unresolved** | Historical wife Sarah is plausible; maiden surname Jones is weak; exact parentage unresolved. Preferred representation: **Sarah, surname unknown; traditionally reported as Sarah Jones.** |
| 2 | Anna Snow / Anna Mahurin | LH62-G2T | **Completed — identity corrected; parentage unresolved** | The wife of David Mahurin was Anna [maiden surname unknown]. “Anna Snow” is probably a later contamination from David’s second wife Lucy/Lucia Snow. Online case closed without parents. |
| 3 | John Morehouse | LH3N-NZT | **Work complete — awaiting Chat peer review** | Strong indication that current FS father John Morehouse PZYK-MFG is actually the **grandfather** (1760 Southampton testator). An intervening predeceased John appears to be the true father. Target’s mother remains unknown. |
| 4 | Debby / Deborah Phillips | KCWY-YPL; later merged into KZRG-R84 | **Completed — online-exhausted unresolved parentage** | Deborah is securely the wife of the elder Henry Trask and mother of the 1777 Henry Trask. Her own parents remain unresolved. |
| 5 | Elizabeth Woodward | K8H6-SKZ | **Queued** | Original assertions: born 1730 New Hampshire; died 1805 Cornish, New Hampshire. Parents unresolved. |
| 6 | Maria Elizabeth Loux | KNV1-BCH | **Queued** | Original assertion: born 1741 Stone Arabia, New York. Palatine/immigrant context likely. Parents unresolved. |
| 7 | Phebe, surname unknown | 9VWG-63Y | **Queued** | Original assertions: born 1734 New London, Connecticut; died 1786. Natal identity unresolved. |
| 8 | Nathaniel Peck | M4DP-DRQ | **NEXT WORK CASE** | Original assertions: about 1720–1759. Highest-priority unresolved male after John Morehouse. |
| 9 | Abigail Kiles | LCQS-31L | **Queued — partial-parent break** | Father partly represented; mother unresolved; review flag. Original assertions: 1728–1813. |
| 10 | Elizabeth Harris | L2F1-G68 | **Queued — chronology conflict** | Original assertions: 1750–1771 Connecticut, with a child reportedly born 1772. Identity/chronology requires stabilization before parentage. |

## Newly exposed branches

### Unknown wife of the predeceased John Morehouse — mother of LH3N-NZT

**Status:** New direct-line research target; place in queue immediately after Nathaniel Peck, subject to John Morehouse peer review.

Current reconstruction from the John Morehouse Work report:

1. John Morehouse, Southampton immigrant, died 1701.
2. John Morehouse, wife Zerviah, Southampton will dated 4 January 1760 — appears to be PZYK-MFG.
3. A predeceased son **John Morehouse**, wife **unknown** — apparent true father of LH3N-NZT.
4. John Morehouse LH3N-NZT, born about 1740, husband of Sarah Pierson.

The 1760 will explicitly identifies a younger John as a grandson and names the sibling cluster John, Nathan, Isaac, and Phebe; Howell’s reconstruction supplies the missing generation. The **wife of the predeceased father is not identified** and is therefore a genuine new broken branch if the peer review confirms the reconstruction.

Highest-value future records suggested by Work: Southampton deeds and dower releases; town/church records; guardianships; full 1760 probate packet; land divisions and earmarks.

### Upstream Morehouse watchlist — not yet promoted to a Work case

The 1760 testator is provisionally reconstructed as a son of the earlier Southampton immigrant John Morehouse, but the testator’s mother was not established in the John investigation. The immigrant John’s own parentage may also become a break. **Do not add these to the active queue until the John case is peer-reviewed and the upstream relationships are audited.**

## Collateral investigations that changed the branch map

### Henry Trask MPLT-4VC

**Completed — identity/parentage strongly supported.**

The inherited 1771 Plymouth profile initially appeared incompatible with Deborah Phillips’s family because the Danvers family register recorded her son Henry in 1777. Follow-up research showed that the Quincy stonecutter MPLT-4VC was in fact strongly supported as that 1777 Danvers son of Henry Trask K22T-QG6 and Deborah/Debby Phillips KZRG-R84. The erroneous elements were the reported age/birth year and Plymouth geography, not the parents. This repaired the temporary break below Deborah and confirmed Deborah as a direct-line ancestor.

### Deming Agree / Egree LRZF-NTM

Previously researched separately and excluded from the active broken-branch queue.

## Current planned order after John peer review

1. **Nathaniel Peck M4DP-DRQ** — complete the two-male experiment begun with John Morehouse.
2. **Unknown wife of the predeceased John Morehouse** — newly exposed mother of LH3N-NZT.
3. **Elizabeth Woodward K8H6-SKZ**.
4. **Maria Elizabeth Loux KNV1-BCH**.
5. **Phebe 9VWG-63Y**.
6. **Abigail Kiles LCQS-31L**.
7. **Elizabeth Harris L2F1-G68**.

Queue order is provisional and may be changed if an investigation exposes a higher-value direct-line break or if peer review changes the underlying pedigree.

## Update protocol

After each ancestor investigation:

1. Ordinary Chat peer-reviews the Work report before tree editing.
2. Update the ancestor’s status here: **Established / strongly supported / working hypothesis / identity corrected / online-exhausted unresolved / queued** as appropriate.
3. Add any newly exposed direct-line broken branches.
4. Remove or demote apparent breaks that were resolved as identity or generation errors.
5. Update the planned Work order.
6. Mirror this file identically to `DBDANNER/genealogy-agent` for redundancy.
7. Keep detailed case reports in their normal case/report locations; this ledger remains compact enough to reconstruct the project state quickly in a new Chat.

## Work-prompt infrastructure rule

For GitHub telemetry and repository access, **use the native GitHub connector directly**. Do not use Chrome/browser authentication or the GitHub CLI unless the native connector is genuinely unavailable. The John Morehouse session failed to update telemetry because it selected the wrong GitHub access path even though the native connector was available.
