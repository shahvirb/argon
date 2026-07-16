---
description: Stage and commit pending files
agent: build
---

Read the files in the current folder recursively, compare them against `git status`, and identify the relevant changed or untracked files. Stage those files with `git add` (DO NOT commit). Show the staged files to the user for review. You may split up commits where logical.
