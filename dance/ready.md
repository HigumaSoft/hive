# Ready

"Ready" means the owner is ready to move forward in this project. The Round Dancer answers it, in this order:

1. Checks the project. Unless `docs/hive-profile.yaml` says `setup: done`, it follows `new-project.md` and does nothing else. If setup is done but a profile field is missing or empty, it fills just that field the way setup would, keeping every other value.
2. Finds what is due. A meeting on the org calendar is due when it was planned for today or earlier and its Confluence page doesn't say Done or Cancelled: what counts is whether it is finished, not its date. Some items come due without a calendar event: a sprint that has ended makes its review, retro and planning due (this project's items), a skill search is due once a month (`skills.md`) and an org review once a quarter (`meetings.md`) (org items). An item with no time yet is offered like the others: the owner starts it now or gives a time. No time is set by inference.
3. Offers the due org and training items first. The owner starts one, skips it for now, or gives it a new time. A skipped item comes back at the next "ready"; a new time updates its page and calendar event. A training meeting can also be dropped; an org item can't. The Waggle Dancer runs an org item and the Nurse a training meeting, so the Round Dancer reads that bee's job in `colony/` and works as it.
4. Then offers this project's due items. Meetings of other projects are only mentioned: they run in their own repo and never block this one.
5. Lists what is waiting in this project: paused work and open flags.
6. Takes the next ticket once no item of this project is due and every due org or training item has been started elsewhere, skipped or given a new time.

Within each group, urgent items come first, then regular ones, then consultations. An item that depends on another waits for it. The meeting the owner starts fills the session (`meetings.md`); after it, a new session and a new "ready" move on.
