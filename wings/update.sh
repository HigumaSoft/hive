#!/bin/sh
# Brings this clone up to date and refreshes the plugin.
set -eu

. "$(dirname "$0")/common.sh"

check_no_api_keys
check_project

git -C "$hive_dir" pull --ff-only

cd "$project"
claude plugin marketplace update higuma-soft
claude plugin update hive@higuma-soft --scope local

say "done. Restart Claude Code to use the new version."
