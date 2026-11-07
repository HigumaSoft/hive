# Staffing

The owner doesn't pick bees. They talk to the Round Dancer or the Forager, and the work item says who works on it.

There are two kinds of work item. Planning happens in **meetings**, with the owner. Implementation and routine happen in **tickets**, which need little conversation. Every open item leaves a meeting as one or the other: another meeting if it needs the owner, a ticket if it doesn't.

- A ticket names its doer and reviewers. A meeting page lists its participants.
- If a work item has no name yet, its manager picks a bee from `colony/roster.yaml` and writes the name on it. The owner can correct it.
- For an evaluation role, the manager sets the engine by balance between the engines.
- A bee on Claude works in the session: read its job description in `colony/`, then work and sign as that bee.
- A bee on Codex is dispatched with `wings/dispatch.sh`: a reviewer for a review round, a doer with `do`. A doer on Codex never commits: the manager reads its changes and its report in `nectar/work/`, then commits.
- A bee that can't do the work asks Queen for a worker.
