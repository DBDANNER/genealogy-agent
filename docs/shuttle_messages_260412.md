# Shuttle Message Manual — 260412

## Purpose
This manual records the currently known working Shuttle message patterns for common recurring tasks in the Ancestry Project.

It is meant to prevent a new chat from having to rediscover Shuttle contracts from continuity files or source-code archaeology.

This version focuses on:
- the basic Shuttle message structure
- numbering and formatting
- GitHub mirror via Shuttle
- Navigator control via Shuttle using HTTP relay to the Navfix server
- known-good examples
- fallback behavior when the contract is uncertain

## File dating and precedence rule
This file belongs to the `shuttle_messages_YYMMDD.md` family.

Within that family, the most recent date suffix is the governing version unless a file explicitly states otherwise.

## Concept
A Shuttle message is a structured, numbered message emitted by ChatGPT and consumed by the local Shuttle extension/server system.

Typical flow:
1. ChatGPT emits a numbered Shuttle message.
2. The user sends it through the local Shuttle mechanism.
3. The Shuttle server executes the allowed action.
4. The result is returned to the clipboard or file.
5. The user pastes the result back into chat.

## Basic form
A typical Shuttle message looks like this:

```json
_SHUTTLE_MESSAGE_00001_
{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}
```

Important elements:
- a numbered wrapper line like `_SHUTTLE_MESSAGE_00001_`
- a JSON object underneath
- the JSON specifies target, action, and any needed arguments

## Numbering convention
Shuttle messages are numbered.

Example:
- `_SHUTTLE_MESSAGE_00001_`
- `_SHUTTLE_MESSAGE_00002_`
- `_SHUTTLE_MESSAGE_00003_`

Practical rule:
- continue the numbering sequence during a session
- if the browser crashes or the counter resets, restart with the next practical number requested by the user
- if the user explicitly asks for a specific number, use that number

The wrapper line is part of the contract and should be included exactly.

## Transport families currently known to matter
The current Shuttle server supports these target families:
- `repo`
- `cmd`
- `builder`
- `server`

For the recurring tasks validated so far, the important target family is `cmd`.

## GitHub mirror contract for `ancestry_repo`

### Purpose
Mirror the current laptop repo state to the GitHub repo `DBDANNER/ancestry_repo`.

### Correct target/action
- `target`: `cmd`
- `action`: `github_mirror`

### Known-good message
```json
_SHUTTLE_MESSAGE_00002_
{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}
```

### Success signal
Typical success payload includes:
- `status: "ok"`
- `action: "github_mirror"`
- `outcome: "mirror_succeeded"` or `"already_up_to_date"`

### Important pitfall
GitHub mirror is **not** a `repo` action.
It is a `cmd` action.

## Navigator control via Shuttle

### Purpose
Use Shuttle to control the Navigator indirectly by relaying an HTTP request to the Navfix server on localhost port 5000.

This is the current validated route for common Navigator control tasks.

### Key idea
Shuttle does **not** currently expose a dedicated Navigator action family.
Instead, it reaches the Navfix server through:
- `target: "cmd"`
- `action: "http_test"`
- a POST request to the Navfix server’s `/nav_control` endpoint

### Validated common task: clear and reseed queue to a designated PID
This task clears the queue and reseeds it so the queue contains exactly one PID.

### Known-good message
```json
_SHUTTLE_MESSAGE_00003_
{"target":"cmd","action":"http_test","request":{"host":"127.0.0.1","port":5000,"method":"POST","path":"/nav_control","json_body":{"action":"reset_to_pid","pid":"K1W8-HXS"}},"return_mode":"clipboard","clipboard_format":"json_pretty"}
```

### General reusable pattern
```json
_SHUTTLE_MESSAGE_<NNNNN>_
{"target":"cmd","action":"http_test","request":{"host":"127.0.0.1","port":5000,"method":"POST","path":"/nav_control","json_body":{"action":"reset_to_pid","pid":"<PID>"}},"return_mode":"clipboard","clipboard_format":"json_pretty"}
```

### Success signal
A successful response should typically include:
- `status_code: 200`
- `ok: true`
- `action: "reset_to_pid"`
- `queue: ["<PID>"]`
- `queue_head_pid: "<PID>"`
- `persisted_next_target_snapshot.next_pid: "<PID>"`

### Notes
- This method leaves `navigation_mode` unchanged.
- In the validated case, `navigation_mode` remained `auto`.
- This is a real operational task, not just a diagnostic HTTP test.

## What to do when the contract is uncertain
If the current chat is unsure how to express a Shuttle task:
1. read the most recent Shuttle manual in this file family
2. read the most recent file index
3. inspect the current Shuttle server script if needed
4. inspect the task-specific server script if the Shuttle server is only acting as a transport layer

## Relationship to other manuals
This manual stores the **transport contract**.
Task-specific operational logic should live in the relevant subsystem manual.

For example:
- Shuttle manual = how to send the Navigator command
- Navigator manual = when and why to use queue reset/reseed, what success means operationally

## Known limitations as of 260412
- Shuttle control of Navigator is currently indirect, through `http_test` to the Navfix server.
- Builder support may require additional reconciliation, because the Shuttle server’s allowlisted builder scripts may not exactly match the current builder scripts named in the file index.
- Therefore, the builder portion of the Shuttle manual should be updated only after a fresh live validation.

## Summary
Two common Shuttle contracts are now validated:

### GitHub mirror
```json
_SHUTTLE_MESSAGE_00002_
{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}
```

### Navigator queue reset/reseed
```json
_SHUTTLE_MESSAGE_00003_
{"target":"cmd","action":"http_test","request":{"host":"127.0.0.1","port":5000,"method":"POST","path":"/nav_control","json_body":{"action":"reset_to_pid","pid":"K1W8-HXS"}},"return_mode":"clipboard","clipboard_format":"json_pretty"}
```

If a future chat forgets these, it should consult this manual before guessing.
