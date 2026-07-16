---
description: Plan and commit pending changes in logical groups
agent: build
---

Review `git status` and file diffs to identify changed and untracked files. Group related changes into logical commits and present a commit plan (message + files per commit) to the user for review. Wait for approval, then execute each commit sequentially: `git add` the files for that group, then `git commit` with the proposed message. Do not push.
