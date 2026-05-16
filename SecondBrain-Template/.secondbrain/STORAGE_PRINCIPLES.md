# Storage Principles

## Preserve First, Summarize Second

When storing user-provided information, preserve the original source or source reference before writing an AI summary.

## Append-Only Logs

Use append-only logs for factual event histories, especially in sensitive or high-stakes areas.

Examples:

- symptoms or health events
- legal disputes
- payments or loan events
- contractor interactions
- insurance claims
- tax-related records

A synthesized summary may be revised, but the underlying event log should remain historically stable.

## Companion Notes for Source Artifacts

When a source artifact is stored outside GitHub, such as a PDF, image, scan, spreadsheet, or Google Drive file, create a companion markdown note that records:

- source title
- source type
- date received or created
- external link or storage location
- summary
- extracted key facts
- related entities
- retrieval aliases
- sensitivity

Use `templates/source_artifact_note.md`.

## File Promotion

A quick note may later become a subject, canonical file, or append-only log. Promote structure when retrieval or reporting value justifies it.

## Refactor Check

After every ingestion, briefly evaluate whether the new information suggests the existing tree should be refactored.

Ask internally:

`Given this new information, does the structure need to be refactored?`

The goal is a logical, simple, durable tree with the fewest useful folders and the clearest retrieval paths.

Refactor only when the current structure is becoming misleading, duplicated, too flat, too deeply nested, or no longer matches how the user will retrieve the information.

Do not refactor just because a new item could fit a more specific folder. Prefer stability unless the change improves clarity, retrieval, or future maintenance.

If a refactor seems useful but is not clearly necessary, ask the user before moving or renaming existing files. If a refactor is small, obvious, and part of the current write, it may be done with the normal write summary.

## Avoid Over-Structuring

Do not create deep folder trees prematurely. Start with a subject README, one or two canonical files, and index entries. Add subfolders only when there are multiple records of the same type or a clear ongoing project.

## Duplicate Prevention

Before creating a new task, calendar event, canonical file, log entry, or dataset, check for likely existing duplicates using indexes, subject files, recent records, and current open tasks/events when appropriate.

Prefer updating or extending an existing item over creating duplicate structures.

## Secret and Credential Warning

If the user attempts to store likely credentials, secrets, private keys, recovery phrases, passwords, API keys, session tokens, OAuth credentials, or similarly sensitive secrets, warn the user that storing secrets in Git repositories, tasks, calendar events, or sheets is not recommended because plaintext history and third-party systems may persist the data.

Do not hard-refuse storage. If the user explicitly confirms they still want to store the information, proceed.

## No False Saves

Do not state that content has been saved unless the GitHub write workflow completed through branch ref update.

After successful writes, briefly summarize the write actions performed, such as paths changed, tasks/events created, or records updated.
