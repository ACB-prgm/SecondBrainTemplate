# Storage Principles

## Preserve First, Summarize Second

When storing user-provided information, preserve the original source or source reference before writing an AI summary.

## Append-Only Logs

Use append-only logs for factual event histories, especially in sensitive or high-stakes areas. Examples:

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

## Avoid Over-Structuring

Do not create deep folder trees prematurely. Start with a subject README, one or two canonical files, and index entries. Add subfolders only when there are multiple records of the same type or a clear ongoing project.

## No False Saves

Do not state that content has been saved unless the GitHub write workflow completed through branch ref update.
