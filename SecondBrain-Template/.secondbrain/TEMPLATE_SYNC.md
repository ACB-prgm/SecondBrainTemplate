# Template Sync

The public template repo provides operating files and reusable templates. The private `SecondBrain` repo stores user data.

Template-generated repos do not retain an upstream relationship. Sync is performed by comparing the public template branch HEAD SHA with the private repo's recorded `last_synced_template_sha`.

## Template Config

The public template repo contains `.secondbrain/TEMPLATE_CONFIG.json`. It defines:

- template identity
- template branch
- required bootstrap files
- managed paths that may be copied from the template into the private repo

## Template State

The private `SecondBrain` repo must contain `.secondbrain/TEMPLATE_STATE.json`. It is created after bootstrapping the repo from the template and must not be copied from the template.

The state file records:

```json
{
	"template": {
		"owner": "template-owner",
		"repo": "SecondBrain-Template",
		"branch": "main",
		"last_synced_template_sha": "template-head-sha",
		"last_checked_utc": "YYYY-MM-DDTHH:MM:SSZ",
		"last_synced_utc": "YYYY-MM-DDTHH:MM:SSZ"
	}
}
```

## Sync Check

1. Read the template branch ref and get the current template HEAD SHA.
2. Read private repo `.secondbrain/TEMPLATE_STATE.json`.
3. If `last_synced_template_sha` matches current template HEAD SHA, no sync is needed.
4. If different, sync only managed paths from `.secondbrain/TEMPLATE_CONFIG.json.managed_paths`.

## Managed Paths

Only managed paths may be overwritten from the template. User-created subject folders, `.user/` files, entity metadata, and other user routing metadata are user data after repo creation and must not be overwritten by template sync unless explicitly listed in managed paths and the user approves.

## Sync Write

When syncing:

1. Read template raw blob content for each managed path.
2. Write changed managed files into the private repo using one commit.
3. Update `.secondbrain/TEMPLATE_STATE.json` in the same commit with the current template HEAD SHA and timestamps.
4. Update the branch ref.

The sync is complete only after the branch ref update succeeds.
