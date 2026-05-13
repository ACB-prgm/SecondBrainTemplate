# Follow-ups

Follow-ups are a lightweight data-quality queue for unresolved information needed to keep SecondBrain accurate and complete.

Follow-ups are not a general task list, calendar, or reminder system. They exist to track missing outcomes, unresolved facts, pending source material, or clarification requests that materially affect record accuracy, retrieval, or future reporting.

## Live Queue

The live queue is stored at the repository root:

- `follow-ups.md`

Keep the queue short. Remove items once resolved and update the related record in the same write whenever possible.

## When to Create a Follow-up

Create a follow-up only when one of these is true:

1. A record is known to be incomplete.
2. An expected outcome is pending.
3. The user referenced an event whose result matters but was not provided.
4. A source file, attachment, or record was mentioned but is unavailable.
5. The model had to preserve uncertainty that should be resolved later.
6. Missing information materially affects record accuracy, retrieval, or future reporting.

Do not create speculative follow-ups or nice-to-have research tasks.

## Trigger Types

Each follow-up must have exactly one trigger type.

### always

Surface at the start of every session until resolved. Use only for critical gaps.

### subject

Surface only when the current task relates to the listed subject.

### after_date

Eligible to surface only when the current date is on or after the listed date. This does not create an automatic reminder. It only makes the follow-up eligible during a future SecondBrain session.

### blocking

Surface only when the missing information prevents the current task from being completed accurately.

## Queue Schema

Use this table in `follow-ups.md`:

| ID | Created | Trigger | Subject | After Date | Prompt | Reason | Related Path | Priority |
|---|---:|---|---|---:|---|---|---|---|

Field guidance:

- `ID`: stable ID in the form `FU-YYYY-MM-DD-###`.
- `Created`: ISO date when the follow-up was created.
- `Trigger`: one of `always`, `subject`, `after_date`, or `blocking`.
- `Subject`: related top-level subject or blank if not subject-specific.
- `After Date`: ISO date for `after_date` triggers, otherwise blank.
- `Prompt`: concise question or request to ask the user.
- `Reason`: why the information matters for accuracy or retrieval.
- `Related Path`: most relevant file, folder, or intended location.
- `Priority`: `low`, `medium`, or `high`.

## Surfacing Rules

During bootstrap, read `follow-ups.md` if it exists, but do not automatically present every open item.

Surface only:

- `always` follow-ups.
- `subject` follow-ups when the current task relates to the subject.
- `after_date` follow-ups when the date has passed and the item is relevant or high priority.
- `blocking` follow-ups when they block the current task.

When surfacing a follow-up, be concise. Do not derail the user's requested task unless the follow-up is blocking.

## Resolution Rules

When the user provides information that resolves a follow-up:

1. Update the related record first.
2. Remove the resolved item from `follow-ups.md`.
3. Keep unresolved follow-ups in the queue.
4. Mention the resolved follow-up ID only if useful.

Resolved items should not accumulate in `follow-ups.md`. Git history is sufficient for historical traceability.

## Maintenance Rules

- Keep `follow-ups.md` small and current.
- Prefer fewer high-value follow-ups over many low-value ones.
- Do not use follow-ups for generic reminders or personal task management.
- Do not create duplicate follow-ups for the same missing information.
- If a follow-up becomes stale or irrelevant, remove it and update related records if needed.
