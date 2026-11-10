# Review

Each round has its own purpose, and the outcome decides where the work goes next.

| Round | Question | Possible results |
|---|---|---|
| **1. Idea** | Is this the right approach, and is there a better one? | Always goes to the owner, who keeps the vision or changes it. Then Round 2 |
| **2. Gaps** | What's missing, risky or broken? | **Clean:** done. **Fix:** the author fixes it, then Round 3. In planning work, a finding that adds a point goes to the owner first (below) |
| **3. Confirm** | Are those fixes right, and did they break anything? | **Clean:** done. **Not clean:** goes to the owner |

## Which round to start from

- Plans start at Round 1.
- Code built from an approved plan starts at Round 2, because its idea was already checked. So do small fixes. Small fixes such as typos, links and formatting are not reviewed one by one: they are collected and reviewed together in one light round, for example with other work in the same pull request. No bee is the only reviewer of its own change (H-0097).
- A design change goes back to Round 1.

## What a reviewer gets

A direction brief: the owner's goals, the decisions so far, the owner's key words quoted as they said them, and the open questions, plus access to the conversation when it's needed. The reviewer writes its findings against the work and the brief before it reads the author's reasoning. The brief is updated after each owner decision.

## The Idea round

The owner's vision is always an input. The reviewer evaluates it honestly and doesn't agree by default. The review states:

1. How the field usually solves this.
2. Any real alternative, argued seriously.
3. How the vision and that alternative compare, tradeoff by tradeoff.
4. If the vision holds, what was compared to reach that view.

In a planning session the Idea review is given by the devil's advocate (`meetings.md`). The reviewer never invents an objection, and may say it found no real alternative. The owner decides and can overrule; a decision row in the right log (`instinct/conduct.md`) records the option that was not taken.

## Planning work: the owner steers

In planning work (plans, designs, rules, roles), the owner keeps control of direction:

- The reviewer tags each finding **adds a point** (a missing step, a new point, a different direction, a choice that is the owner's) or **deepens a point** (more detail on what is already there). The reviewer tags it, not the author.
- A finding that adds a point reaches the owner as a TL;DR in chat, shown by the session's lead bee as the review lands, before the author changes anything. The owner decides what is acted on.
- A finding that deepens a point goes back to the author, and the report lists it with what was done.
- A finding dismissed with a reason stays visible with that reason.
- When the owner isn't in a session, planning work waits for them rather than going on.

In work built from an approved plan, the rounds run between bees as above. The report lists each finding and what was done about it, never only how many rounds ran.

## Helpers

Helpers aren't a separate round. In Round 1 the reviewer can ask Queen for a worker, works with the Symbiont that comes, and stays responsible for the verdict. The rules for Symbionts and Flowers are in `instinct/conduct.md`.

- A plan needs knowledge the reviewer lacks: a Symbiont advises.
- A plan affects users: the Forager brings the user evidence, by the method it chose for the project and stage; Flowers only if that method uses them (H-0095).
- How the field solves it is unclear: the Scout researches it, with a Bumble Scout on contested questions.
- A plan is big or risky: the Hornet attacks it (`colony/hornet.md` says when).
