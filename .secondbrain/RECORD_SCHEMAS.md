# Record Schemas

These examples are guidance for consistent record metadata. They do not require every field for every record and do not imply a separate global routing file.

## Record Metadata

```json
{
	"id": "subject.type.slug",
	"title": "Human-readable title",
	"subject": "subject-name",
	"type": "record | source_artifact | summary | routing | log | report",
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

## Subject Routing Metadata

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

## Entity Registry

`.user/ENTITIES.json` stores durable user-specific real-world entities that improve retrieval and disambiguation. It is not a general knowledge graph.

Use entities for people, clinicians, organizations, businesses, vendors, properties, accounts, institutions, agencies, and similar recurring user-specific entities.

Do not use entities for medications, diagnoses, conditions, symptoms, procedures, labs, allergies, tags, generic concepts, ordinary subject names, one-off receipts, individual source artifacts, or items that are better represented as records inside a subject folder.

```json
{
	"version": 1,
	"updated_date": "YYYY-MM-DD",
	"entities": [
		{
			"id": "person.example-name",
			"name": "Example Name",
			"type": "person | clinician | organization | business | vendor | employer | school | insurer | government_agency | institution | property | account | service | system | project | other",
			"aliases": [],
			"related_subjects": [],
			"related_files": [],
			"notes": "Short factual disambiguation note. Do not duplicate full records here."
		}
	]
}
```

Entity IDs should be stable lowercase dotted IDs in the form `{type}.{slug}`, such as `person.aaron-bastian`, `clinician.felicia-chee`, or `vendor.home-depot`.

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
