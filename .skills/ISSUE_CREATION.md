# Issue Creation Skill

Use this skill to track defects, improvements, RCAs, or maintenance work for the SecondBrain system itself.

## Scope

Create or update issues only in:

`ACB-prgm/SecondBrainTemplate`

Use issues for:

- template bugs
- GPT instruction defects
- OpenAPI/action schema problems
- Google Tasks/Calendar integration bugs
- GitHub sync failures
- follow-up/footer behavior bugs
- repo maintenance improvements
- RCA items for SecondBrain system behavior

Do not use issues for personal follow-ups, health records, insurance records, HOA items, financial records, identity information, or ordinary user todos.

## Before Creating an Issue

Search open issues for likely duplicates. Update or comment on an existing issue instead of creating a duplicate.

Never automatically create a public issue.

First:

1. prepare the proposed issue,
2. show the proposed title/body/labels to the user,
3. ask whether they want to report the issue to the developer.

## Privacy and Redaction

Do not include:

- personal names unless already public and necessary
- addresses
- phone numbers
- email addresses
- MRNs
- insurance IDs
- financial account details
- API keys
- secrets or credentials
- uploaded document contents
- raw personal records
- health-identifying details unless essential and explicitly approved by the user

Prefer generalized summaries, sanitized examples, pseudodata, and minimal reproduction steps.

## Issue Format

Title:

`[Area] Short issue summary`

Body:

```markdown
## Summary

## Expected behavior

## Actual behavior

## Evidence / error messages

## Likely cause

## Proposed fix

## Priority

## Labels
```

## Suggested Labels

- `bug`
- `enhancement`
- `schema`
- `prompt`
- `template-sync`
- `google-actions`
- `github-actions`
- `follow-ups`
- `docs`
- `rca`

## Confirmation

After creating or updating an issue, report the issue number, title, and URL.
