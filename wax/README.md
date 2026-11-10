# Wax (templates)

Document templates, and the templates for Confluence pages.

| File | Covers |
|---|---|
| `bee.md` | A bee's file in `colony/`, and its skill in `skills/` |
| `review.md` | The output of every review round |
| `conventions.md` | A project's own conventions, added to its `docs/README.md` at setup when it has none |
| `confluence-dashboard.html` | A project's dashboard page |
| `confluence-charter.html` | A project's charter page |
| `confluence-meeting.html` | A meeting page: org, project or training |

## Confluence pages

These are the only source for Confluence page templates; Confluence itself has none. A bee creates the page with the file's body in Confluence's HTML format, fills in the italic placeholders, and adds the labels in the same step. The rules behind the labels are on *How we use Confluence*.

| Template | Title | Sits under | Labels |
|---|---|---|---|
| Dashboard | The project's name | *Projects* | `type-dashboard`, `project-<repo>` |
| Charter | `<Project> — Charter` | The project's dashboard | `type-charter`, `project-<repo>` |
| Meeting | `YYYY-MM-DD — <Org \| Project \| Training> — <topic>`; a project meeting starts its topic with the project's name | *Meetings* | `type-meeting`; `meeting-org`, `meeting-project` or `meeting-training`; `project-<repo>` for a project meeting |

Values that change (status, date, priority) live in the page's properties table at the top, never in labels: agents can add a label but can't remove one.
