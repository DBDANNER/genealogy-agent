# GitHub Write Playbook — 260505 v1

## Purpose
This playbook records the currently preferred way to write generated governing/reference files into GitHub for the Ancestry Project.

The key lesson from 260505 is that ChatGPT can usually read GitHub through the connector quickly and reliably, but direct connector writes may be slow, permission-box-dependent, or fail after long waits. For governing-file updates, the preferred workflow is therefore:

Assistant prepares downloadable files -> user downloads them -> local CMD/Git writes them -> assistant verifies by reading GitHub.

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
If local Git write access is uncertain, test with:

```cmd
cd /d "%USERPROFILE%\Downloads" && git clone https://github.com/DBDANNER/genealogy-agent.git genealogy-agent-upload-test
```

Then:

```cmd
cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git push --dry-run origin HEAD:main
```

A result like `Everything up-to-date` means push credentials are working.

## CMD syntax trick
In Windows CMD, avoid putting a long `&&` chain directly after an `if exist ...` setup step. If the condition is false, the rest of the line may not run as intended.

Safer pattern:
- use `&` for optional setup steps;
- use `&&` for the must-succeed sequence.

## Classic single-file working block
Use this template when adding one downloaded file to `genealogy-agent`:

```cmd
cd /d "%USERPROFILE%\Downloads" & if not exist genealogy-agent-upload-test git clone https://github.com/DBDANNER/genealogy-agent.git genealogy-agent-upload-test & cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\<LOCAL_FILE_NAME>" "<REPO_RELATIVE_PATH_WINDOWS>" && git add "<REPO_RELATIVE_PATH_UNIX>" && git commit -m "<COMMIT_MESSAGE>" && git push origin HEAD:main
```

Concrete example:

```cmd
cd /d "%USERPROFILE%\Downloads" & if not exist genealogy-agent-upload-test git clone https://github.com/DBDANNER/genealogy-agent.git genealogy-agent-upload-test & cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\place_authority_plan_260505_v1.md" "docs\place_authority_plan_260505_v1.md" && git add "docs/place_authority_plan_260505_v1.md" && git commit -m "Add place authority plan" && git push origin HEAD:main
```

## Classic multi-file working block
Use this once the local clone and credentials are proven:

```cmd
cd /d "%USERPROFILE%\Downloads" & if not exist genealogy-agent-upload-test git clone https://github.com/DBDANNER/genealogy-agent.git genealogy-agent-upload-test & cd /d "%USERPROFILE%\Downloads\genealogy-agent-upload-test" && git pull --ff-only origin main && copy /Y "%USERPROFILE%\Downloads\<FILE1>" "docs\<FILE1>" && copy /Y "%USERPROFILE%\Downloads\<FILE2>" "docs\<FILE2>" && git add "docs/<FILE1>" "docs/<FILE2>" && git commit -m "<COMMIT_MESSAGE>" && git push origin HEAD:main
```

## Verification
After the user says the push is done, the assistant should verify by reading the target file(s) from GitHub.

For a single file, verify the exact path on `main`.

For a batch, verify at least:
- the new/updated file index;
- one new playbook or policy file;
- any data file that is easy to misplace.

## Connector role
Use the GitHub connector primarily for reads and verification. Do not rely on connector writes as the default for governing files unless the user explicitly wants to try that path.
