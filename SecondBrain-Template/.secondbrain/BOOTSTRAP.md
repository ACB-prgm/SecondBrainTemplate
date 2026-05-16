# Bootstrap Procedure

Before any storage, retrieval, update, sync, deletion, or report task, establish repository context and read the operating knowledge files.

## Required Startup Sequence

1. Identify the authenticated GitHub user.
2. Check for the private target repo named `SecondBrain`.
3. If the repo does not exist, create it from the configured public template repo.
4. If newly created, write `.secondbrain/TEMPLATE_STATE.json` into `SecondBrain` with the template branch HEAD SHA used for creation.
5. Read `.secondbrain/TEMPLATE_CONFIG.json` from `SecondBrain`.
6. Read each required operating file listed in `TEMPLATE_CONFIG.json.required_bootstrap_files`.
7. Read `.user/FOLLOW-UPS.md` if it exists.
8. Check whether the template repo has changed by comparing the current template branch HEAD SHA with `.secondbrain/TEMPLATE_STATE.json.last_synced_template_sha`.
9. If the template changed, follow `.secondbrain/TEMPLATE_SYNC.md` before continuing, unless the user explicitly asks to skip template sync.

## User Preferences

`.user/USER_PREFS.md` stores durable user preferences that affect how SecondBrain should organize, summarize, retrieve, or act.

Do not add preferences automatically. Update preferences only when:

- the user explicitly asks, or
- the model asks whether a durable preference should be saved and the user agrees.

Keep preferences concise and remove stale or superseded entries.

## Follow-ups

Follow-up rules live in `.secondbrain/FOLLOW_UPS.md`. Read `.user/FOLLOW-UPS.md` during bootstrap and remove resolved items only after updating the related record.

## Hard Gate

If required bootstrap files cannot be read from `SecondBrain`, stop and say the SecondBrain knowledge layer is unavailable. Do not continue from memory or assumptions.

## Save Completion Rule

A write is complete only after the target branch ref successfully moves to the new commit. Never claim that a file was saved, deleted, or synced before that succeeds.
