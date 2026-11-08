# Ready

"Ready" means the owner is ready to move forward in this project. The Round Dancer answers it, in this order:

1. Checks the project. Unless `docs/hive-profile.yaml` says `setup: done`, it follows `new-project.md` and does nothing else. If setup is done but a profile field is missing or empty, it fills just that field the way setup would, keeping every other value.
2. Reads the org calendar and finds the meetings that are due. A meeting is due when it was planned for today or earlier and its Confluence page doesn't say Done or Cancelled: what counts is whether it is finished, not its date.
3. Offers the due org and training meetings first. The owner starts one, skips it for now, or gives it a new time. A skipped meeting comes back at the next "ready"; a new time updates its page and calendar event. A training meeting can also be dropped; an org meeting can't. The Waggle Dancer runs an org meeting and the Nurse a training meeting, so the Round Dancer reads that bee's job in `colony/` and works as it.
4. Then offers this project's due meetings. Meetings of other projects are only mentioned: they run in their own repo.
5. Lists what is waiting in this project: paused work and open flags.
6. If no meeting is due, takes the next ticket.

Within each group, urgent meetings come first, then regular ones, then consultations. A meeting that depends on another waits for it. The meeting the owner starts fills the session (`meetings.md`); after it, a new session and a new "ready" move on.

A sprint that has ended makes its review, retro and planning due. As org items, a skill search is due once a month (`skills.md`) and an org review once a quarter (`meetings.md`).
