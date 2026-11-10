---
description: Record an idea outside the current topic and plan a meeting for it
argument-hint: <idea>
---

The owner raises an idea outside the current topic: "$ARGUMENTS". Record it and plan it; don't discuss it in this session. The session's bee stays the same (`${CLAUDE_PLUGIN_ROOT}/dance/meetings.md`).

1. If no idea was given, ask for it and stop.
2. Keep the idea in the owner's words. Add one short line of context from this session only if the idea can't be understood without it.
3. Name who should take part: the bee that should run it, and any other bees, Symbionts or Flowers (`${CLAUDE_PLUGIN_ROOT}/colony/roster.yaml`, `${CLAUDE_PLUGIN_ROOT}/symbionts/`). Say whether it is an org, project or training topic.
4. Say what you will write, then write it:
   - If an open meeting of the same type fits, add the idea to its agenda as a new item, marked as raised by the owner with the date, and add its participants.
   - Otherwise create a new meeting page from `${CLAUDE_PLUGIN_ROOT}/wax/confluence-meeting.html`, under *Meetings*, titled `Not scheduled — <Org | Project | Training> — <topic>`, with the labels from `${CLAUDE_PLUGIN_ROOT}/wax/README.md`. Fill in "Run by", the owner's words under "Why now", and an agenda that only names the questions to decide.
5. Set no time and create no calendar event. Ask the owner when it should be; record a time only from their explicit answer.
6. If Confluence can't be reached, say the idea is not recorded yet and show the text, so it isn't lost.
7. Go back to the current topic.
