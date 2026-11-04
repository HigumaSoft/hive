#!/bin/sh
# Brings this clone up to date and refreshes the plugin.
set -eu

. "$(dirname "$0")/common.sh"

check_no_api_keys
check_project
check_market_name

cd "$hive_dir"
git pull --ff-only

cd "$project"
claude plugin marketplace update "$market"
claude plugin update "hive@$market" --scope local

say "done. Restart Claude Code to use the new version."
