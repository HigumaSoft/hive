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

manifest_text() {
	cat <<EOF
{
  "name": "$market",
  "owner": { "name": "Higuma Soft" },
  "plugins": [
    { "name": "hive", "source": "./$hive_name", "description": "Higuma Soft's office of AI agents" }
  ]
}
EOF
}

check_no_api_keys
check_project
check_market_name

# hive knows exactly what it generates, so anything else is not its file.
manifest="$project/.claude-plugin/marketplace.json"
if [ -e "$manifest" ] && [ "$(cat "$manifest")" != "$(manifest_text)" ]; then
	fail ".claude-plugin/marketplace.json already exists and isn't this clone's. Move it and run again."
fi

command -v codex >/dev/null 2>&1 || say "warning: Codex is not on PATH, so Codex bees can't be dispatched yet."

add_ignore "$hive_name/"
add_ignore "nectar/"
add_ignore ".claude/settings.local.json"
add_ignore ".claude-plugin/"

mkdir -p "$project/nectar"

add_block AGENTS.md <<EOF
## hive

This project is run by hive. Before any work, read and follow \`$hive_name/instinct/conduct.md\` and \`$hive_name/instinct/ai-usage.md\`. When the owner says "ready", run \`/hive:ready\`.

- About hive: \`$hive_name/README.md\`
- The team: \`$hive_name/colony/\`
- How work flows: \`$hive_name/dance/\`
- Where this project's things are, and who works on it: \`docs/hive-profile.yaml\`
- Working drafts: \`nectar/\`, never committed
EOF

add_block CLAUDE.md <<EOF
@AGENTS.md
@$hive_name/instinct/conduct.md
@$hive_name/instinct/ai-usage.md
EOF

add_block README.md <<EOF
## Start here

To work on this project, read this repo, then \`$hive_name/README.md\`. People start from the project's page in the org Confluence space.
EOF

mkdir -p "$project/docs"

profile="$project/docs/hive-profile.yaml"
if [ ! -e "$profile" ]; then
	cat >"$profile" <<EOF
# Where this project's things are and who works on it. "ready" fills the empty fields at setup.
# The fields are explained in $hive_name/dance/new-project.md. Nicknames come from $hive_name/colony/roster.yaml.
project: '$(basename "$project" | sed "s/'/''/g")'
setup: pending
dashboard: ''
jira: ''
docs: ''
conventions: ''
bees: []
symbionts: []
EOF
	say "created docs/hive-profile.yaml"
fi

if [ ! -e "$manifest" ]; then
	mkdir -p "$project/.claude-plugin"
	manifest_text >"$manifest"
	say "created .claude-plugin/marketplace.json"
fi

# Local scope: Claude records the absolute path of this project, which belongs to this machine only.
cd "$project"
claude plugin marketplace add ./ --scope local
claude plugin install "hive@$market" --scope local
grep -qF "\"hive@$market\": true" .claude/settings.local.json ||
	fail "the plugin was not enabled for this project."

say "done. The agents are connected to $(basename "$project")."
