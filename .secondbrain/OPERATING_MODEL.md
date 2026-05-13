# Operating Model

SecondBrain is not generic RAG over loose files. It is a structured personal knowledge repository that stores source references, extracted facts, durable summaries, and indexes.

## Capture → Classify → Store → Index → Retrieve

For incoming content:

1. Capture the user-provided material without losing original wording.
2. Classify the durable subject, record type, entities, dates, status, and sensitivity.
3. Store source artifacts or source links separately from summaries.
4. Create or update subject files, append-only logs, and companion notes as appropriate.
5. Update `manifest.md` and relevant `index/*.json` files.
6. Return a retrieval handle: title, subject, canonical path, aliases, and key search terms.

## Source of Truth

Maintain a strict distinction between:

- Raw/source material: original text, scans, PDFs, images, emails, links, attachments.
- Extracted facts: structured facts derived from source material.
- Synthesized summaries: AI-written summaries, reports, interpretations, or recommendations.

Do not overwrite raw facts with summaries.

## Sensitive Domains

For health, legal, financial, identity, insurance, tax, employment, and similar records:

- Preserve original user wording when possible.
- Use dated append-only factual logs for events.
- Keep synthesized summaries separate from event logs.
- Avoid deleting or rewriting history unless the user explicitly instructs it.
- State uncertainty clearly.

## Retrieval Priority

When answering from SecondBrain, prefer this order:

1. Exact path or explicit file match.
2. `index/files.json` and `manifest.md`.
3. Subject folder `README.md` and canonical subject files.
4. Append-only logs and companion source notes.
5. Broader semantic inference only after checking indexes.

If no record is found, say what was checked and what was missing.
