<p align="center">
  <img src="assets/banner.svg" alt="Claude Business God Mode: CRM, Meta Ads, SEO and Video under one umbrella" width="100%">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Claude%20Code-marketplace-f59e0b?style=for-the-badge" alt="Claude Code marketplace">
  <img src="https://img.shields.io/badge/components-4-6366f1?style=for-the-badge" alt="4 components">
  <img src="https://img.shields.io/badge/spend-approval%20gated-ea580c?style=for-the-badge" alt="Spend approval gated">
  <img src="https://img.shields.io/badge/license-MIT-2ea44f?style=for-the-badge" alt="MIT">
</p>

<h3 align="center">Start a business on Monday. By Friday it has a CRM, a rated website, ads ready to launch and its first edited videos. Claude does the work. You approve.</h3>

<p align="center">
  <a href="#-install-in-two-minutes">Install</a> ·
  <a href="#-the-four-god-modes">Components</a> ·
  <a href="#-how-it-fits-together">Architecture</a> ·
  <a href="#-your-first-week">First week</a> ·
  <a href="#-just-talk-to-it">Prompts</a> ·
  <a href="#-playbooks">Playbooks</a> ·
  <a href="#-safety">Safety</a> ·
  <a href="#-faq">FAQ</a>
</p>

---

> [!IMPORTANT]
> **AI agents (Claude, Codex, Cursor, Gemini): start here.** If someone pasted this link and asked you to set it up:
> 1. Read [`AGENTS.md`](AGENTS.md), then the hub skill [`skills/business-god-mode/SKILL.md`](skills/business-god-mode/SKILL.md).
> 2. Follow [`docs/SETUP.md`](docs/SETUP.md) to install only the parts the person needs.
> 3. Start [`playbooks/01-new-business-launch.md`](playbooks/01-new-business-launch.md): copy [`templates/BUSINESS.md`](templates/BUSINESS.md) to `business/BUSINESS.md` and interview the owner.
>
> Plain-text index: [`llms.txt`](llms.txt). Never ask for or print secrets. Money and public posts move only with the owner's yes.

## ⚡ Install in two minutes

**Every plugin, one marketplace** (inside Claude Code):

```text
/plugin marketplace add F0rger123/claude-business-god-mode
/plugin install business-god-mode@claude-business-god-mode
/plugin install ads@claude-business-god-mode
/plugin install seo-god-mode@claude-business-god-mode
/plugin install video-editing-god-mode@claude-business-god-mode
```

**The whole workspace** (all four repositories as submodules, plus the installer):

```bash
git clone --recurse-submodules https://github.com/F0rger123/claude-business-god-mode.git
cd claude-business-god-mode
bash scripts/install.sh            # Windows: powershell -ExecutionPolicy Bypass -File scripts/install.ps1
```

Then open the folder in Claude Code and say:

```text
Use Business God Mode. Start onboarding for my business.
```

## 👑 The four God Modes

<table>
<tr>
<td width="50%" valign="top">

### 📇 [Ultimate CRM Template](https://github.com/F0rger123/ultimate-crm-template)
**The system of record.** Leads and pipeline, quotes with e-sign, invoices, Stripe / Square / manual payments, jobs
and recurring work, scheduling and routes, crew portal with clock-in, client portal, reviews and referrals,
Twilio SMS inbox, Gmail templates, campaigns, an automations builder and **Alfred**, the AI chief-of-staff.

React + Vite · Supabase · Cloudflare Pages. Claude interviews the owner and builds *their* version in a private repo.

`Create a new CRM for my business from https://github.com/F0rger123/ultimate-crm-template. Begin onboarding.`

</td>
<td width="50%" valign="top">

### 📣 [Meta Ads God Mode](https://github.com/F0rger123/claude-meta-ads-god-mode)
**Paid leads, safely.** Meta Ads first, Google Ads built in. Client profiles, account isolation, audits,
optimization, reporting and creative briefs, plus an on-demand router to 137 community ad skills.

A write gate creates everything **PAUSED** and spends only with your approval. `/ads:emergency-stop` halts spend.

`Build a York, PA kitchen-remodel lead campaign on Meta at $60/day.`

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 🔎 [SEO God Mode](https://github.com/F0rger123/CLAUDE-SEO-GOD-MODE)
**Organic leads and AI search.** Rate any site from a URL (Overall, SEO, AEO, GEO scores with ranked fixes),
full audits, local SEO, Google Search Console, Bing Webmaster, IndexNow, schema, content briefs, AI Overviews and
ChatGPT / Perplexity citation readiness, with client memory and a 27-tool MCP server.

`Rate my website SEO-wise: https://example.com`

</td>
<td width="50%" valign="top">

### 🎬 [Video Editing God Mode](https://github.com/F0rger123/claude-video-editing-god-mode)
**Content that sells.** 16 editing skills: reels, Shorts, long-form, silence and mistake cutting, story
planning, motion-graphics B-roll, captions, showreels. Free local transcription. Plus **God Mode Cut**, a
white-label PWA where clients upload clips, approve edits and schedule posts.

`Edit raw/clip.mp4 into a 30-second reel. Hook in the first second, captions, B-roll for every point.`

</td>
</tr>
</table>

## 🗺 How it fits together

```mermaid
flowchart TB
    Owner(["👤 Owner"]) <-->|"approves spend, posts, videos"| Hub
    Hub{{"👑 Business God Mode<br/>business/BUSINESS.md · playbooks · routing"}}
    Hub --> CRM["📇 Ultimate CRM<br/>leads · jobs · invoices · reviews"]
    Hub --> Ads["📣 Meta Ads God Mode<br/>paused-first campaigns"]
    Hub --> SEO["🔎 SEO God Mode<br/>audits · GSC · AI search"]
    Hub --> Video["🎬 Video God Mode<br/>edits · God Mode Cut app"]
    Ads -- "leads (source tagged)" --> CRM
    SEO -- "leads from service pages" --> CRM
    Video -- "reels → ad creatives" --> Ads
    Video -- "transcripts → pages + VideoObject" --> SEO
    CRM -- "review requests → GBP" --> SEO
    CRM -- "revenue by source" --> Hub
```

**One profile, four specialists.** Every part reads the same `business/BUSINESS.md`: name, services, prices,
service area, brand voice, offers, budget and goals. Nothing gets typed twice, nothing gets invented.

## 📅 Your first week

| Day | What happens | Part |
|---|---|---|
| **1** | Owner interview fills `BUSINESS.md`. CRM created in its own private repo, deployed, test lead arrives. | Hub + CRM |
| **2** | Website rated and audited. Search Console connected. Lead form added to service pages. | SEO + CRM |
| **3** | Ads client onboarded. Lead campaigns built **paused**, tracking verified, owner approves or declines. | Ads |
| **4** | Brand taste set up. First reel edited and approved. Cuts handed to ads as creatives. | Video + Ads |
| **5** | Every lead source tested end to end. CRM automations on. `HANDOFF.md` written. | All |

Full steps: [`playbooks/01-new-business-launch.md`](playbooks/01-new-business-launch.md).

## 💬 Just talk to it

```text
Use Business God Mode. Start onboarding for Sunrise Pressure Washing in York, PA.
Get me more leads this month. Budget is $1,500.
Which channel gave us the cheapest customers last month?
Turn this week's job-site clips into three reels and use the best one as an ad.
Rate our website and fix what you safely can.
Something is overspending. Stop it.
Write the October review.
```

The hub works out which part to use. You never type a tool name.

## 📚 Playbooks

| Playbook | Use it for |
|---|---|
| [01 · New business launch](playbooks/01-new-business-launch.md) | Week one, from zero to live |
| [02 · Lead engine](playbooks/02-lead-engine.md) | The weekly loop across SEO, Ads and CRM |
| [03 · Content engine](playbooks/03-content-engine.md) | Phone footage → edits → approval → posts → ads and pages |
| [04 · Monthly review](playbooks/04-monthly-review.md) | One page of real numbers, by channel |

Templates: [`BUSINESS.md`](templates/BUSINESS.md) · [`QUESTIONS.md`](templates/QUESTIONS.md) · [`HANDOFF.md`](templates/HANDOFF.md).

## 🛡 Safety

- **Ad spend is gated.** Campaigns are created paused; budgets change only after a yes in chat. Emergency stop is one command.
- **Payments start in test mode.** The CRM uses Stripe or Square test keys until the owner switches them live.
- **Clients are isolated.** One CRM repo and Supabase project per business, Postgres RLS on every table; Ads and SEO keep per-client profiles.
- **Secrets stay out of chat and Git.** Each part reads keys from its own environment ([`docs/SETUP.md`](docs/SETUP.md#secrets)).
- **No fabricated data.** Reports cite their source and list what is missing instead of estimating.

## 🗂 Repository layout

```
.claude-plugin/          marketplace (hub + Ads + SEO + Video plugins) and the hub plugin manifest
skills/business-god-mode the hub skill (mirrored for Codex in .agents/skills/)
playbooks/               launch, lead engine, content engine, monthly review
templates/               BUSINESS.md, QUESTIONS.md, HANDOFF.md
components/              the four repositories as git submodules (crm, ads, seo, video)
scripts/                 install.sh / install.ps1
docs/SETUP.md            requirements, install paths, per-part setup, secrets
AGENTS.md · CLAUDE.md    rules for every agent
```

## ❓ FAQ

**Do I need all four?** No. Each part works alone. Install the ones you need; the hub skips what is missing.

**Is the CRM a plugin?** No. It is an app template. Claude clones it into a new private repo per business and
deploys it. The other three are Claude Code plugins.

**What does it cost?** The code is free (MIT). Supabase, Cloudflare and the video toolchain have free tiers.
You pay for ad spend, optional APIs (Stripe fees, Twilio SMS, cloud transcription) and your Claude plan.

**Does it work with Codex?** Yes. Ads and Video ship Codex plugin support or skill mirrors, SEO ships `AGENTS.md`, and the hub skill is mirrored in `.agents/skills/`.
Codex does not run Claude Code hooks, so read the Ads repo's note on the write gate.

**Agencies?** Yes. Run one `business/` profile per client in separate workspaces; Ads and SEO already keep per-client memory,
and God Mode Cut has per-client portals.

## 📜 License

MIT © 2026 F0rger123. Each component carries its own license and third-party notices; see each repository.

<p align="center"><sub>Built by <a href="https://github.com/F0rger123"><b>@F0rger123</b></a> with Claude Code</sub></p>
