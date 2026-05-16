# SecondBrain Template

SecondBrain is a durable personal knowledge repository template for storing AI-readable summaries, routing metadata, records, and source-file references.

This repository is intentionally minimal. It does **not** define fixed life categories such as `home/`, `finance/`, or `health/`. Instead, it defines the operating rules for creating durable subject folders as information is added.

## Core Invariants

- `.user/MANIFEST.md` is the human-readable map of the repository.
- `.user/ALIASES.md` stores sparse non-obvious aliases when needed.
- `.secondbrain/*.md` files define the operating model and must be read before storage, retrieval, update, or reporting work.
- `.templates/*.md` files provide reusable note and subject-folder templates.
- Top-level subject folders are created only when durable content justifies them.
- Every top-level subject folder must contain a `README.md` defining its purpose, boundaries, expected structure, and canonical files.
- Source material, extracted facts, and synthesized summaries must remain distinguishable.
- Health, legal, financial, identity, and similarly sensitive records should preserve original wording and use append-only factual logs unless the user explicitly requests revision.

## Bootstrap

A GPT or agent using this repository must first read:

1. `.secondbrain/TEMPLATE_CONFIG.json`
2. Every path listed in `required_bootstrap_files`
3. `.user/FOLLOW-UPS.md` if present

If those files are missing or unreadable, the GPT must stop instead of guessing.
