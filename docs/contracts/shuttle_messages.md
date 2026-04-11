# Shuttle Message Manual — Core Contract and GitHub Mirror Example

## Purpose
This manual records the command-contract patterns for the Shuttle Message system so that new chats do not need to rediscover them from continuity files or source-code archaeology.

This first version is intentionally narrow. It focuses on:
- the basic Shuttle message idea
- numbering and formatting
- the GitHub mirror workflow for `ancestry_repo`
- known-good example messages
- fallback behavior when Shuttle understanding is uncertain

This file should be extended over time as additional stable Shuttle contracts are identified.

## Concept
A Shuttle message is a structured, numbered message emitted by ChatGPT and consumed by the local Shuttle extension/server system.

The user does **not** need to paste a curl command into CMD for ordinary Shuttle operations.
Instead:
1. ChatGPT emits a numbered Shuttle message.
2. The user sends it through the local Shuttle mechanism.
3. The Shuttle server executes the allowed action.
4. The result is returned to the clipboard or file.
5. The user pastes the result back into chat.

This is much faster and less error-prone than the older manual code-block/CMD/screenshot loop.

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
- if the browser crashes or the message counter is reset, the sequence may restart
- if the user explicitly asks for the next message with a specific number, use that number

The wrapper line is part of the contract and should be included exactly.

## Targets and actions
Shuttle uses a `target` and `action` model.

Important caution:
Do not guess target/action pairings from memory when the action matters and uncertainty exists.
If unsure, consult:
1. this manual
2. the relevant constitutional contract file
3. the current Shuttle server code via the file index

A key lesson from April 2026:
the GitHub mirror action is **not** a `repo` action.
It is a `cmd` action called `github_mirror`.

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

This was validated in April 2026 and succeeded.

### Meaning of fields
- `target:"cmd"`  
  The action belongs to the command target family.
- `action:"github_mirror"`  
  Invokes the Shuttle server’s GitHub mirror flow.
- `return_mode:"clipboard"`  
  Returns the structured result to the clipboard.
- `clipboard_format:"json_pretty"`  
  Requests a pretty-printed JSON result.

## Expected outcomes
A successful mirror response may include:
- `outcome: "mirror_succeeded"`
- `outcome: "already_up_to_date"`

A failure response may include errors such as:
- unsupported action
- authentication required
- timeout
- non-zero Git failure

The user should paste the Shuttle result back into chat for interpretation and logging.

## Important historical pitfall
A failed attempt in April 2026 used the wrong contract:
- `target:"repo"`
- `action:"mirror_to_github"`

That failed with an error stating that the current repo actions were only:
- `list_files`
- `read_file`
- `read_bundle`

This failure was useful because it confirmed that GitHub mirroring is handled under the `cmd` target, not the `repo` target.

## Known-good April 2026 validation
The following message succeeded:

```json
_SHUTTLE_MESSAGE_00002_
{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}
```

The pasted result reported:
- `status: "ok"`
- `target: "cmd"`
- `action: "github_mirror"`
- `outcome: "mirror_succeeded"`
- `exit_code: 0`

It also showed that the push completed successfully from one Git commit on `main` to the next.

## How a new chat should use this manual
If the user asks to mirror the laptop repo to GitHub, the new chat should:

1. Consult this manual.
2. Emit the known-good Shuttle message using the next requested/appropriate counter value.
3. Have the user run it.
4. Read the pasted Shuttle result.
5. Confirm whether the mirror succeeded, was already up to date, or failed.

The new chat should **not** guess a new mirror contract unless this manual or the current Shuttle server code indicates that the contract has changed.

## Fallback if Shuttle understanding is uncertain
If there is uncertainty about Shuttle behavior:
1. check the Shuttle manual
2. check the file index for the current Shuttle server script
3. inspect the current server code
4. then emit the message

If Shuttle itself is malfunctioning or unavailable, fall back to the user’s manual Git mirror workflow or a direct code-block command, depending on the situation.

## What should be added to this manual later
This first draft only covers GitHub mirroring.
Over time, this manual should grow to include:
- other stable Shuttle commands
- target/action families
- safe examples
- numbering conventions in more detail
- known pitfalls
- any classic/known-working script references relevant to Shuttle behavior

## Canonical-file note
Only one canonical Shuttle manual should eventually live in the constitutional repo.

If duplicate copies appear during transfer or chat handoff, treat them as duplication noise rather than parallel authorities, and keep a single canonical copy at the fixed contract path.

## Summary
For GitHub mirroring of `ancestry_repo`, the currently known working Shuttle contract is:

```json
_SHUTTLE_MESSAGE_00002_
{"target":"cmd","action":"github_mirror","return_mode":"clipboard","clipboard_format":"json_pretty"}
```

If a future chat forgets this, it should consult this manual before guessing.
