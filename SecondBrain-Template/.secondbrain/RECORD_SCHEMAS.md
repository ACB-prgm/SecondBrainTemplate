# Record Schemas

These schemas are guidance for consistent storage. They do not require every field for every record.

## File Index Entry

```json
{
	"id": "subject.type.slug",
	"title": "Human-readable title",
	"subject": "subject-name",
	"type": "record | source_artifact | summary | index | log | report",
	"path": "subject/path.md",
	"external_url": null,
	"status": "current | archived | draft | superseded",
	"created_utc": "YYYY-MM-DDTHH:MM:SSZ",
	"last_updated_utc": "YYYY-MM-DDTHH:MM:SSZ",
	"summary": "Short retrieval summary",
	"key_facts": [],
	"related_entities": [],
	"tags": [],
	"aliases": [],
	"sensitivity": "normal | sensitive | high",
	"source_of_truth": true
}
```

## Subject Index Entry

```json
{
	"name": "subject-name",
	"path": "subject-name/",
	"purpose": "Short purpose statement",
	"readme_path": "subject-name/README.md",
	"created_utc": "YYYY-MM-DDTHH:MM:SSZ",
	"last_updated_utc": "YYYY-MM-DDTHH:MM:SSZ",
	"canonical_files": [],
	"related_subjects": [],
	"tags": []
}
```

## Entity Entry

```json
{
	"id": "entity.slug",
	"name": "Entity Name",
	"type": "person | organization | property | account | system | vendor | project | other",
	"aliases": [],
	"related_subjects": [],
	"related_files": [],
	"notes": "Short disambiguation note"
}
```

## Append-Only Event Entry

Use markdown for append-only event logs:

```markdown
## YYYY-MM-DD — Event Title

Source: user-entered | email | document | image | PDF | external link  
Related files: ...  
Entities: ...  
Tags: ...

### Original Wording
> Preserve user/source wording when available.

### Extracted Facts
- Fact 1
- Fact 2

### Notes
- Separate interpretation from facts.
```
