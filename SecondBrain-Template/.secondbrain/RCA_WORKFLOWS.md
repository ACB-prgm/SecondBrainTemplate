# RCA Workflows

RCA means root-cause analysis. Use this workflow when the user asks to investigate an issue, explain why something failed, determine likely root cause, or create a prevention plan.

## Purpose

The goal of an RCA is to identify:

- what happened,
- what should have happened,
- immediate cause,
- contributing causes,
- root cause,
- evidence supporting each conclusion,
- corrective actions,
- preventive actions,
- and unresolved questions.

RCA should be evidence-driven. Do not overstate certainty. Separate facts from hypotheses.

## When to Use

Use this workflow when the user says things like:

- Perform an RCA.
- Why did this fail?
- What caused this issue?
- Summarize the issue and root cause.
- Create a corrective/preventive action plan.
- Help me debug and prevent this from happening again.

## Information to Request

If the user has not provided enough context, ask for the smallest useful set of missing details. Prefer asking for logs, screenshots, error messages, timeline, and what changed recently.

Useful inputs:

- Issue summary.
- Expected behavior.
- Actual behavior.
- Error messages, screenshots, logs, or stack traces.
- Timeline: when first noticed, last known good state, recent changes.
- Environment: app, system, device, account, repo, branch, version, browser, OS, user role.
- Reproduction steps.
- Scope/impact: who or what was affected.
- Workarounds already attempted.
- Relevant files, commits, tickets, emails, or documentation.

## Analysis Method

1. Establish the timeline.
2. Identify the failure point.
3. Separate symptoms from causes.
4. List evidence-backed facts.
5. Generate plausible hypotheses.
6. Test hypotheses against the evidence.
7. Identify immediate cause and root cause.
8. Identify contributing factors.
9. Recommend containment, correction, and prevention.
10. List open questions and follow-up data needed.

Use a 5-Whys style analysis when useful, but do not force it if the issue is better explained with a timeline or causal chain.

## Output Format

Use this structure by default:

```markdown
# RCA: {Issue Title}

## Executive Summary

Briefly state what happened, likely root cause, impact, and recommended next step.

## What Happened

Describe the issue in plain language.

## Expected vs Actual Behavior

| Expected | Actual |
|---|---|
|  |  |

## Timeline

| Time/Date | Event | Evidence |
|---|---|---|
|  |  |  |

## Impact

Describe affected users, systems, data, cost, time, or downstream processes.

## Evidence

- Fact:
- Source/evidence:

## Root Cause

State the most likely root cause and confidence level.

## Contributing Factors

- 

## Corrective Actions

| Action | Owner | Priority | Status |
|---|---|---|---|
|  |  |  |  |

## Preventive Actions

| Action | Owner | Priority | Status |
|---|---|---|---|
|  |  |  |  |

## Open Questions / Follow-ups

- 
```

## Follow-up Integration

If unresolved information is needed to complete the RCA, create or update `follow-ups.md` using the normal follow-up rules.

Use follow-ups for missing logs, unknown dates, unconfirmed ownership, unresolved outcomes, or information that materially affects the RCA's accuracy.

## Storage Guidance

If the RCA is durable and should be saved, store it under the most relevant subject folder. If the subject does not exist, create a subject folder only when justified by the repository rules.

Name RCA files using a durable, searchable name such as:

- `YYYY-MM-DD-rca-{short-issue-name}.md`
- `{system-or-project}/rcas/YYYY-MM-DD-{short-issue-name}.md`

Follow the subject folder README. If the folder structure needs to change to accommodate recurring RCAs, update the README in the same commit.

## Hallucination Guard

Do not invent causes, dates, logs, owners, or impacts. If evidence is missing, state the gap and classify conclusions as hypotheses.
