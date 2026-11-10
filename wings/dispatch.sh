#!/bin/sh
# Sends work to a bee on Codex. Run it from the repo, on the work branch.
# A review lands in nectar/reviews/, a work report in nectar/work/: the project's nectar/,
# or hive's private notes clone at hive/nectar/ when the work is on hive itself (H-0073).
#
# Usage: sh hive/wings/dispatch.sh <role key> <idea|gaps|confirm|do> "<what the work must do>"
#
# Exit codes: 0 done; 1 error; 2 no output written; 4 quota or rate limit, so the work pauses (H-0015).
set -eu

. "$(dirname "$0")/common.sh"

[ "$#" -eq 3 ] || fail 'usage: dispatch.sh <role key> <idea|gaps|confirm|do> "<what the work must do>"'
role=$1
kind=$2
context=$3

job="$hive_dir/colony/$role.md"
[ -f "$job" ] || fail "no bee with the key $role."
case "$kind" in
idea | gaps | confirm) folder=reviews ;;
do) folder=work ;;
*) fail "the kind must be idea, gaps, confirm or do." ;;
esac

check_no_api_keys
command -v codex >/dev/null 2>&1 || fail "Codex is not on PATH."

branch=$(git rev-parse --abbrev-ref HEAD) || fail "run this from the repo."

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
[ "$branch" != "$base" ] || fail "you are on $base. Check out the work branch."

top=$(git rev-parse --show-toplevel) || fail "run this from the repo."
notes="$project/nectar"
if [ "$(cd "$top" && pwd)" = "$hive_dir" ]; then
	if [ -d "$hive_dir/nectar/.git" ]; then
		notes="$hive_dir/nectar"
	else
		say "warning: hive's notes clone isn't at $hive_name/nectar/, so this goes to the project's nectar/."
	fi
fi

mkdir -p "$notes/$folder"
notes_native=$(cd "$notes" && pwd -W 2>/dev/null || pwd)

# Earlier output is kept: a repeat gets the next free name.
first="$(echo "$branch" | tr '/' '-').$role.$kind"
name=$first
n=2
while [ -e "$notes/$folder/$name.md" ]; do
	name="$first-$n"
	n=$((n + 1))
done
out="$notes/$folder/$name.md"
log="$notes/$folder/$name.log"
prompt="$notes/$folder/$name.prompt"
out_native="$notes_native/$folder/$name.md"

{
	cat "$job"
	skill="$hive_dir/skills/$role/SKILL.md"
	if [ -f "$skill" ]; then
		echo
		cat "$skill"
	fi
	echo
	cat "$hive_dir/instinct/conduct.md"
	echo
	if [ "$kind" = do ]; then
		cat <<EOF

# Your task

You are the bee described at the top. Do this ticket on the current branch, $branch:

$context

Change only what the ticket needs. Don't commit, push or switch branches: the manager reviews your changes and commits them.

When you finish, write your report in full to $out_native, not only in your chat answer: what you changed, what you tested with the commands and their output, anything done differently, and any questions. When the work is research, the report is the research itself. Sign as codex.
EOF
	else
		cat "$hive_dir/dance/review.md"
		cat <<EOF

# Your task

You are the bee described at the top. Run the **$kind** round of a review of branch $branch: read \`git diff $base...HEAD\` and the files around it.

What the work must do:

$context

Write exactly one file, $out_native, using this template. Edit nothing else, and don't commit. Sign as codex.

EOF
		cat "$hive_dir/wax/review.md"
	fi
} >"$prompt"

say "dispatching $kind to $role on Codex..."
code=0
codex --search exec -c model_reasoning_effort=high -C . -s workspace-write --add-dir "$notes_native" - <"$prompt" >"$log" 2>&1 || code=$?

if grep -qiE 'rate.?limit|usage limit|quota|limit reached' "$log" && [ ! -s "$out" ]; then
	say "Codex hit a limit, so this work pauses. See $log"
	exit 4
fi
[ "$code" -eq 0 ] || fail "Codex stopped with code $code. See $log"
if [ ! -s "$out" ]; then
	say "Codex finished but wrote nothing to $out. See $log"
	exit 2
fi

say "written: $out"
if [ "$folder" = reviews ]; then
	grep -m 1 -F '**Verdict:**' "$out" || say "the review has no verdict line."
fi
