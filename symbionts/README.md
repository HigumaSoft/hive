# Symbionts

The pool of Symbionts: outside experts called in for one task. They aren't part of the hive, so they aren't in `colony/`. They stay here so they can be reused.

## Where they live

- **Here:** Symbionts any project can use, such as a Confluence information architect.
- **In a project's docs repo, next to the Meadow:** a Symbiont that holds one product's content, such as a historian for one product's names. hive is public and holds no product content.

## How one comes in

1. A bee that can't do a piece of work asks Queen for a worker (`colony/README.md`).
2. Queen looks in this pool and in the project's. If one fits, she sends it.
3. If none fits, Queen drafts a brief and the owner gives the OK (`instinct/conduct.md`). An org Symbiont lands here through a pull request, a project one in the project's docs repo.

## Before the meeting

A Symbiont is never found missing in the meeting that needs it. When a bee plans a meeting with a Symbiont that isn't in the pool, it also plans a Queen meeting to create it, before that meeting and at a higher priority, and asks the owner for its time. "Ready" checks the pool too: a meeting whose Symbiont is missing isn't started, and the Queen meeting is offered instead (`dance/ready.md`). If a meeting finds it needs a Symbiont midway, that agenda item moves to a new meeting, prepared the same way.

## How one is called

The bee starts a separate agent and gives it only the brief and the question. The agent reads what it needs and changes nothing. The call has two steps (H-0089):

1. **Questions first.** The Symbiont returns its questions, and any assumption its answer would need that isn't under "Relies on". The bee brings them to the owner.
2. **Then the research.** With the owner's answers, the Symbiont researches and gives its advice. A fact the owner newly confirmed goes into the brief's "Relies on", with the date.

The bee stays responsible for the result and vets the advice before it reaches the owner. The meeting page or ticket notes that the Symbiont advised.

## The brief

One file per Symbiont, named after it, with these parts:

| Part | Holds |
|---|---|
| Header | Symbiont · org or project · advisory only · engine |
| Use when / not when | The questions it's for, and the ones it isn't |
| Knows | Its field, specifically |
| Relies on | The facts its advice rests on, confirmed by the owner, with the date. A private fact, such as which plan the org is on, is only named here: its value lives in Confluence and the calling bee passes it in |
| Asks first | That it returns its questions and unlisted assumptions before researching |
| Gives | Two to four options, what the field does, trade-offs, a recommendation; sources with dates and confidence; what it couldn't check |
| At the edge | What it doesn't know, and who should answer instead |
| Won't do | Edit, decide, or plan beyond the question |
| Known gaps | The owner's corrections, dated |
| Record | When it was created, by whom, for which meeting, and who has used it |
