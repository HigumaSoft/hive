# New project

So the owner doesn't have to rethink it each time. If a step causes a problem, tell Queen and this flow is updated.

1. The owner creates the repo and the Jira project. Agents can't create a Jira project.
2. The owner clones hive into the repo and runs `make init`.
3. The owner says "ready". Unless `docs/hive-profile.yaml` says `setup: done`, the Round Dancer does only this, keeping whatever already exists:
   - Asks the owner what it can't find: the project in a sentence or two, and the Jira project key.
   - Makes sure the project has a dashboard page under *Projects* in the org Confluence space, named "Higuma Soft", copied from *Project dashboard template*. Its label is named by the rule on *How we use Confluence*. While there is no rule, it adds no label and flags it.
   - Makes sure the Jira project has a board for tickets.
   - Fills the project profile (below), asking the owner for what it can't find, and sets `setup: done`.
   - Asks the owner when the first project meeting is.

Beyond that, what a project needs is decided in its own planning.

## The project profile

`docs/hive-profile.yaml` tells hive where the project's things are. `make init` creates it with empty fields, and setup fills them.

| Field | Holds |
|---|---|
| `dashboard` | The link to the project's dashboard page |
| `jira` | The Jira project key |
| `docs` | Where the docs live: `folder` for a `docs/` folder in this repo, or the name of the docs repo, such as `HigumaSoft/<project>-docs`. If the project hasn't decided, `folder`, and planning can change it |
| `conventions` | Where the project's own conventions are written, such as `docs/README.md#conventions`. If there are none, setup adds a *Conventions* section to `docs/README.md` from `wax/conventions.md` |
| `bees`, `symbionts` | Who works on the project |

## The dashboard page

The short version for people; the repo holds the full version. The page gives the full picture without opening the repo, and points to the right document:

- What the project is, and what we're working on now.
- Its repos and its charter.
- Where to start: an umbrella page for a big project, the core repo for others.
- **Join this project:** read this repo to start, and who to ask for access.
- How we work: a link to the org page about hive.
