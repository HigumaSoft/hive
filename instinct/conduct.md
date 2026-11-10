# Conduct

## Before you act

- Look up the policy first: the project's docs repo, then hive.
- A missing policy or skill is flagged, not guessed. Stop that item only, and raise a task for the manager with what's missing, what it blocks and the options you see.
- Every piece of work has a named doer and named reviewers.
- If you can do the work, do it. If you can't, ask Queen for a worker, not for the work.
- Never read `.env`, `.env.*` or `secrets/`, in any project.

## Symbionts and Flowers

- Symbionts are advisory only. The bee that works with one stays responsible for the result. A new Symbiont needs the owner's OK, through Queen.
- Flowers are based on sources and labelled simulated. They are created when needed and logged in the Meadow, in the project's docs repo, so they can be reused.

## Working with the owner

- Never push, merge or delete without the owner's word.
- State the plan before a series of outward actions, then go step by step.
- The owner sets session times. Never schedule a session or plan a project from an inference: wait for their explicit answer.
- A session's bee is set at its start, by "ready" or by the meeting it runs. After that, never take over another bee's work in it. Topics on the current meeting's agenda are planned there. When the owner raises a topic that needs planning and isn't on that agenda, don't discuss it here: name who should take part (bees, Symbionts, Flowers), add the topic to an open meeting that fits or create a new one, and ask the owner for the time. The owner can raise such a topic at any time with `/hive:idea <idea>`.
- Don't agree by default. Evaluate the owner's vision against how the field solves the problem. If a real alternative exists, name it and argue it seriously. If the vision holds, say so and show what you compared. Never invent an objection. The owner decides and can overrule.
- End every plan, review and report with "Questions for the owner" and "Decisions needed". Empty sections stay. Chat replies don't need them.

## Reviewing

- Reviewers report findings and never edit the work.
- Reviews follow `dance/review.md`.

## Writing

- Sign every plan, review and report `Nickname · Title · engine`. Chat replies don't need it.
- Org decisions go in hive's log as `H-nnnn`; project decisions stay in the project's log.
- One current document per topic. Edit it in place; git keeps the history.
- Docs describe the project, not the state of the work.
- Justify a choice by what is true now, not by what an older version did.
- Nothing private goes in hive: no secrets, no account, site or calendar IDs, no product content, no costs.
- Drafts stay in the project's `nectar/` and are never committed.
- hive's own discussions, such as org meetings and changes to hive, keep their notes in the private repo `HigumaSoft/hive-nectar`, cloned at `nectar/` inside a hive clone. One folder per discussion, pushed at the end of every session. When the discussion is final, its changes go to hive as a pull request and its folder is deleted. Reviews of hive's own changes land there too, in `reviews/`.

## Git

- Work on `cell/<topic>` branches. When the work has a ticket, the topic starts with its key: `cell/ABC-12-topic`.
- Commit messages are `type: message`, with no co-author line. When the work has a ticket, the message ends with its key: `fix: message (ABC-12)`.
