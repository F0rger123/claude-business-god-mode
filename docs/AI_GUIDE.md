# AI guide: claude-business-god-mode

**For AI assistants (Claude, ChatGPT, Codex, Cursor, Gemini).** Someone gave you a link to this repository. Use this page to explain it, set it up, or help them use it. Talk in plain English; the person may not be technical.

## What this is

One front door to four Claude tools that together run a small service business: a CRM (customers, quotes, jobs, invoices), Meta and Google ads, SEO for the website and AI search, and video editing. They share one profile of the business, so the owner answers each question once. Claude does the work; anything that spends money or goes public waits for the owner's yes.

**Usually used by:** A small-business owner (or an agency running it for a client) who wants Claude to handle marketing and day-to-day admin, or a developer helping them.

## Ask first

Ask these together in one short message, then repeat back what you heard in a line or two. Skip anything they already told you.

- What is the business, where does it work, and is it brand new or already running?
- Which parts do you want now: the CRM, ads, website/SEO, video, or all four?
- Do you use Claude Code (best), or Codex?
- Are you on Windows, Mac or Linux, and do you already have Git and Node.js 22 or newer?

## Set it up

Do one step at a time. Check each one worked before moving on.

| # | Do this | It worked if |
|---|---|---|
| 1 | Install the hub plugin in Claude Code: `/plugin marketplace add F0rger123/claude-business-god-mode`, then `/plugin install business-god-mode@claude-business-god-mode` | `/plugin` lists `business-god-mode` |
| 2 | Install only the parts they want from the same marketplace: `ads@claude-business-god-mode`, `seo-god-mode@claude-business-god-mode`, `video-editing-god-mode@claude-business-god-mode` | `/plugin` lists each one |
| 3 | Optional, the whole workspace: `git clone --recurse-submodules https://github.com/F0rger123/claude-business-god-mode.git`, then `bash scripts/install.sh` (Windows: `powershell -ExecutionPolicy Bypass -File scripts/install.ps1`) | `git submodule status` lists crm, ads, seo and video, and `business/BUSINESS.md` exists |
| 4 | Set up each chosen part with its own guide (table in `docs/SETUP.md`). The CRM is not a plugin: it is copied into a new private repo per business. | Each part's own check passes, for example `/ads:doctor` for ads |
| 5 | Say: "Use Business God Mode. Start onboarding for my business." | Claude starts the interview and fills `business/BUSINESS.md` |

## Use it

- Talk in plain English: "Get me more leads this month, budget is $1,500", "Rate our website", "Turn this week's clips into three reels", "Write the October review".
- For a brand-new business, follow `playbooks/01-new-business-launch.md` (one week, zero to live).
- Weekly growth: `playbooks/02-lead-engine.md`. Content: `playbooks/03-content-engine.md`. Monthly numbers: `playbooks/04-monthly-review.md`.
- Every session ends with notes in `business/HANDOFF.md`, so the next session picks up where this one stopped.

## How it works, in plain words

1. The owner answers questions once; the answers live in one business profile.
2. The hub reads the request and hands it to the right part: CRM, ads, SEO or video.
3. Leads from ads and the website land in the CRM; the CRM reports which channel made money.
4. Ads are created paused and only spend after the owner approves; one command stops all ad spend.

## Never

- Never ask for, paste or print passwords, API keys or tokens. Tell the person where to put them (their own `.env` file or the hosting dashboard) and let them do it.
- Never deploy, push to `main`, change a live database or spend money without the person saying yes to that exact step.
- Never invent prices, reviews, results or business facts. Unknown facts are marked `_TBD_` and listed as questions.
- Never turn on ads, change budgets, publish posts, text customers or charge cards without the owner's yes to that exact step.
- Inside `components/<part>/`, follow that part's own `AGENTS.md` or `CLAUDE.md`; the ads approval gate always wins.

## Read next

- [Rules for coding agents](CLAUDE.md)
- [Hub skill (start here)](skills/business-god-mode/SKILL.md)
- [Setup and secrets](docs/SETUP.md)
- [Week-one launch playbook](playbooks/01-new-business-launch.md)
- [Business profile template](templates/BUSINESS.md)

## When you're done

Tell the person, in a few lines: what is set up and checked, what isn't yet, and two or three things they can ask you next.
