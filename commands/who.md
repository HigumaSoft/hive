---
description: Find a bee by role or nickname
argument-hint: <role or nickname>
---

Read `${CLAUDE_PLUGIN_ROOT}/colony/roster.yaml`. Find who matches "$ARGUMENTS", by nickname, title or caste. For each match, give the nickname, title, caste, engine and twin, plus one line from its job description in `${CLAUDE_PLUGIN_ROOT}/colony/<key>.md`.

If nothing was asked, list the whole team as a table. If nothing matches, say so and suggest the closest bee.
