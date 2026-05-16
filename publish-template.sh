#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
SOURCE_DIR="$REPO_ROOT/SecondBrain-Template"
PUBLISH_BRANCH="main"
WORKTREE_DIR="$REPO_ROOT/.publish-main"

cleanup() {
	if git -C "$REPO_ROOT" worktree list --porcelain | grep -Fxq "worktree $WORKTREE_DIR"; then
		git -C "$REPO_ROOT" worktree remove "$WORKTREE_DIR" --force
	elif [[ -d "$WORKTREE_DIR" ]]; then
		rm -rf "$WORKTREE_DIR"
	fi
}

if [[ ! -d "$SOURCE_DIR" ]]; then
	echo "Source directory not found: $SOURCE_DIR"
	exit 1
fi

cleanup
trap cleanup EXIT

if [[ -n "$(git status --porcelain)" ]]; then
	echo "Working tree has uncommitted changes. Commit or stash them first."
	exit 1
fi

cd "$REPO_ROOT"

echo "Fetching latest remote refs..."
git fetch origin

echo "Creating worktree for $PUBLISH_BRANCH..."
git worktree add "$WORKTREE_DIR" "origin/$PUBLISH_BRANCH"

echo "Clearing publish branch contents..."
find "$WORKTREE_DIR" -mindepth 1 \
	-not -path "$WORKTREE_DIR/.git" \
	-not -name ".git" \
	-exec rm -rf {} +

echo "Copying template files to publish branch root..."
rsync -a --delete \
	--exclude ".git" \
	--exclude ".DS_Store" \
	"$SOURCE_DIR"/ "$WORKTREE_DIR"/

cd "$WORKTREE_DIR"

git add -A

if git diff --cached --quiet; then
	echo "No changes to publish."
	cd "$REPO_ROOT"
	cleanup
	exit 0
fi

COMMIT_MSG="Publish template from dev $(git -C "$REPO_ROOT" rev-parse --short HEAD)"

git commit -m "$COMMIT_MSG"

echo "Pushing to origin/$PUBLISH_BRANCH..."
git push origin "HEAD:$PUBLISH_BRANCH"

cd "$REPO_ROOT"
cleanup

echo "Template published to $PUBLISH_BRANCH."
