# Meetings

## Three types

| Type | What for | Who | Can it be dropped? |
|---|---|---|---|
| **Org** | Org-level decisions, flow updates, Queen meetings | Owner, Waggle Dancer or Queen | No |
| **Project** | Planning a project, with bees, Symbionts or people | Owner, Round Dancer, whoever the agenda names | No |
| **Training** | Training and mentoring, can be individual | Owner or a person, Nurse, a Symbiont | Yes |

The calendar shows every event's type and, for a project meeting, its project. Meetings don't mix: each has its own agenda and its own session. Org meetings can be created from any repo. At "ready", due meetings come in order of priority, date and type, and "ready" stops at the first (`ready.md`).

## Every meeting

- Has an agenda in Confluence, linked from its calendar event.
- Names the bee that runs it under "Run by". A focused planning session, such as design, architecture or product, is run by the bee whose field it is; the Round Dancer prepares it, records it and staffs it.
- Ends with deliverables, or is prolonged to another session.
- For planning, the deliverable is a decision in the docs, hive's or the project's. Its core points and a link then go on the Confluence page.
- Its page works as a log: what was planned, and what came of it.
- Has every Symbiont it needs in the pool before it starts. When one is missing, the bee planning the meeting also plans a Queen meeting to create it, before it and at a higher priority (`symbionts/README.md`).

The owner sets session times. Never schedule a session without their explicit answer.

## Planning sessions

The bee that runs a planning session is its lead, and the only bee that talks to the owner live. It frames each item as a decision, brings two to four real options with a recommendation, and stops for the owner's choice. In the first round a devil's advocate challenges the lead's plan: the lead's twin when it has one, otherwise a specialist from the topic's field on the other engine. It forms its view before reading the lead's reasoning, brings the strongest real alternative by its own field's criteria, and may say it found none. Reviews of planning work reach the owner as `review.md` says.

## Org review

Once a quarter an org review is due, first a quarter after its rule (`ready.md`). The Waggle Dancer runs it with the Storer, from a fixed list of inputs (`colony/waggle-dancer.md`): overdue pages, short Confluence pages that no longer match their full version, rules and flows that real work has outgrown, open flags and placeholders, the Scent Guard's findings, and subscriptions. The owner sets the time.

## One meeting, one session

To start a meeting, open a new session in the IDE and say "ready": it offers what is due (`ready.md`). Pasting the link to the meeting's page also works. An org meeting can start from any project folder that has hive; the bee under "Run by" runs it.

A session's bee is set at its start, by "ready" or by the meeting it runs, and never changes after that. A topic the owner raises that needs planning and isn't on the current meeting's agenda becomes a meeting too: the bee names who should take part, adds the topic to an open meeting that fits or creates a new one, and doesn't discuss it in the current session. The owner can do this at any time with `/hive:idea`.

A meeting can plan a new one, for example when design needs another bee or a Symbiont. That work isn't done in the current session: it gets its own meeting, with its own agenda. After a meeting, every new meeting is a new session.

If the owner asks for it in the same session, say so plainly: open a new session in the IDE.

Open items that need no talk become tickets (`staffing.md`).
