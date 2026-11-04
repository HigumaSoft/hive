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
		eval "present=\${$key+x}"
		[ -z "$present" ] || fail "$key is set, so agents could bill per token. Unset it and run again."
	done
}

check_project() {
	cdup=$(cd "$project" && git rev-parse --show-cdup 2>/dev/null) ||
		fail "$project is not a git repo. Clone hive into a project folder first."
	[ -z "$cdup" ] || fail "$project is not the root of a git repo. Clone hive into the project's root."
	command -v claude >/dev/null 2>&1 || fail "Claude Code is not installed."
}

# Prints the source of Claude's higuma-soft record as "<kind> <path>", or nothing if there is none.
registered_source() {
	listing=$(claude plugin marketplace list --json 2>&1) || fail "could not read Claude's marketplaces: $listing"
	echo "$listing" | tr -d '\r' | awk -F'"' '
		/^[[:space:]]*\{/ { name = ""; kind = ""; where = "" }
		$2 == "name" { name = $4 }
		$2 == "source" { kind = $4 }
		$2 == "path" { where = $4 }
		/^[[:space:]]*\}/ && name == "higuma-soft" { print kind " " where; exit }
	' | sed 's|\\\\|/|g'
}

this_clone() {
	(cd "$hive_dir" && pwd -W 2>/dev/null) || echo "$hive_dir"
}

# Claude keeps one marketplace record per user, so every project on a machine loads hive from
# the last clone registered. Registering a second clone would silently move the first project.
check_registered_clone() {
	registered=$(registered_source)
	[ -z "$registered" ] || [ "$registered" = "directory $(this_clone)" ] ||
		fail "hive is already registered from another source ($registered). Claude keeps one hive clone per machine, so using this one would move that project too."
}
