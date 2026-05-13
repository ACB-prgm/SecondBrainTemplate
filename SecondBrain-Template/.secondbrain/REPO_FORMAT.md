# Repository Format

SecondBrain uses an emergent subject-folder structure. It does not assume a fixed taxonomy.

## Root Structure

Required root files and folders:

- `README.md` — explains the repository purpose and invariants.
- `manifest.md` — human-readable subject and record map.
- `.secondbrain/` — operating instructions, template config, and sync rules.
- `index/` — machine-readable indexes.
- `templates/` — reusable file templates.

## Index Files

- `index/files.json` tracks stored files, records, source artifacts, and companion notes.
- `index/subjects.json` tracks top-level subject folders.
- `index/entities.json` tracks durable entities such as people, organizations, properties, accounts, systems, vendors, and projects.
- `index/tags.json` tracks cross-cutting tags.
- `index/aliases.json` tracks alternate names, misspellings, nicknames, and retrieval phrases.

## Subject Folders

Create a top-level subject folder only when:

1. The content does not clearly belong to an existing subject.
2. The subject is durable and likely to receive future records.
3. The subject can be described clearly in a `README.md`.
4. Creating the folder improves retrieval clarity more than tags alone.

Do not create a top-level folder for a one-off document unless it represents a recurring or durable subject area.

## Required Subject README

Every top-level subject folder must contain `README.md` defining:

- Purpose
- What belongs here
- What does not belong here
- Expected structure
- Canonical files
- Naming conventions
- Related subjects

Use `templates/subject_README.md` when creating a new subject.

## Naming

- Use lowercase kebab-case for folders and files.
- Prefer durable subject names over narrow one-off names.
- Use ISO dates for event or note files when helpful: `YYYY-MM-DD-topic.md`.
- Avoid ambiguous names like `misc`, `stuff`, `docs`, or `general` unless they are temporary and scheduled for cleanup.

## Manifest vs Indexes

`manifest.md` is for quick human navigation. It should be concise.

The JSON indexes are the machine-readable retrieval layer. They should contain structured metadata and retrieval handles.
