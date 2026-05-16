# Repository Format

SecondBrain uses a flexible subject-folder structure. It does not assume a fixed taxonomy.

## Root Structure

Required root files and folders:

- `README.md` — explains the repository purpose and invariants.
- `.secondbrain/` — operating instructions, template config, and sync rules.
- `.templates/` — reusable file templates.
- `.user/` — user-managed routing files, preferences, follow-ups, aliases, and entity metadata.

Required `.user/` files:

- `.user/MANIFEST.md` — human-readable top-level subject map and global routing notes.
- `.user/USER_PREFS.md` — durable user preferences for storage, retrieval, summarization, organization, and actions.
- `.user/FOLLOW-UPS.md` — active data-quality follow-ups.
- `.user/ALIASES.md` — sparse mappings for non-obvious user-specific names, nicknames, abbreviations, or renamed entities.
- `.user/ENTITIES.json` — durable user-specific real-world entities used for retrieval and disambiguation.

## Routing Model

Use the repository tree itself as the primary structure.

Retrieval should generally follow this loop:

1. Read `.user/MANIFEST.md` to choose the likely top-level subject.
2. Inspect the likely folder tree.
3. Read that folder's `README.md`.
4. Decide whether the target record is directly in that folder or one level deeper.
5. Repeat with a subfolder README only when needed.
6. Use GitHub search as a fallback when tree/path inference is not enough.

Do not maintain exhaustive global JSON routing files. They duplicate Git's tree and do not scale well for a model-first knowledge repo.

## Manifest

`.user/MANIFEST.md` is the global routing map. It should stay concise and describe:

- top-level subject folders,
- what each subject is for,
- broad routing notes,
- and any important global conventions.

Do not duplicate detailed file inventories in `.user/MANIFEST.md`. Detailed local routing belongs in the relevant directory `README.md`.

## Aliases

Aliases are optional and should be sparse.

Use aliases only for non-obvious mappings, such as:

- nicknames,
- renamed entities,
- uncommon abbreviations,
- user-specific phrases,
- vendor or project names whose correct location is not obvious from the folder tree.

Do not create aliases for obvious terms, ordinary synonyms, receipts, individual source artifacts, or phrases the model can infer from filenames and subject folders.

## Entity Registry

`.user/ENTITIES.json` is a structured registry for durable user-specific real-world entities that recur across records or materially improve retrieval.

Use it for:

- people, family members, household members, clinicians, and other individual contacts
- businesses, vendors, employers, schools, insurers, institutions, agencies, and organizations
- user-specific properties, accounts, services, systems, or projects when they are durable retrieval anchors

Do not use it for:

- medications, diagnoses, conditions, symptoms, procedures, labs, allergies, or other medical concepts
- generic concepts, tags, ordinary subject names, product categories, or taxonomy terms
- one-off receipts, individual documents, uploaded files, or source artifacts
- entities that are obvious from a single subject folder and unlikely to recur

When a medication or medical concept appears in a record, store it in the relevant subject file, such as `health/medications.md`, and link any related real-world entities such as clinicians, pharmacies, or insurers through `.user/ENTITIES.json`.

`.user/ALIASES.md` remains a sparse routing aid. Entity aliases should live inside `.user/ENTITIES.json` when they are alternate names for the same durable entity.

## Subject Folders

Create a top-level subject folder only when:

1. The content does not clearly belong to an existing subject.
2. The subject is durable and likely to receive future records.
3. The subject can be described clearly in a `README.md`.
4. Creating the folder improves retrieval clarity more than a canonical file inside an existing subject.

Do not create a top-level folder for a one-off document unless it represents a recurring or durable subject area.

## Required Subject README

Every top-level subject folder must contain `README.md` defining:

- Purpose of the directory.
- Inclusion criteria: what belongs there.
- Exclusion criteria: what should be stored elsewhere.
- Expected structure and why that structure is used.
- Canonical files and their roles.
- Local file/subfolder map when useful.
- Naming conventions.
- Related subjects.

Use `.templates/subject_README.md` when creating a new subject.

When placing information into an existing subject folder, first read that folder's `README.md` and follow its structure when reasonable. If the existing structure does not fit the new information, the model may revise the folder structure and update the README in the same commit. Any revision should keep the folder tight, efficient, and easy to retrieve from.

A subject README is not just documentation; it is the local routing contract for how that directory should be used.

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
