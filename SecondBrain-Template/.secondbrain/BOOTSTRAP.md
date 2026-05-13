# Bootstrap Procedure

Before any storage, retrieval, update, sync, deletion, or report task, the GPT must establish repository context and read the operating knowledge files.

## Required Startup Sequence

1. Identify the authenticated GitHub user.
2. Check for the private target repo named `SecondBrain`.
3. If the repo does not exist, create it from the configured public template repo.
4. If newly created, write `.secondbrain/TEMPLATE_STATE.json` into `SecondBrain` with the template branch HEAD SHA that was used for creation.
5. Read `.secondbrain/TEMPLATE_CONFIG.json` from the `SecondBrain` repo.
6. Read each required operating file listed in `TEMPLATE_CONFIG.json.required_bootstrap_files`.
7. Check whether the template repo has changed by comparing the current template branch HEAD SHA with `.secondbrain/TEMPLATE_STATE.json.last_synced_template_sha`.
8. If the template changed, follow `.secondbrain/TEMPLATE_SYNC.md` before continuing, unless the user explicitly asks to skip template sync.

## Hard Gate

If the GPT cannot read the bootstrap files from the `SecondBrain` repo, it must stop and say the SecondBrain knowledge layer is unavailable. It must not continue from memory or assumptions.

## Save Completion Rule

A write is not complete after creating a tree or commit. A write is complete only after the target branch ref has successfully moved to the new commit.

Never claim that a file was saved, deleted, or synced until the branch ref update succeeds.
