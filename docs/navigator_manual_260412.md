# Harvester / Navigator Manual — 260412

## Purpose
This manual records the current working operational contract for common Harvester / Navigator control tasks.

It is meant to let a new chat quickly recover how to manage Navigator state without re-deriving the contract from source code.

This first version focuses on one validated recurring task:
- clearing the queue and reseeding it with a designated starting PID

## File dating and precedence rule
This file belongs to the `navigator_manual_YYMMDD.md` family.

Within that family, the most recent date suffix is the governing version unless a file explicitly states otherwise.

## When to use this manual
Use this manual when the user wants to:
- reset the Navigator to a fresh starting point
- discard the current queue and start from a specific PID
- re-anchor the harvest to a new ancestor
- confirm the queue head before beginning a new harvesting run

## System context
The current Navigator control surface is the Navfix server.

Current known-working server file:
`C:\Users\david\OneDrive\Documents\ancestry_repo\server\navfix_v0_1_4.py`

The Navfix server exposes a `/nav_control` endpoint that accepts control actions such as:
- `status`
- `reset_to_pid`
- `append_pid`
- `drop_head`
- `get_mode`
- `set_mode`
- `resume_after_review`

In practice, ChatGPT currently reaches this endpoint through Shuttle using an HTTP relay pattern.

## Common task: clear and reseed the queue with a designated PID

### Purpose
Replace the existing frontier queue with a single desired starting PID.

This is the standard “start fresh from here” operation.

### Inputs needed
- one valid FamilySearch PID

Example:
- `K1W8-HXS`

### Operational logic
This task should:
1. clear the current queue
2. replace it with the supplied PID
3. update the persisted next-target snapshot to the same PID
4. leave the navigation mode unchanged

### Current validated method
Use Shuttle to send an HTTP POST request to the Navfix server’s `/nav_control` endpoint with:
- `action: "reset_to_pid"`
- `pid: "<PID>"`

### Known-good Shuttle message
```json
_SHUTTLE_MESSAGE_00003_
{"target":"cmd","action":"http_test","request":{"host":"127.0.0.1","port":5000,"method":"POST","path":"/nav_control","json_body":{"action":"reset_to_pid","pid":"K1W8-HXS"}},"return_mode":"clipboard","clipboard_format":"json_pretty"}
```

### General reusable pattern
```json
_SHUTTLE_MESSAGE_<NNNNN>_
{"target":"cmd","action":"http_test","request":{"host":"127.0.0.1","port":5000,"method":"POST","path":"/nav_control","json_body":{"action":"reset_to_pid","pid":"<PID>"}},"return_mode":"clipboard","clipboard_format":"json_pretty"}
```

## What success looks like
A successful response should typically include:
- `status_code: 200`
- `ok: true`
- `action: "reset_to_pid"`
- `queue: ["<PID>"]`
- `queue_head_pid: "<PID>"`
- `queue_head_url` matching that PID
- `persisted_next_target_snapshot.next_pid: "<PID>"`

### Validated live example
For PID `K1W8-HXS`, the response confirmed:
- queue length became `1`
- queue head became `K1W8-HXS`
- persisted next target became `K1W8-HXS`
- `navigation_mode` remained `auto`

## Common pitfalls
- Do not guess that Navigator has a direct Shuttle action family; the current path is indirect through `http_test`.
- Do not use a malformed PID.
- Do not assume that a successful HTTP relay is enough; verify that the returned queue state actually contains the requested PID.
- Do not treat builder scripts or other local scripts as part of this contract; this manual is only about Navigator state control.

## Related files
- Startup file family: `00_start_here_YYMMDD.md`
- File index family: `file_index_YYMMDD.md`
- Shuttle manual family: `shuttle_messages_YYMMDD.md`
- Current Navfix server reference in the file index: `server/navfix_v0_1_4.py`

## Scope note
This first Navigator manual is intentionally narrow.
It does **not** yet attempt to document:
- queue append operations
- dropping queue head
- mode switching
- paused review recovery
- harvesting workflow after reseed

Those can be added later once validated in live use.

## Summary
The current common contract for “clear and reseed Navigator to a PID” is:
- send a Shuttle `http_test` POST to `http://127.0.0.1:5000/nav_control`
- use `{"action":"reset_to_pid","pid":"<PID>"}` as the JSON body
- verify that the returned queue and next-target snapshot match the requested PID

That is now a live validated operational procedure.
