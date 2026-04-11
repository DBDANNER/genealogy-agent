# Crash Recovery Manual — Windows CMD Workspace

## Purpose
This file is a starter playbook for recovering the standard Ancestry Project Windows CMD workspace after a laptop crash, reboot, or accidental closure of the working command windows.

It is meant to reduce friction and prevent memory loss around a simple but important operational fact:
our usual working state depends on a small set of CMD windows being restored correctly.

This file should grow over time as additional recovery steps, utilities, or startup helpers are created.

## Why this matters
A crash does not only interrupt the current task. It can also erase the working shell environment that supports the task.

In ordinary operation, the user often wants fast recovery of four CMD windows:
1. Navfix server window
2. Shuttle server window
3. Codex repo-root window
4. Curl/debug repo-root window

The friction is not conceptual. It is mostly mechanical:
- re-opening four windows
- retyping the long repo path four times
- remembering the correct active server filenames
- restoring the same working state without introducing typos

A small local utility can remove most of that pain.

## Core recovery utility
Current known recovery utility:

`tools/windows/restore_cmd_windows.bat`

Purpose:
Open four CMD windows and restore the standard working layout with fixed paths and the currently known server filenames.

## Current batch file contents
```bat
@echo off
REM Restore four CMD windows after a crash

start "Navfix Server" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python server\navfix_v0_1_4.py"
start "Shuttle Server" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python shuttle_server_v24_github_mirror_poc_fix1.py"
start "Codex" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo"
start "Curls" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo"
```

## What this restores
### 1. Navfix server window
Launches:
`python server\navfix_v0_1_4.py`

Working directory:
`C:\Users\david\OneDrive\Documents\ancestry_repo`

### 2. Shuttle server window
Launches:
`python shuttle_server_v24_github_mirror_poc_fix1.py`

Working directory:
`C:\Users\david\OneDrive\Documents\ancestry_repo`

### 3. Codex window
Launches a CMD window at repo root for Codex-related commands.

### 4. Curl/debug window
Launches a CMD window at repo root for curl tests and debugging commands.

## Why the batch file is important beyond convenience
This utility is not merely a shortcut.
It is also a compact operational summary of the standard active workspace.

That makes it useful as a kind of continuity artifact because it records:
- which windows matter in ordinary operation
- which repo path is the working root
- which server scripts are treated as current
- what “normal working state” looks like after restoration

In other words, it is both:
- a recovery tool
- a snapshot of the current operational shell environment

## Relationship to Shuttle
In principle, Shuttle may be able to launch local commands or even call a batch file if the Shuttle server exposes a sufficiently general `cmd` execution action.

However, this crash-recovery batch file should remain the preferred backbone for recovery.

Reason:
- it works before Shuttle is up
- it does not depend on the browser or extension loop
- it reduces dependency on higher layers during recovery
- it is a one-click local utility for restoring the exact shell environment that may be needed to support Shuttle itself

Important practical point:
Shuttle should not be treated as the primary recovery path for the very CMD windows that help support Shuttle operation.

## Suggested recovery sequence
When the laptop crashes or the CMD workspace is lost:

1. Run `restore_cmd_windows.bat`
2. Confirm the Navfix server window opens correctly
3. Confirm the Shuttle server window opens correctly
4. Use the Codex and Curl windows as needed
5. Resume normal project work

## Maintenance rule
If any of the following change, this playbook and the batch file should be updated together:
- repo root path
- Navfix server filename
- Shuttle server filename
- number or role of the standard CMD windows

## Possible future additions
Later versions of this playbook may add:
- a post-crash verification checklist
- port checks
- a one-line process kill / cleanup command before restart
- guidance on restoring browser tabs or pinned pages
- guidance on verifying Shuttle/Harvester health after recovery
- a launcher for additional windows if the standard workspace expands

## Bottom line
The batch file is now part of the project’s memory layer because it captures a concrete and recurring operational reality:
a normal working session depends on restoring a small, predictable Windows CMD workspace quickly and accurately.
