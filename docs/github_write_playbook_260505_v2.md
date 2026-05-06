# GitHub Write Playbook — 260505 v2

## Purpose
This playbook records the currently preferred way to write generated governing/reference files into GitHub for the Ancestry Project.

The key lesson from 260505 is that ChatGPT can usually read GitHub through the connector quickly and reliably, but direct connector writes may be slow, permission-box-dependent, or fail after long waits. For governing-file updates, the preferred workflow is therefore:

Assistant prepares downloadable files -> user downloads them -> local CMD/Git writes them -> assistant verifies by reading GitHub.

## Governing update from v2
Version 2 records a practical CMD lesson learned during the first sidecar-pivot governing-file push.

Do not put the full copy/commit/push workflow behind a conditional clone command such as:

```cmd
cd /d "%USERPROFILE%\Downloads" & if not exist genealogy-agent-upload-test git clone https://github.com/DBDANNER/genealogy-agent.git genealogy-agent-upload-test & cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && ...
```

In this project's observed Windows CMD behavior, when the `genealogy-agent-upload-test` folder already existed, the conditional setup line could return to `Downloads` with little or no output and the useful copy/commit/push sequence did not run.

Use a two-shape workflow instead:
1. one-time setup / clone command;
2. normal push command that assumes the local clone already exists.

This is clearer, safer, and produces useful output.

## When to use this playbook
Use this playbook when:
- adding or updating files in `DBDANNER/genealogy-agent`;
- banking generated governing files, manuals, playbooks, or file indexes;
- connector write attempts are slow, flaky, or permission-box dependent;
- the user already has local Git credentials working on the laptop.

## Default workflow
1. Assistant generates the file(s) and provides downloads.
2. User downloads the file(s), usually to `%USERPROFILE%\Downloads`.
3. User uses local Git/CMD to clone or reuse `genealogy-agent-upload-test`.
4. User copies the downloaded file(s) into the local clone.
5. User commits and pushes with Git.
6. Assistant verifies the result by reading GitHub through the connector.

## Credential test
If local Git write access is uncertain, test with the one-time clone command:

```cmd
cd /d "%USERPROFILE%\Downloads" && git clone https://github.com/DBDANNER/genealogy-agent.git genealogy-agent-upload-test
```

Then:

```cmd
cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git push --dry-run origin HEAD:main
```

A result like `Everything up-to-date` means push credentials are working.

If `genealogy-agent-upload-test` already exists, skip the clone and run only the dry-run command.

## Recommended two-shape CMD pattern

### Shape A: one-time setup / clone
Use this only when the local clone folder does not already exist.

```cmd
cd /d "%USERPROFILE%\Downloads" && git clone https://github.com/DBDANNER/genealogy-agent.git genealogy-agent-upload-test
```

### Shape B: normal governing-file push
Use this for normal updates once the local clone exists.

```cmd
cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\<LOCAL_FILE_NAME>" "<REPO_RELATIVE_PATH_WINDOWS>" && git add "<REPO_RELATIVE_PATH_UNIX>" && git commit -m "<COMMIT_MESSAGE>" && git push origin HEAD:main
```

This is the preferred default template for future assistant-generated governing-file update commands.

## Normal single-file push template
Use this when adding one downloaded file to `genealogy-agent` and the local clone already exists:

```cmd
cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\<LOCAL_FILE_NAME>" "<REPO_RELATIVE_PATH_WINDOWS>" && git add "<REPO_RELATIVE_PATH_UNIX>" && git commit -m "<COMMIT_MESSAGE>" && git push origin HEAD:main
```

Concrete example:

```cmd
cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\place_authority_plan_260505_v1.md" "docs\place_authority_plan_260505_v1.md" && git add "docs/place_authority_plan_260505_v1.md" && git commit -m "Add place authority plan" && git push origin HEAD:main
```

## Normal multi-file push template
Use this when adding multiple downloaded files and the local clone already exists:

```cmd
cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\<FILE1>" "docs\<FILE1>" && copy /Y "%USERPROFILE%\Downloads\<FILE2>" "docs\<FILE2>" && git add "docs/<FILE1>" "docs/<FILE2>" && git commit -m "<COMMIT_MESSAGE>" && git push origin HEAD:main
```

Concrete example:

```cmd
cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\00_start_here_260505_v2.md" "docs\00_start_here_260505_v2.md" && copy /Y "%USERPROFILE%\Downloads\file_index_260505_v3.md" "docs\file_index_260505_v3.md" && git add "docs/00_start_here_260505_v2.md" "docs/file_index_260505_v3.md" && git commit -m "Update governing startup and file index" && git push origin HEAD:main
```

## CMD syntax rules
In Windows CMD:
- use a separate setup command for clone;
- use the existing-folder push command for normal updates;
- avoid placing the full workflow after `if not exist ... git clone ...`;
- use `&&` for the must-succeed sequence inside the normal push;
- keep commands as one-line CMD blocks for small-screen copy/paste;
- if the command prints almost nothing and returns to a prompt, assume the important sequence may not have run.

## Expected successful output
A successful normal push should show visible output such as:
- `Already up to date.` or a successful pull result;
- `1 file(s) copied.` for each copied file;
- a commit summary such as `[main abc1234] ...`;
- object writing / resolving output if needed;
- a final push line such as `main -> main`.

If there is no copy output, no commit output, and no push output, do not assume success.

## Verification
After the user says the push is done, the assistant should verify by reading the target file(s) from GitHub.

For a single file, verify the exact path on `main`.

For a batch, verify at least:
- the new/updated file index;
- one new playbook or policy file;
- any data file that is easy to misplace.

If verification fails:
1. fetch the expected file path directly;
2. search the repo for a distinctive phrase from the new file;
3. search commits by the expected commit message if needed;
4. ask the user for CMD output only after those checks are insufficient.

## Connector role
Use the GitHub connector primarily for reads and verification. Do not rely on connector writes as the default for governing files unless the user explicitly wants to try that path.
