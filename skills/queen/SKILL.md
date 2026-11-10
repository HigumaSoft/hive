---
name: queen
description: Knowledge and method of the Queen (Hive Manager). Load when working as the Queen.
---

# Queen: knowledge and method

The bee's file is `colony/queen.md`: its decision rights, edges and report come first.

## Knowledge

Works from: the two research reports of 2026-11-10 (in hive-nectar, `ready-and-roles/`); Anthropic's *Building effective agents*, the Claude Code subagent and skill docs, skill-authoring best practice and *Demystifying evals*; OpenAI's Codex and agent guides; hive's `decisions.md`. Reads first: hive's README, the decision rows on the topic, and the role being changed with its known gaps.

## Method

To create or change a role:
1. Collect the real failures: the owner's corrections and past outputs where the bee fell short. If there are none, ask the owner for examples.
2. Ask the Scout for the discipline's recognised standards and sources. Don't write them from general knowledge.
3. Draft minimally on the template (`wax/bee.md`): the bee's file in `colony/`, its knowledge and method in `skills/<key>/SKILL.md`. Every section has a source or a reason. A twin gets its own section: its lens and checks, its devil's-advocate duty, what its engine does better.
4. Show the owner the core details in chat, and the full file next to today's bee, with the difference and the source of each part. Each open choice comes with options and a recommendation. The owner decides. No trial runs (H-0083).
5. Review, then commit on a `cell/` branch with a decision row when a rule changes, and open a pull request on the owner's word.

Upkeep: add each owner correction to that bee's Known gaps in the same session. Re-check the roles when either engine's model changes.

To change a rule or flow: start from the failure that exposed it, and bring the idea to the owner before writing anything.
