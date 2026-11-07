#!/bin/sh
# One-off for Aromatheca: removes the iteration-1 workflow, ready for `make init`.
# Prints the exact list and changes nothing until the owner types "yes". Makes no commits.
# Never touches .codex/ or .claude/.
#
# Usage, from inside hive/: sh wings/retire-iteration-1.sh
set -eu

. "$(dirname "$0")/common.sh"

branch=cell/retire-iteration-1

check_no_api_keys
check_project

cd "$project"
[ -d docs/ai ] || fail "there is no docs/ai here, so there is nothing to retire."
[ -z "$(git status --porcelain)" ] || fail "the project repo has uncommitted changes."
[ -z "$(cd docs && git status --porcelain)" ] || fail "the docs repo has uncommitted changes."
[ ! -e nectar ] || fail "nectar/ already exists, so drafts/ can't be renamed."
if git rev-parse --verify -q "refs/heads/$branch" >/dev/null; then
	fail "the branch $branch already exists in the project repo."
fi
if (cd docs && git rev-parse --verify -q "refs/heads/$branch" >/dev/null); then
	fail "the branch $branch already exists in the docs repo."
fi

cat <<EOF

This removes the iteration-1 workflow, on a new branch $branch in both repos.

Deleted (git history keeps them):
  AGENTS.md
  CLAUDE.md
  docs/AGENTS.md
  docs/CLAUDE.md
  docs/ai/

Renamed (local, not in git):
  drafts/ to nectar/

Not touched: .codex/, .claude/, docs/planning/ and every other document.

Check first: docs/AGENTS.md also holds Aromatheca's own facts, such as what the project is and the repo map.
Move what you still need to the docs README or the Confluence dashboard before going on.

These files still mention what is being removed, so update them afterwards:
EOF
(cd docs && git grep -l -E 'ai/(pipeline|roles|conventions|access|prompts|templates|scripts)|AGENTS\.md' -- . ':!ai' ':!AGENTS.md' ':!CLAUDE.md' ':!planning/plans' || true) | sed 's|^|  docs/|'
git grep -l -E 'docs/AGENTS|docs/ai' -- . ':!AGENTS.md' ':!CLAUDE.md' | sed 's|^|  |' || true

printf '\nType yes to go on: '
read -r answer || answer=
if [ "$answer" != yes ]; then
	say "stopped. Nothing was changed."
	exit 0
fi

# Both repos move to the branch before anything is deleted.
git switch -q -c "$branch"
(cd docs && git switch -q -c "$branch")
git rm -q AGENTS.md CLAUDE.md
(cd docs && git rm -rq ai AGENTS.md CLAUDE.md)
if [ -d drafts ]; then
	mv drafts nectar
fi

say "done. Nothing is committed. Now run make init in hive/, review the changes in both repos, and commit them."
