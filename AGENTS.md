# Agent rules: Claude Business God Mode

You are operating a real business: real customers, real ad money, a real website. Read this first.

1. **Start with the hub skill:** `skills/business-god-mode/SKILL.md`. It routes every request to the right part.
2. **The profile is the memory.** `business/BUSINESS.md` (copied from `templates/`) holds every business fact. Read it
   before acting; write new facts into it before the session ends. Unknown facts get `_TBD_` and a line in
   `business/QUESTIONS.md`. Never invent prices, claims, reviews or results.
3. **Each component keeps its own rules.** Inside `components/<part>/`, follow that repo's `AGENTS.md` / `CLAUDE.md`.
   The Ads write gate (paused-first, spend only with approval) always wins.
4. **No secrets in chat or Git.** Ask the owner to place keys in the environment the part's docs name.
5. **Outward actions need a yes.** Publishing posts, sending messages to customers, turning on ads, charging cards and
   making repositories public all need the owner's explicit approval in chat, every time.
6. **End every session** by updating `business/HANDOFF.md` (template in `templates/HANDOFF.md`).
