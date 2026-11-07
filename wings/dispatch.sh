#!/bin/sh
# Sends a review to a bee on Codex. Run it from the repo under review, on the branch under review.
# The review is written to the project's nectar/reviews/.
#
# Usage: sh hive/wings/dispatch.sh <role key> <idea|gaps|confirm> "<what the work must do>"
#
# Exit codes: 0 done; 1 error; 2 no review written; 4 quota or rate limit, so the work pauses (H-0015).
set -eu

. "$(dirname "$0")/common.sh"

[ "$#" -eq 3 ] || fail 'usage: dispatch.sh <role key> <idea|gaps|confirm> "<what the work must do>"'
role=$1
round=$2
context=$3

job="$hive_dir/colony/$role.md"
[ -f "$job" ] || fail "no bee with the key $role."
case "$round" in
idea | gaps | confirm) ;;
*) fail "the round must be idea, gaps or confirm." ;;
esac

check_no_api_keys
command -v codex >/dev/null 2>&1 || fail "Codex is not on PATH."

branch=$(git rev-parse --abbrev-ref HEAD) || fail "run this from the repo under review."

base=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null | sed 's|^origin/||' || true)
if [ -z "$base" ]; then
	for name in honey main master; do
		if git rev-parse --verify -q "$name" >/dev/null; then
			base=$name
			break
		fi
	done
fi
[ -n "$base" ] || fail "could not find the default branch."
[ "$branch" != "$base" ] || fail "you are on $base. Check out the branch under review."

mkdir -p "$project/nectar/reviews"
name="$(echo "$branch" | tr '/' '-').$role.$round"
out="$project/nectar/reviews/$name.md"
log="$project/nectar/reviews/$name.log"
prompt="$project/nectar/reviews/$name.prompt"
out_native="$(this_project)/nectar/reviews/$name.md"
rm -f "$out"

{
	cat "$job"
	echo
	cat "$hive_dir/instinct/conduct.md"
	echo
	cat "$hive_dir/dance/review.md"
	cat <<EOF

# Your task

You are the bee described at the top. Run the **$round** round of a review of branch $branch: read \`git diff $base...HEAD\` and the files around it.

What the work must do:

$context

Write exactly one file, $out_native, using this template. Edit nothing else, and don't commit. Sign as codex.

EOF
	cat "$hive_dir/wax/review.md"
} >"$prompt"

say "dispatching the $round round to $role on Codex..."
code=0
codex exec -c model_reasoning_effort=high -C . -s workspace-write --add-dir "$(this_project)/nectar" - <"$prompt" >"$log" 2>&1 || code=$?

if grep -qiE 'rate.?limit|usage limit|quota|limit reached' "$log" && [ ! -s "$out" ]; then
	say "Codex hit a limit, so this work pauses. See $log"
	exit 4
fi
[ "$code" -eq 0 ] || fail "Codex stopped with code $code. See $log"
if [ ! -s "$out" ]; then
	say "Codex finished but wrote no review. See $log"
	exit 2
fi

say "written: nectar/reviews/$name.md"
grep -m 1 -F '**Verdict:**' "$out" || say "the review has no verdict line."
