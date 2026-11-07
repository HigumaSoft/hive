#!/bin/sh
# Runs at every session start. A hook can't stop a session, so it tells the bee to stop instead (H-0014).

for key in ANTHROPIC_API_KEY OPENAI_API_KEY; do
	eval "present=\${$key+x}"
	if [ -n "$present" ]; then
		echo "hive: $key is set, so this session could bill per token. Stop, and tell the owner before doing any work."
	fi
done
exit 0
