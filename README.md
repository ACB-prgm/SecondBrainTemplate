# SecondBrain Template

SecondBrain is a durable personal knowledge repository template for storing AI-readable summaries, indexes, records, and source-file references.

This repository is intentionally minimal. It does **not** define fixed life categories such as `home/`, `finance/`, or `health/`. Instead, it defines the operating rules for creating durable subject folders as information is added.

## Core Invariants

- `manifest.md` is the human-readable map of the repository.
- `index/*.json` files are the machine-readable indexes.
- `.secondbrain/*.md` files define the operating model and must be read before storage, retrieval, update, or reporting work.
- Top-level subject folders are created only when durable content justifies them.
- Every top-level subject folder must contain a `README.md` defining its purpose, boundaries, expected structure, and canonical files.
- Source material, extracted facts, and synthesized summaries must remain distinguishable.
- Health, legal, financial, identity, and similarly sensitive records should preserve original wording and use append-only factual logs unless the user explicitly requests revision.

## Bootstrap

A GPT or agent using this repository must first read:

1. `.secondbrain/BOOTSTRAP.md`
2. `.secondbrain/TEMPLATE_CONFIG.json`
3. `.secondbrain/OPERATING_MODEL.md`
4. `.secondbrain/REPO_FORMAT.md`
5. `.secondbrain/STORAGE_PRINCIPLES.md`
6. `.secondbrain/GITHUB_TOOL_WORKFLOWS.md`
7. `.secondbrain/RECORD_SCHEMAS.md`
8. `.secondbrain/TEMPLATE_SYNC.md`

If those files are missing or unreadable, the GPT must stop instead of guessing.
