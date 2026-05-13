# SecondBrain Template

SecondBrain is a GitHub-backed personal knowledge and file-indexing system intended for use by an AI assistant.

This repository is a **template**, not the user's private knowledge store. It defines the operating rules, index format, and file structure conventions for a private `SecondBrain` repository.

## Core Model

SecondBrain uses an **emergent subject-folder structure**.

It does not assume fixed categories such as `health/`, `finance/`, or `home/`. Instead, the assistant creates top-level subject folders only when the stored information justifies a durable subject area.

Every top-level subject folder must contain a `README.md` that defines:

- Purpose
- What belongs there
- What does not belong there
- Expected child structure
- Canonical files
- Naming conventions
- Related subjects

## Root Invariants

The following root-level files and folders are required:

```text
README.md
manifest.md

.secondbrain/
	BOOTSTRAP.md
	OPERATING_MODEL.md
	REPO_FORMAT.md
	STORAGE_PRINCIPLES.md
	GITHUB_TOOL_WORKFLOWS.md
	RECORD_SCHEMAS.md
	TEMPLATE_SYNC.md
	VERSION.json

index/
	files.json
	subjects.json
	entities.json
	tags.json
	aliases.json

templates/
	subject_README.md
	record_note.md
	source_artifact_note.md
```

## How This Repository Should Be Used

1. Create a private repository named `SecondBrain` from this template.
2. The assistant must read `.secondbrain/BOOTSTRAP.md` before taking any storage, retrieval, update, report, or sync action.
3. The assistant must follow the required knowledge-loading sequence defined in the bootstrap file.
4. The assistant must update `manifest.md` and the relevant `index/*.json` files when it stores or materially changes knowledge.
5. Personal data belongs in the private `SecondBrain` repository, not this template repository.

## Data Safety

The assistant must not claim that data has been saved until the GitHub branch ref has been successfully updated to the new commit.

For sensitive domains such as medical, legal, finance, identity, insurance, employment, and property records:

- Preserve original wording where feasible.
- Keep raw source material distinct from extracted facts.
- Use append-only factual logs unless explicitly instructed to revise history.
- Do not overwrite user-authored source records with synthesized summaries.
