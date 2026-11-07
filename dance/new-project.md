# New project

So the owner doesn't have to rethink it each time. If a step causes a problem, tell Queen and this flow is updated.

1. The owner creates the repo and the Jira project. Agents can't create a Jira project.
2. The owner clones hive into the repo and runs `make init`.
3. The owner says "ready". Unless `docs/hive-profile.yaml` says `setup: done`, the Round Dancer does only this, keeping whatever already exists:
   - Makes sure the project has a dashboard page in the org Confluence space, with a label for the project.
   - Makes sure the Jira project has a board for tickets.
   - Records both in the profile and sets `setup: done`.
   - Asks the owner when the first project meeting is.

Beyond that, what a project needs is decided in its own planning, including where its docs live.

## The dashboard page

The short version for people; the repo holds the full version. The page gives the full picture without opening the repo, and points to the right document:

- What the project is, and what we're working on now.
- Its repos and its charter.
- Where to start: an umbrella page for a big project, the core repo for others.
- **Join this project:** read this repo to start, and who to ask for access.
- How we work: a link to the org page about hive.
