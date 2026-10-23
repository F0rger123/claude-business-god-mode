# Setup

Install only the parts the business needs now. Each part works on its own; together they share `business/BUSINESS.md`.

## 0. Requirements

| Need | For |
|---|---|
| [Claude Code](https://claude.com/claude-code) (or Codex) | everything |
| Git, GitHub account | everything |
| Node.js 22+ | CRM, Video |
| Python 3.10+ | SEO MCP server, Ads helper |
| FFmpeg + Chrome | Video rendering (`npm run setup` in the video repo checks this) |
| Supabase + Cloudflare accounts (free tiers work) | CRM, Video app |

## 1. Install every Claude plugin in one go

Inside Claude Code:

```text
/plugin marketplace add F0rger123/claude-business-god-mode
/plugin install business-god-mode@claude-business-god-mode
/plugin install ads@claude-business-god-mode
/plugin install seo-god-mode@claude-business-god-mode
/plugin install video-editing-god-mode@claude-business-god-mode
```

Or from a terminal:

```bash
claude plugin marketplace add F0rger123/claude-business-god-mode
claude plugin install business-god-mode@claude-business-god-mode
claude plugin install ads@claude-business-god-mode
claude plugin install seo-god-mode@claude-business-god-mode
claude plugin install video-editing-god-mode@claude-business-god-mode
```

This marketplace points at each component's own GitHub repository, so you always get its latest release.

## 2. Get the full workspace (all four repositories)

```bash
git clone --recurse-submodules https://github.com/F0rger123/claude-business-god-mode.git
cd claude-business-god-mode
```

`components/` then holds all four repositories. Update them later with:

```bash
git submodule update --remote --merge
```

Already cloned without submodules? Run `git submodule update --init --recursive`, or the installer:
`bash scripts/install.sh` (macOS/Linux/Git Bash) or `powershell -ExecutionPolicy Bypass -File scripts/install.ps1` (Windows).

## 3. Per-part setup

| Part | Do this | Detailed guide |
|---|---|---|
| CRM | Ask Claude: *"Create a new CRM for my business from https://github.com/F0rger123/ultimate-crm-template. Begin onboarding."* | [`docs/SETUP_WIZARD.md`](https://github.com/F0rger123/ultimate-crm-template/blob/main/docs/SETUP_WIZARD.md) |
| Ads | `/mcp` → `meta-ads` → sign in with Facebook, then `/ads:doctor` | [Install](https://github.com/F0rger123/claude-meta-ads-god-mode#-install-in-60-seconds) |
| SEO | `pip install -r mcp-server/requirements.txt` if you use the MCP server; connect Search Console / Bing with `python scripts/setup/connect.py` | [`docs/SETUP.md`](https://github.com/F0rger123/CLAUDE-SEO-GOD-MODE/blob/main/docs/SETUP.md) |
| Video | `cd components/video && npm install && npm run setup && npm run demo` | [README](https://github.com/F0rger123/claude-video-editing-god-mode#-quick-start) |
| Video app | Deploy God Mode Cut to Supabase + Cloudflare Workers | [`app/docs/DEPLOYMENT.md`](https://github.com/F0rger123/claude-video-editing-god-mode/blob/main/app/docs/DEPLOYMENT.md) |

## Check what is installed

```text
/plugin
```

Look for `business-god-mode`, `ads`, `seo-god-mode` and `video-editing-god-mode`. For the workspace:
`git submodule status` lists the four components and their commits.

## Secrets

Never paste keys into chat. Each part reads its own environment:

| Part | Where keys go |
|---|---|
| CRM | `.env` (browser-safe `VITE_*` only) and Cloudflare Pages secrets (service role, Stripe, Twilio) |
| Ads | the Meta MCP sign-in (no key needed); Google Ads variables in your OS keychain or MCP server env |
| SEO | `GSC_*`, `BING_WEBMASTER_API_KEY`, `GOOGLE_API_KEY` in your shell or MCP server env |
| Video | `.env` in the video repo (all optional); app secrets in Cloudflare |
