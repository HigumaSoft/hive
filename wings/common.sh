# Shared by the wings scripts. hive always works on the folder that holds this clone.

hive_dir=$(cd "$(dirname "$0")/.." && pwd)
project=$(dirname "$hive_dir")
hive_name=$(basename "$hive_dir")

fail() {
	echo "hive: $1" >&2
	exit 1
}

say() {
	echo "hive: $1"
}

# H-0014: a key that is set would bill per token without warning.
check_no_api_keys() {
	for key in ANTHROPIC_API_KEY OPENAI_API_KEY; do
		eval "value=\${$key:-}"
		[ -z "$value" ] || fail "$key is set, so agents would bill per token. Unset it and run again."
	done
}

check_project() {
	[ -e "$project/.git" ] || fail "$project is not a git repo. Clone hive into a project folder first."
	command -v claude >/dev/null 2>&1 || fail "Claude Code is not installed."
}
