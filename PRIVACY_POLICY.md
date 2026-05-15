# Privacy Policy

SecondBrain is a user-controlled personal knowledge system backed by a private GitHub repository named `SecondBrain`. It stores structured notes, indexes, summaries, source references, preferences, follow-ups, and optional links to external action systems such as Google Tasks, Google Calendar, and Google Sheets.

## Data Stored

SecondBrain may store information the user chooses to save, including:

- notes, summaries, records, logs, and indexes
- source references and companion notes for files stored elsewhere
- user preferences in `USER_PREFS.md`
- data-quality follow-ups in `follow-ups.md`
- template operating files under `.secondbrain/`
- optional skill files under `.skills/`
- optional references to Google Task IDs, Calendar event IDs, Calendar links, or Google Sheets IDs/links when useful

The template does not require storing large source documents directly in GitHub. PDFs, scans, images, spreadsheets, or other artifacts may be stored elsewhere and referenced from companion notes.

## User Control

The user controls the private `SecondBrain` repository and decides what to store, update, remove, or share.

SecondBrain should not claim that information has been saved, deleted, synced, or externally updated unless the relevant GitHub or Google API operation succeeds.

`USER_PREFS.md` is intended for durable behavioral preferences only. It should be updated only when the user explicitly asks or after the user agrees to save a proposed preference.

`follow-ups.md` is intended for unresolved information needed for SecondBrain accuracy. It is not a general task list.

## GitHub Access

The GitHub action uses OAuth scopes that allow repository access and user-profile lookup. It is designed to operate on:

- the user's private `SecondBrain` repository
- the public template/development repository `ACB-prgm/SecondBrainTemplate`

The public template repository should contain only template files, operating instructions, OpenAPI schemas, optional skills, privacy policy text, and scaffolding. It should not contain user-specific personal data.

Because Git preserves history, deleting a file from the current branch may not remove it from prior commits. Sensitive information, secrets, or mistakenly stored data may remain recoverable from repository history unless history rewriting or repository deletion is performed.

## Google Access

If enabled, SecondBrain may use Google APIs for action management or tabular storage:

- Google Tasks for todos and due-date reminders
- Google Calendar for appointments, meetings, scheduled events, and timed reminders
- Google Sheets for optional scalable tabular datasets, such as expenses, transactions, budgets, inventory, logs, or recurring measurements

Google Tasks and Calendar entries may include short references back to related SecondBrain records when that improves context, retrieval, or auditability.

Google Sheets is optional and should be used only when the Tabular Storage skill determines that a dataset is naturally tabular and likely to grow or need sorting, filtering, formulas, repeated row updates, or column summaries. GitHub remains the context and source-of-truth layer; Sheets stores rows.

Google API data is handled by Google under Google's terms and privacy policies. Access depends on the OAuth scopes granted by the user.

## Template Sync and User-Managed Files

Template sync should update only template-managed files.

It must not overwrite user data, subject folders, manifests, indexes, `USER_PREFS.md`, or `follow-ups.md` after creation unless the user explicitly instructs and confirms that action.

`USER_PREFS.md` and `follow-ups.md` may be read during bootstrap but are user-managed after creation.

## Optional Skills and Issues

SecondBrain may load optional skill files from `.skills/` only when the user asks for that workflow or the current task clearly requires it.

The Bug Reporting skill may create or update issues in `ACB-prgm/SecondBrainTemplate` for SecondBrain system defects, schema issues, workflow bugs, or maintenance improvements.

Issue reporting should:

- require explicit user approval before creation,
- avoid personal identifiers and sensitive records,
- and prefer sanitized summaries and minimal reproduction details.

Personal records, health information, insurance information, HOA matters, uploaded documents, or ordinary user todos should not be filed as public template issues.

## Sensitive Information

Users should avoid storing credentials, private keys, access tokens, passwords, recovery phrases, OAuth credentials, API keys, or other secrets in SecondBrain, Google Tasks, Calendar events, or Sheets.

SecondBrain may warn users when sensitive secrets appear likely to be stored, but it may still proceed if the user explicitly confirms.

For sensitive records such as health, legal, financial, insurance, tax, identity, or employment data, SecondBrain should preserve source wording or source references and distinguish raw/source material, extracted facts, and synthesized summaries.

## Security Limitations

SecondBrain is a convenience and organization system, not a hardened secure vault.

Data may be exposed through:

- Git history persistence,
- OAuth token compromise,
- third-party service compromise,
- accidental sharing,
- prompt/model errors,
- synchronization mistakes,
- user error,
- or platform-level vulnerabilities.

No guarantee of absolute privacy, security, durability, or data preservation is provided.

Users are responsible for deciding what information to store and for maintaining their own backups and operational security practices.

## Liability Disclaimer

The template, prompts, schemas, and workflows are provided as-is without warranties or guarantees.

To the maximum extent permitted by law, the creator and maintainers of `SecondBrainTemplate` are not responsible for:

- data loss,
- incorrect storage or retrieval,
- duplicate or missed reminders/events,
- synchronization failures,
- privacy exposure,
- third-party service behavior,
- prompt/model mistakes,
- or security incidents arising from use of the system.

Users are responsible for reviewing actions, confirmations, stored data, and integrations before relying on the system for important or sensitive workflows.

## Third-Party Services

SecondBrain can interact with third-party services such as GitHub and Google only when the user enables the relevant actions and grants OAuth permissions. Data handling by those services is governed by their own terms and privacy policies.

## Contact

This template is maintained in the public repository `ACB-prgm/SecondBrainTemplate`. Issues or change requests for the template can be managed through that repository.
