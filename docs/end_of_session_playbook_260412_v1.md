# End-of-Session Playbook — 260412 v1

## Purpose
This playbook records the standard end-of-session routine for the Ancestry Project.

It is meant to reduce drift, preserve durable knowledge, and ensure that important work does not remain trapped in a single chat session.

This playbook should be used near the end of an evening work session when the user is preparing to stop.

## File dating, versioning, and precedence rule
This file belongs to the `end_of_session_playbook_YYMMDD_vN.md` family.

Within that family, precedence is determined first by date suffix in `YYMMDD` format, then by version suffix `vN` within the same date. The governing file is the most recent date and, within that date, the highest version number.

## Core principle
Every session should end with a short deliberate check of what needs to be preserved.

That does **not** mean every session must update constitutional files.
It does mean every session should ask whether tonight produced durable knowledge that belongs in the memory layer.

## Standard end-of-session sequence

### 1. Check for durable knowledge
At the end of each session, ask whether tonight produced any durable knowledge that should be banked outside the continuity file.

Examples of durable knowledge:
- a validated command contract
- a known-good Shuttle message
- a working recovery procedure
- a recurring workflow that no longer needs source-code archaeology
- a new operating rule for constitutional files
- a new known-working script or artifact reference

If the answer is yes, update the relevant constitutional/manual/playbook file family.
If the answer is no, proceed without forcing an update.

### 2. Generate or update the continuity file
Create the continuity file for the current session when appropriate.

The continuity file should preserve:
- what was accomplished
- what was validated
- what remains unresolved
- what the likely next step is

The continuity file is tactical.
It should not be overloaded with stable operational grammar that properly belongs in the constitutional layer.

### 3. Update constitutional files if needed
If Step 1 identified durable knowledge, update the relevant file family in `genealogy-agent`.

Common targets:
- startup file family
- file index family
- Shuttle manual family
- Navigator manual family
- slotmap/treebuilder manual family
- playbooks
- known-working artifact references

When updating constitutional files, prefer creating a new governing file in the same family using the filename rule:
`YYMMDD_vN`

### 4. Mirror the laptop repo to GitHub
After the continuity file and any local repo changes are in place, mirror the laptop repo to GitHub.

Preferred path:
use the known-good Shuttle GitHub mirror command.

Known-good Shuttle contract:
```json
_SHUTTLE_MESSAGE_00002_
{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}
```

Expected success outcomes include:
- `mirror_succeeded`
- `already_up_to_date`

### 5. Note weekly backup status
As a standing end-of-session awareness item, remember that constitutional files should also receive a weekly backup outside GitHub.

Current preferred backup model:
- live constitutional layer: `genealogy-agent`
- operational mirror: `ancestry_repo`
- weekly backup shelf: manual backup outside GitHub

Current practical conclusion:
Google Drive write capability is too limited for the desired automated backup role, so weekly backup is currently a manual task.

This does **not** require action every night.
It does mean the end-of-session routine should remain aware of whether the weekly backup is due.

## Preferred path vs fallback path

### Preferred path
The preferred end-of-session path is:
1. continuity file prepared
2. constitutional files updated if needed
3. Shuttle mirror used to push the laptop repo to GitHub

### Fallback path
If Shuttle is unavailable, uncertain, or malfunctioning, do **not** stall the session-ending routine.

Fallback behavior:
- use the known working manual CMD/code-block approach
- preserve the continuity file and constitutional changes anyway
- note the Shuttle failure or uncertainty so it can be repaired later

Important principle:
The failure of Shuttle should not prevent preservation of the session’s work.

## Decision rule for constitutional updates
A quick practical test:

Ask:
Did tonight produce something that a future chat would otherwise have to rediscover from source scripts, old chat archaeology, or user memory?

If yes, strongly consider updating the constitutional layer.
If no, the continuity file alone may be sufficient.

## Typical examples

### Example A — no constitutional update needed
A session performs ordinary harvesting with no new contract, no new script version, and no newly validated workflow.

End-of-session behavior:
- continuity file only
- GitHub mirror
- no constitutional edit required

### Example B — constitutional update needed
A session validates a new Shuttle message, a new Navigator control procedure, or a new builder workflow.

End-of-session behavior:
- continuity file
- update the relevant manual/playbook/index file family
- GitHub mirror
- weekly backup awareness noted

## Related files
- Startup file family: `00_start_here_YYMMDD_vN.md`
- File index family: `file_index_YYMMDD_vN.md`
- Shuttle manual family: `shuttle_messages_YYMMDD_vN.md`
- Navigator manual family: `navigator_manual_YYMMDD_vN.md`
- Slotmap/treebuilder manual family: `slotmap_treebuilder_manual_YYMMDD_vN.md`

## Summary
The standard end-of-session rule is:
- check every night whether new durable knowledge should be banked
- create the continuity file as the tactical handoff
- update constitutional files when durable knowledge was gained
- mirror the laptop repo to GitHub
- keep weekly manual backup in mind as a standing item
- if Shuttle fails, use the fallback path rather than losing the session’s work

That is the current preferred closing routine for the Ancestry Project.
