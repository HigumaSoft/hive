# hive

Higuma Soft's office of AI agents: the shared team, rules and working methods that every Higuma Soft project uses.

**Status:** being designed. Nothing here is in use yet.

## Layout

Folders carry bee names; this table gives their plain meaning.

| Path | Plain name | Holds |
|---|---|---|
| `colony/` | Team | The staff: who works here and what each role does |
| `instinct/` | Handbook | Rules every role follows |
| `dance/` | Processes | How work flows, and which meetings exist |
| `wax/` | Templates | Document templates and Confluence page templates |
| `scouts/` | Plans | hive's own plans |
| `wings/` | Scripts | `make init`, `make update`, the session check and Codex dispatch |
| `commands/` | Commands | `/hive:ready` and `/hive:who` |
| `hooks/` | Hooks | The check at every session start |
| `decisions.md` | Decisions | The decision log |

## Use it in a project

You need Git, make, Claude Code and Codex, and the project folder's name must use Latin letters or digits. From the project's root:

```sh
git clone https://github.com/HigumaSoft/hive
cd hive
make init
```

`make init` works on the parent folder. It connects the agents, creates the drafts folder `nectar/` and adds the project profile `docs/hive-profile.yaml`. It never overwrites a file and makes no commits, so you can review what it added.

`make update` brings this clone up to date and refreshes the plugin. Each project uses its own clone, so projects can stay on different versions. After either command, restart Claude Code or run `/reload-plugins`.

## Hive terms

| Term | Means |
|---|---|
| Beowulf | The owner: "bee-wolf", a bear in disguise, here for the honey |
| Queen | The agent that manages hive |
| Bees | Agents, the true citizens of the hive |
| Caste | A department of bees |
| Bumble | The Codex twin of a pair |
| Symbionts | Vendors, called in when needed |
| Flowers | Personas, simulated users outside the hive |
| Meadow | The pool of personas |
| Nectar | A project's raw working notes, kept in the project |
| Honey | Finished, approved work, and the default branch |
| Cell | One piece of work; work branches are `cell/<topic>` |

## Nothing private

This repository is public. It holds no secrets, no account, site or calendar IDs, no product content and no costs. Those stay in a local config file or in the project's own docs repo.
