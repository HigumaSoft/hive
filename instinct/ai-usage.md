# AI usage

- AI work runs on paid subscriptions only. Anything billed per token needs the owner's approval each time.
- Never run with `ANTHROPIC_API_KEY` or `OPENAI_API_KEY` set: agents could bill per token without warning.
- When an engine's limit runs out, its work pauses and continues in a compensation session. Work on the other engine goes on. Never fall back to paid tokens.
- Which subscriptions exist, and what they cost, is documented in Confluence, not here.
