# Repository Format

SecondBrain uses a flexible subject-folder structure. It does not assume a fixed taxonomy.

## Root Structure

Required root files and folders:

- `README.md` — explains the repository purpose and invariants.
- `manifest.md` — human-readable subject and record map.
- `.secondbrain/` — operating instructions, template config, and sync rules.
- `index/` — machine-readable indexes.
- `templates/` — reusable file templates.

## Index Files

The active index schema is defined by the current template and repository docs. Indexes are the machine-readable retrieval layer and should contain structured metadata and retrieval handles.

## Subject Folders

Create a top-level subject folder only when:

1. The content does not clearly belong to an existing subject.
2. The subject is durable and likely to receive future records.
3. The subject can be described clearly in a `README.md`.
4. Creating the folder improves retrieval clarity more than tags or aliases alone.

Do not create a top-level folder for a one-off document unless it represents a recurring or durable subject area.

## Required Subject README

Every top-level subject folder must contain `README.md` defining:

- Purpose of the directory.
- Inclusion criteria: what belongs there.
- Exclusion criteria: what should be stored elsewhere.
- Expected structure and why that structure is used.
- Canonical files and their roles.
- Naming conventions.
- Related subjects.

Use `templates/subject_README.md` when creating a new subject.

When placing information into an existing subject folder, first read that folder's `README.md` and follow its structure when reasonable. If the existing structure does not fit the new information, the model may revise the folder structure and update the README in the same commit. Any revision should keep the folder tight, efficient, and easy to retrieve from. Prefer small structural adjustments over unnecessary new subfolders or sprawling indexes.

A subject README is not just documentation; it is the local contract for how that directory should be used.

## Subfolders

Create subfolders only when repeated record types, projects, events, or source groups justify them. Subfolders should inherit the subject README's rules unless their purpose becomes complex enough to require their own README.

A subfolder should get its own `README.md` when:

- It contains multiple files or recurring records.
- Its inclusion/exclusion criteria are not obvious from the parent README.
- It has a distinct internal structure.
- It is likely to be retrieved or updated independently.

## Naming

- Use lowercase kebab-case for folders and files.
- Prefer durable subject names over narrow one-off names.
- Use ISO dates for event or note files when helpful: `YYYY-MM-DD-topic.md`.
- Avoid ambiguous names like `misc`, `stuff`, `docs`, or `general` unless they are temporary and scheduled for cleanup.

## Manifest vs Indexes

`manifest.md` is for quick human navigation. It should be concise.

Indexes are for machine-readable retrieval. They should be accurate, compact, and aligned to the active repo format.
