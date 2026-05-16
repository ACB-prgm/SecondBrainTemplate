# Tabular Storage Skill

Use this skill when data is better stored as scalable rows/columns than as prose or small markdown tables.

## Default

GitHub markdown/JSON remains the default SecondBrain storage layer. Use Sheets only when the data is naturally tabular and likely to grow, be filtered/sorted, edited repeatedly, summarized by column, or used in formulas.

## Good Fits

- budgets and transactions
- lab result time series
- inventory
- recurring measurements
- price comparisons
- habit logs
- expenses or mileage
- repeated snapshots or status rows

Keep narrative context, source notes, decisions, summaries, and retrieval metadata in GitHub.

## Spreadsheet Boundary

Prefer one Google Spreadsheet per top-level SecondBrain domain that actually needs tabular storage.

Tabs are individual datasets within that domain.

Do not create one spreadsheet per directory, subtopic, or small table. Reuse an existing domain spreadsheet when the dataset belongs there.

Create a new spreadsheet only when no existing domain spreadsheet fits and the domain is likely to contain multiple related tabular datasets.

## Companion Record

When using Sheets, create or update a companion SecondBrain markdown record with:

- spreadsheet title, ID, and link if available
- domain and related SecondBrain paths
- tab names and purpose
- column schema for each tab
- retrieval aliases/tags
- summary and update notes

The Sheet stores rows. GitHub stores context, schema, source references, and retrieval handles.

## Permission Boundary

Prefer the least broad Google scopes that support the workflow. `drive.file` is preferred for app-created or user-authorized spreadsheet files when sufficient. Broader Sheets/Drive scopes should be added only when needed.

## Confirmation

After creating or updating tabular storage, report the spreadsheet, tab, rows/ranges changed, and related SecondBrain companion path.
