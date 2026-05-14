# GitHub Tool Workflows

SecondBrain uses GitHub's Git Database API rather than simple repository contents writes. This allows raw text reads, atomic multi-file updates, and explicit commit history.

## Read File Flow

1. Get branch ref for `SecondBrain`.
2. Get commit metadata for the branch commit SHA.
3. Get the recursive tree using the commit tree SHA.
4. Locate the file path in the tree.
5. Fetch the blob with the raw media type.

## Write or Update File Flow

1. Get branch ref.
2. Get current commit.
3. Get current tree SHA.
4. Create a new tree using `base_tree` and tree entries with direct `content` fields.
5. Create a new commit with the new tree and current commit as parent.
6. Update the branch ref to the new commit with `force: false`.

The write is complete only after step 6 succeeds.

## Template Sync Flow

When syncing managed template files from `ACB-prgm/SecondBrainTemplate` into the private `SecondBrain` repo, do not copy template blob SHAs into the target repo tree.

Template blob SHAs are references from the template repository context and must not be reused as blob references in the private target repo.

Correct sync flow:

1. Read the fixed template main branch ref.
2. Read the template commit and recursive tree.
3. For each managed template file that must be copied, fetch the template blob as raw content.
4. Write that raw content into `SecondBrain` using tree entries with direct `content` fields.
5. Update `.secondbrain/TEMPLATE_STATE.json` with the template main branch HEAD SHA.
6. Create a new commit in `SecondBrain`.
7. Update the `SecondBrain` branch ref with `force: false`.

Never create a `SecondBrain` tree entry using a blob SHA from `SecondBrainTemplate`. This can fail with `422: tree.sha ... is not a valid blob` and may prevent template sync from completing.

## Delete File Flow

Use the same write flow, but create a tree entry with:

```json
{
	"path": "path/to/file.md",
	"mode": "100644",
	"type": "blob",
	"sha": null
}
```

## Create Directory Flow

GitHub has no true empty directories. Create a directory by creating a file inside it, usually `README.md` or `.gitkeep`.

## Delete Directory Flow

1. Read the recursive tree.
2. Find all files whose paths start with the directory prefix.
3. Create a new tree with `sha: null` for each matched path.
4. Commit and update the branch ref.

## Multi-File Atomic Updates

When storing content, update related files in one commit when possible. Example:

- new subject README
- canonical subject note
- `manifest.md`
- `index/files.json`
- `index/subjects.json`
- `index/entities.json`
- `index/tags.json`
- `index/aliases.json`

## Conflict Handling

If branch ref update returns a conflict:

1. Re-read branch ref, commit, and tree.
2. Reapply intended changes to the new base tree.
3. Try one more non-forced update.
4. If conflict persists, stop and report the conflict.

Never force-update the branch unless the user explicitly instructs it and understands the risk.
