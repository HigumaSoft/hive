# Ready

When the owner says "ready" in a repo, the Round Dancer:

1. Checks the project. If `docs/hive-profile.yaml` says `setup: pending`, it follows `new-project.md` and does nothing else.
2. Reads the org calendar for this project's meetings due or overdue. They come first, in order: urgent, then regular, then consultations. A meeting that depends on another waits for it.
3. Tells the owner about any other meeting on the same day: another project, org or training. It doesn't run them here.
4. Lists what is waiting in this project: paused work and open flags.
5. If nothing is due, takes the next ticket.

A sprint that has ended makes its review, retro and planning due. A skill search is due once a month, as an org item (`skills.md`).
