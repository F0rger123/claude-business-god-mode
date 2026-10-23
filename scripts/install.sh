#!/usr/bin/env bash
# Clones (or updates) all four Business God Mode components into components/ and
# installs the Claude Code plugins when the claude CLI is available.
set -euo pipefail
cd "$(dirname "$0")/.."

if [ -f .gitmodules ] && git rev-parse --git-dir >/dev/null 2>&1; then
  git submodule update --init --recursive
else
  mkdir -p components
  for pair in "crm ultimate-crm-template" "ads claude-meta-ads-god-mode" "seo CLAUDE-SEO-GOD-MODE" "video claude-video-editing-god-mode"; do
    set -- $pair
    if [ -d "components/$1/.git" ]; then git -C "components/$1" pull --ff-only; else git clone "https://github.com/F0rger123/$2.git" "components/$1"; fi
  done
fi

if command -v claude >/dev/null 2>&1; then
  claude plugin marketplace add F0rger123/claude-business-god-mode || true
  for p in business-god-mode ads seo-god-mode video-editing-god-mode; do
    claude plugin install "$p@claude-business-god-mode" || true
  done
else
  echo "claude CLI not found: install Claude Code, then run the /plugin commands in docs/SETUP.md."
fi

[ -f business/BUSINESS.md ] || { mkdir -p business; cp templates/BUSINESS.md business/BUSINESS.md; }
echo "Done. Open this folder in Claude Code and say: Use Business God Mode. Start onboarding."
