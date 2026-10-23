---
name: business-god-mode
description: CLAUDE BUSINESS GOD MODE hub. Use when someone wants to launch, onboard, grow or run a business with Claude end to end, or asks which God Mode to use. Ties together the Ultimate CRM Template (leads, quotes, jobs, invoices, payments, crew and client portals), Meta Ads God Mode (paid media, paused-first, approval-gated), SEO God Mode (audits, local SEO, Search Console, AI search) and Video Editing God Mode (reels, Shorts, ad creatives, client video approvals). Runs the shared business profile and the cross-component playbooks.
---

# Claude Business God Mode

One operating system for a whole business, made of four parts that share one business profile:

```
                     ┌──────────────────────────────┐
                     │  BUSINESS.md (one profile)    │
                     └──────────────┬───────────────┘
   ┌───────────────┬────────────────┼────────────────┬────────────────┐
   ▼               ▼                ▼                ▼                │
 CRM            Meta Ads           SEO            Video              │
 (system of     (paid leads)       (organic        (content +         │
  record)                           leads, reviews)  ad creative)      │
   ▲               │                │                │                │
   └──── leads ────┴──── leads ─────┘                └── creatives ───┘
```

| Part | Repo | Plugin / skill | Owns |
| --- | --- | --- | --- |
| CRM | `F0rger123/ultimate-crm-template` | clone per business (not a plugin) | customers, leads, quotes, jobs, invoices, payments, reviews, SMS, automations |
| Ads | `F0rger123/claude-meta-ads-god-mode` | `ads@claude-meta-ads-god-mode` | Meta and Google ad accounts, budgets, campaigns, reporting |
| SEO | `F0rger123/CLAUDE-SEO-GOD-MODE` | `seo-god-mode@seo-god-mode` | website rating, audits, local SEO, Search Console, Bing, schema, AI search |
| Video | `F0rger123/claude-video-editing-god-mode` | `video-editing-god-mode@claude-video-editing-god-mode` | editing reels, Shorts and long-form, client video approval PWA |

## Step 0: find out where the business is

Read `business/BUSINESS.md` in the current workspace. If it does not exist, copy `templates/BUSINESS.md` there and run
the onboarding interview (`playbooks/01-new-business-launch.md`, step 1). Ask at most five questions per turn.
Write every answer into the file before the session ends. The repo is the memory, chat history is not.

Then check which parts are installed (`docs/SETUP.md`, "Check what is installed") and offer to install only the parts
the owner needs now.

## Route the request

| The owner says | Do this |
| --- | --- |
| "Start / launch / set up my business", "new client" | `playbooks/01-new-business-launch.md` |
| "I need a CRM", leads, quotes, invoices, scheduling, crew, client portal | CRM: follow the CRM repo's `docs/SETUP_WIZARD.md` |
| Ads, campaigns, budget, CPL, ROAS, "what wasted spend" | Ads: load `ads-core` first (Meta Ads God Mode) |
| "Rate my site", SEO, rankings, Google Business Profile, AI Overviews | SEO: load `seo-god-mode` |
| Edit a video, reels, Shorts, ad creative from footage, video approvals | Video: load `video-editing-god-mode` |
| "Get me more leads" | `playbooks/02-lead-engine.md` (SEO + Ads + CRM intake together) |
| "Make content", "post more" | `playbooks/03-content-engine.md` (Video + SEO + Ads creatives) |
| "How are we doing", monthly report | `playbooks/04-monthly-review.md` |
| "Something is overspending", "stop everything" | Ads emergency stop first (`/ads:emergency-stop`), then report |

## Rules that apply across all four parts

1. **One profile.** Name, services, prices, service area, brand voice, offers and goals come from `BUSINESS.md`.
   Never invent them. Unknown facts get `_TBD_` and a question in `business/QUESTIONS.md`.
2. **Money moves only with approval.** Ads are created PAUSED and spend only after the owner approves (Ads write
   gate). CRM payments run in test mode until the owner switches them live.
3. **Secrets never go in chat or in Git.** Keys live in each part's environment (`.env`, Cloudflare secrets,
   OS keychain). Ask the owner to paste them into the right place themselves.
4. **Each client is isolated.** One CRM repo and one Supabase project per business. Ads and SEO keep per-client
   profiles; never mix accounts.
5. **Evidence, not guesses.** Report numbers with their source (Ads Manager, Search Console, CRM). Say when data is
   missing instead of estimating.
6. **Close the loop.** Every lead source (ads, SEO pages, video posts) must land in the CRM with its source tagged,
   so the monthly review can compare cost per lead and revenue per channel.

## Handing work between parts

- **Ads to CRM:** use the CRM's embeddable lead form (`#/lead-form`) on the landing page as the ad
  destination. Tag `source = meta-ads` or `google-ads` plus the campaign name.
- **SEO to CRM:** every service page gets the lead form or a tracked phone number. The CRM's review requests feed
  Google Business Profile reviews, which SEO God Mode monitors.
- **Video to Ads:** finished reels from Video God Mode become ad creatives. Hand the file paths and captions to
  `ads-creative` / `/ads:creative`. Keep the 9:16 and 4:5 crops.
- **Video to SEO:** long-form videos get a transcript; SEO God Mode turns it into a page or FAQ section with
  VideoObject schema.
- **CRM to everything:** monthly revenue, close rate and job counts by source feed `playbooks/04-monthly-review.md`.
