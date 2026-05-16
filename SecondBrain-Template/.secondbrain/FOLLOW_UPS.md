# Follow-ups

Follow-ups are a lightweight data-quality queue for unresolved information needed to keep SecondBrain accurate and complete.

Follow-ups are not a general task list, calendar, or reminder system. They exist to track missing outcomes, unresolved facts, pending source material, or clarification requests that materially affect record accuracy, retrieval, or future reporting.

## Live Queue

The live queue is stored at the repository root:

- `follow-ups.md`

Keep the queue short. Remove items once resolved and update the related record in the same write whenever possible.

Keep at most 15 active follow-ups. If a new follow-up would exceed 15, consolidate related items, remove stale items, or keep only the highest-value items.

## When to Create a Follow-up

Create a follow-up only when the missing information is materially relevant to record accuracy, retrieval, future reporting, or a known unresolved outcome.

Create a follow-up only when one of these is true:

1. A record is known to be incomplete.
2. An expected outcome is pending.
3. The user referenced an event whose result matters but was not provided.
4. A source file, attachment, or record was mentioned but is unavailable.
5. The model had to preserve uncertainty that should be resolved later.
6. Missing information materially affects record accuracy, retrieval, or future reporting.

Do not create speculative follow-ups, nice-to-have research tasks, or curiosity-driven questions.

## Queue Schema

Use this table in `follow-ups.md`:

| ID | Created | Subject | Prompt | Reason | Related Path | Priority |
|---|---:|---|---|---|---|---|

Field guidance:

- `ID`: stable ID in the form `FU-YYYY-MM-DD-###`.
- `Created`: ISO date when the follow-up was created.
- `Subject`: related top-level subject or blank if not subject-specific.
- `Prompt`: concise question to ask the user whenever possible.
- `Reason`: why the information matters for accuracy or retrieval.
- `Related Path`: most relevant file, folder, or intended location.
- `Priority`: `low`, `medium`, or `high`.

## Surfacing Rules

During bootstrap, read `follow-ups.md` if it exists.

At the end of every user-facing response, include a short follow-up footer when there are any active follow-ups. Use the heading:

`Follow-ups (shown of total):`

Footer rules:

- Always show active follow-ups when any exist.
- Show at most 15 follow-ups.
- Phrase follow-up items as concise questions for the user whenever possible.
- Prioritize blocking, high-priority, due/current-subject, and recently relevant items.
- If there are no active follow-ups, omit the follow-up section entirely.
- Keep each item short, ideally under one line.
- Do not derail the user's requested task unless the follow-up is blocking.

The footer should be a brief status nudge, not a full task list or explanation.

## Resolution Rules

When the user provides information that resolves a follow-up:

1. Update the related record first.
2. Remove the resolved item from `follow-ups.md`.
3. Keep unresolved follow-ups in the queue.
4. Mention the resolved follow-up ID only if useful.

Resolved items should not accumulate in `follow-ups.md`. Git history is sufficient for historical traceability.

## Maintenance Rules

- Keep `follow-ups.md` small and current.
- Keep at most 15 active follow-ups.
- Prefer fewer high-value follow-ups over many low-value ones.
- Do not use follow-ups for generic reminders or personal task management.
- Do not create duplicate follow-ups for the same missing information.
- If a follow-up becomes stale or irrelevant, remove it and update related records if needed.
