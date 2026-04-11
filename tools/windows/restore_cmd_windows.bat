@echo off
REM Restore four CMD windows after a crash

start "Navfix Server" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python server\navfix_v0_1_4.py"
start "Shuttle Server" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo && python shuttle_server_v24_github_mirror_poc_fix1.py"
start "Codex" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo"
start "Curls" cmd /k "cd /d C:\Users\david\OneDrive\Documents\ancestry_repo"
