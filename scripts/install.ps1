# Clones (or updates) all four Business God Mode components into components\ and
# installs the Claude Code plugins when the claude CLI is available.
$ErrorActionPreference = "Stop"
Set-Location (Join-Path $PSScriptRoot "..")

if ((Test-Path .gitmodules) -and (Test-Path .git)) {
  git submodule update --init --recursive
} else {
  New-Item -ItemType Directory -Force components | Out-Null
  $parts = @{ crm = "ultimate-crm-template"; ads = "claude-meta-ads-god-mode"; seo = "CLAUDE-SEO-GOD-MODE"; video = "claude-video-editing-god-mode" }
  foreach ($k in $parts.Keys) {
    $dir = "components\$k"
    if (Test-Path "$dir\.git") { git -C $dir pull --ff-only } else { git clone "https://github.com/F0rger123/$($parts[$k]).git" $dir }
  }
}

if (Get-Command claude -ErrorAction SilentlyContinue) {
  claude plugin marketplace add F0rger123/claude-business-god-mode
  foreach ($p in "business-god-mode", "ads", "seo-god-mode", "video-editing-god-mode") {
    claude plugin install "$p@claude-business-god-mode"
  }
} else {
  Write-Host "claude CLI not found: install Claude Code, then run the /plugin commands in docs/SETUP.md."
}

if (-not (Test-Path business\BUSINESS.md)) {
  New-Item -ItemType Directory -Force business | Out-Null
  Copy-Item templates\BUSINESS.md business\BUSINESS.md
}
Write-Host "Done. Open this folder in Claude Code and say: Use Business God Mode. Start onboarding."
