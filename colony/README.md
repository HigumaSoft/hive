# Colony (the team)

Who works in the hive. `roster.yaml` lists every bee; each role has one file here, named after its key, and one skill in `skills/<key>/`.

## A bee's file

Every bee is defined on the template in `wax/bee.md` (H-0082). The file in `colony/` holds who the bee is and where it stops: header, when to use it, its role, what it protects, what it owns, its decision rights, what it does at the edge of its area, its report, examples, known gaps and tests. Its knowledge and method sit in `skills/<key>/SKILL.md`, which both engines load when the bee works. A bee's knowledge comes from its discipline's recognised standards, found by the Scout, never from a name or a persona.

Queen creates and changes bees by the method in `colony/queen.md` (H-0083). Each correction the owner gives a bee goes into that bee's Known gaps in the same session.

## How the team works

- **Nicknames.** Bees are called by a nickname from a real hive job, usually `<word> <caste>`. A caste is a department and can hold several roles. The nickname is a label; the role line says the real profession.
- **Pairs.** A main role is a pair. The bee on Claude takes design, hard problems and decisions within the discipline, at raised effort, never max. Its `Bumble` twin on Codex takes routine volume work. Each reviews the other's work. A twin shares its bee's file and has its own section in it: its own lens and checks, its devil's-advocate duty, and what its engine does better. Queen, the Dancers, the Nurse and the Pollen Builder are single bees.
- **Planning sessions.** The bee that runs a session is its lead and the only one that talks to the owner live. A devil's advocate challenges it in the first round: the lead's twin, or a specialist from the topic's field on the other engine (`dance/meetings.md`).
- **Evaluation roles.** Guards, the Hornet and the Scout are set to an engine per piece of work, by balance between the engines. The Scent Guard is the exception: it runs on the other engine from the bee it judges.
- **Level.** Every Claude bee runs on the senior model. A bee's `level` in the roster is its effort for routine steps (H-0088).
- **Signing.** Plans, reviews and reports are signed `Nickname · Title · engine`.
- **Getting help.** A bee that can do the work does it. If it can't, it asks Queen for a worker, not for the work. Queen sends a Symbiont from the pool, or drafts a new one for the owner's OK. The bee works with the Symbiont and stays responsible for the result.

Symbionts are one-task roles. They stay in the pool for reuse, but they are not part of the hive, so they aren't listed here: the pool is `symbionts/`.
