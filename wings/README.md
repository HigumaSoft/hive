# Wings (scripts)

The scripts behind `make init` and `make update`, the check that runs at every session start, and the dispatch that sends a review or a ticket to a bee on Codex. They run inside this clone and work on the parent folder, the project that holds it.

## Troubleshooting

- **Codex says "Access denied" on a folder** that was moved out of `.codex/`: on Windows, reset the folder's permissions with `icacls <folder> /reset /T /Q`.
