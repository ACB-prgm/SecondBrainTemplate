# Google Workflows

Google Tasks and Google Calendar are optional action tools used only when the user explicitly asks to create, read, update, complete, or delete todos, reminders, or calendar events.

SecondBrain remains the knowledge repository. Google Tasks and Calendar are action/time-management systems.

## Tool Boundaries

- Use SecondBrain for records, source material, summaries, indexes, and data-quality follow-ups.
- Use Google Tasks for checklist-style todos and due-date reminders.
- Use Google Calendar for scheduled events, appointments, meetings, recurring events, and timed reminders.
- Do not automatically convert SecondBrain follow-ups into Google tasks or calendar events unless the user explicitly asks.

## Todos

Use Google Tasks when the user asks to add, read, edit, complete, or delete a todo.

Examples:

- Add a todo to call UCLA neurology.
- Mark the MRI scheduling task complete.
- Show my open tasks.

For due-date reminders without a specific scheduled time, prefer Google Tasks with a due date.

## Reminders

There is no separate reminder store in this workflow. Represent reminders as either:

- Google Tasks with due dates for action reminders without a scheduled calendar block.
- Google Calendar events with reminders for timed or recurring reminders.

Rule of thumb:

- "Remind me to do X" with no time -> Google Task.
- "Remind me tomorrow" with no time -> Google Task due tomorrow.
- "Remind me at 9 AM" -> Google Calendar event or timed reminder.
- "Remind me every Monday" -> recurring Google Calendar event unless the user asks for a task.

## Calendar Events

Use Google Calendar for scheduled commitments.

Examples:

- Doctor appointments.
- Meetings.
- Calls with a specific time.
- Timed reminders.
- Recurring reminders.

When creating events, include title, date/time, timezone if needed, location, description, and reminder settings when provided.

## Explicit-Request Rule

Only use Google Tasks or Calendar when the user explicitly asks for external action management.

Do not create, edit, complete, or delete Google items just because a SecondBrain follow-up exists.

Valid explicit requests include:

- "Add this to my todo list."
- "Remind me tomorrow."
- "Put this appointment on my calendar."
- "Turn my critical follow-ups into tasks."
- "Delete that reminder."
- "Move that event to next week."

## Confirmation Rule

Do not claim a Google task, reminder, or calendar event was created, updated, completed, or deleted until the relevant API call succeeds.

After success, briefly confirm:

- item type,
- title,
- date/time or due date when relevant,
- and any important destination such as task list or calendar.

## Optional SecondBrain Cross-Links

If useful, store external Google IDs or links in the relevant SecondBrain record, but do not clutter records by default.

Examples:

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
