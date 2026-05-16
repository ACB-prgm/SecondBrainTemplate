# Google Workflows

Google Tasks and Google Calendar are optional action tools used for todos, reminders, and scheduled commitments.

SecondBrain remains the knowledge repository. Google Tasks and Calendar are action/time-management systems.

## Tool Boundaries

- Use SecondBrain for records, source material, summaries, routing metadata, and data-quality follow-ups.
- Use Google Tasks for checklist-style todos and due-date reminders.
- Use Google Calendar for scheduled events, appointments, meetings, recurring events, and timed reminders.
- Do not automatically convert ordinary SecondBrain follow-ups into Google tasks or calendar events unless the item itself clearly belongs there.

## Todos

Use Google Tasks for actionable items, checklist workflows, due-date reminders, and ongoing operational tasks.

Examples:

- Call UCLA neurology.
- Schedule MRI imaging.
- Upload insurance paperwork.
- Renew vehicle registration.

For reminders without a scheduled time, prefer Google Tasks.

## Calendar Events

Use Google Calendar for scheduled commitments.

Examples:

- Doctor appointments.
- Meetings.
- Flights.
- Timed reminders.
- Recurring reminders.

When creating events, include title, date/time, timezone if needed, location, description, and reminders when available.

## Proactive Behavior

After ingesting information, evaluate whether it clearly or potentially belongs in Google Tasks, Google Calendar, or `.user/FOLLOW-UPS.md`.

Rules:

- If the information clearly represents a scheduled appointment, meeting, reservation, deadline, or timed commitment, create a Google Calendar event without asking first.
- If the information clearly represents an actionable todo or reminder, create a Google Task without asking first.
- If the item only potentially belongs in Tasks/Calendar, briefly ask the user.
- The user can approve or deny tool actions through the ChatGPT action confirmation flow.
- Do not create Google items for vague ideas, speculative plans, or low-confidence interpretations.

Examples of automatic creation:

- MRI appointment details with date/time/location -> Calendar event.
- "I need to call neurology next week" -> Google Task.
- Flight itinerary -> Calendar event.

Examples that should ask first:

- General discussion about wanting therapy.
- Mentioning a future idea without commitment.
- Loose goals or aspirations.

## Confirmation Rule

Do not claim a Google task, reminder, or calendar event was created, updated, completed, or deleted until the relevant API call succeeds.

After success, briefly confirm:

- item type,
- title,
- date/time or due date when relevant,
- and any important destination such as task list or calendar.

## SecondBrain Cross-Links

When creating a Google Task or Calendar event from a specific SecondBrain record, include a short SecondBrain reference path or retrieval handle in the task notes or event description.

Example task note:

```text
Related SecondBrain record:
health/visits/2026-05-13-primary-care-visit-summary.md

Context:
Follow up on MRI/MRA order from visit summary.
```

Do not add SecondBrain references to generic tasks unless they improve retrieval, context, auditability, or future updates.

If useful, also store external Google IDs or links in the related SecondBrain record:

- Google Task ID
- Google Calendar Event ID
- Calendar event link

Add these only when they improve retrieval, auditability, or future updates.

## OAuth Scopes

The expected Google action scopes are:

- `https://www.googleapis.com/auth/tasks`
- `https://www.googleapis.com/auth/calendar.events`
- `https://www.googleapis.com/auth/calendar.readonly`

These scopes support task CRUD, event CRUD, and calendar list reads.
