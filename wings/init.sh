#!/bin/sh
# Connects the agents to the project that holds this clone and creates its drafts folder.
# Safe to run again: it only adds what is missing and never overwrites a file.
set -eu

. "$(dirname "$0")/common.sh"

add_ignore() {
	file="$project/.gitignore"
	touch "$file"
	if tr -d '\r' <"$file" | grep -qxF "$1"; then
		return
	fi
	if [ -s "$file" ] && [ -n "$(tail -c 1 "$file")" ]; then
		echo >>"$file"
	fi
	echo "$1" >>"$file"
	say "added $1 to .gitignore"
}

# Project content stays: hive only appends its own marked block.
add_block() {
	file="$project/$1"
	touch "$file"
	if grep -qF '<!-- hive:start -->' "$file"; then
		return
	fi
	if [ -s "$file" ]; then
		echo >>"$file"
	fi
	{
		echo '<!-- hive:start -->'
		cat
		echo '<!-- hive:end -->'
	} >>"$file"
	say "added the hive block to $1"
}

check_no_api_keys
check_project
check_registered_clone
command -v codex >/dev/null 2>&1 || say "warning: Codex is not on PATH, so Codex bees can't be dispatched yet."

add_ignore "$hive_name/"
add_ignore "nectar/"
add_ignore ".claude/settings.local.json"

mkdir -p "$project/nectar"

add_block AGENTS.md <<EOF
## hive

This project is run by hive. Read \`$hive_name/README.md\` first.

- The team: \`$hive_name/colony/\`
- Rules for every role: \`$hive_name/instinct/\`
- How work flows: \`$hive_name/dance/\`
- Who works on this project: \`docs/hive-profile.yaml\`
- Working drafts: \`nectar/\`, never committed
EOF

add_block CLAUDE.md <<EOF
@AGENTS.md
EOF

if [ ! -d "$project/docs" ]; then
	say "warning: no docs/ found. Every project has its own docs repo (H-0011); creating a plain folder for now."
	mkdir -p "$project/docs"
fi

profile="$project/docs/hive-profile.yaml"
if [ ! -e "$profile" ]; then
	cat >"$profile" <<EOF
# Who works on this project. Nicknames come from $hive_name/colony/roster.yaml.
project: '$(basename "$project" | sed "s/'/''/g")'
bees: []
symbionts: []
EOF
	say "created docs/hive-profile.yaml"
fi

# Local scope: Claude records the absolute path of this clone, which belongs to this machine only.
cd "$project"
claude plugin marketplace add "./$hive_name" --scope local
claude plugin install hive@higuma-soft --scope local
grep -q '"hive@higuma-soft": true' .claude/settings.local.json ||
	fail "the plugin was not enabled for this project."

say "done. The agents are connected to $(basename "$project")."
