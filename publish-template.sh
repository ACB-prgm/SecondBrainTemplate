#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel)"
SOURCE_DIR="$REPO_ROOT/SecondBrain-Template"
PUBLISH_BRANCH="main"
WORKTREE_DIR="$REPO_ROOT/.publish-main"
REMOTE_URL="$(git config --get remote.origin.url)"

cleanup() {
	if [[ -d "$WORKTREE_DIR" ]]; then
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
git fetch --no-write-fetch-head origin

echo "Cloning $PUBLISH_BRANCH into temporary publish directory..."
git clone --branch "$PUBLISH_BRANCH" --single-branch "$REMOTE_URL" "$WORKTREE_DIR"

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
