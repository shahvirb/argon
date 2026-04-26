---
description: Stage pending files as a series of atomic commit batches
agent: build
---

Review all pending work in the current repository and guide the user through staging it as a sequence of small, logical commit batches. DO NOT create any commits.

Workflow:

1. Check `git status --short` for the full set of changed and untracked files.
2. If any files are already staged, warn the user and stop. This workflow requires a clean index before it begins.
3. Inspect every changed or untracked file to understand the logical change boundaries.
4. Also inspect related context files that help explain the changes, including:
   - the repo root `.gitignore`
   - other relevant top-level files in the repository root
   - nearby local context such as `README.md`, `.gitignore`, `docker-compose*`, `*.tpl`, and similar files near changed paths
5. Use that context to infer semantic groupings across all files in `git status`.
6. Treat risky files conservatively. By default, do not stage secrets, generated artifacts, lockfiles, ignored secret-bearing files, or unrelated noisy churn unless the user explicitly asks for them.

UX requirements:

- Start with a concise dashboard that includes:
  - a `git status` summary
  - risky-file warnings
  - a numbered roadmap of all likely commit batches
- The roadmap must:
  - give each batch a short high-level title
  - be sorted from the smallest, most atomic change to the largest or most entangled change
  - place ambiguous or risky groups at the end
- For the active batch, show:
  - the proposed batch title
  - the exact files in the batch
  - a brief rationale for why those files belong together
  - a suggested commit title for later use
- Offer exactly these choices for each batch: `accept`, `edit`, or `skip`
- If the user chooses `edit`, adjust the batch conversationally by asking which files to add or remove, then restate the revised batch before staging it.
- If the user chooses `accept`, stage only that batch with `git add`.
- After each accepted or edited batch, show what was staged, then recompute, re-sort, and renumber the remaining roadmap so the next proposal is again the smallest remaining atomic change.
- Continue until no obvious batches remain.
- Finish with a concise summary of:
  - staged batches
  - skipped files
  - risky files left untouched
  - anything that still needs manual judgment

Important constraints:

- Never commit.
- Never stage files that are not currently changed or untracked.
- Never silently stage risky files.
- Keep the interaction operator-style and concise.
