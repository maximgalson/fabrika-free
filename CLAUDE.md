# Fabrika Free

> Free interactive mini-course for Content Factory — 30-min intro to AI content creation in Claude Code.

## Stack

- **Format:** Bash installer + markdown skills/course content
- **Delivery:** curl | bash from GitHub
- **License:** Public repo

## Architecture

```
install.sh -> copies skills/ and course/ to user's Claude Code
User runs /start -> agent-guide walks through course
```

## Key Files

| File | Description |
|------|-------------|
| install.sh | Main installer (curl from GitHub) |
| course/ | Course content (lessons, exercises) |
| skills/ | Free tier skills |
| gifts/ | Bonus materials |
| README.md | Public-facing documentation |

## Install

```bash
curl -sSL https://raw.githubusercontent.com/maximgalson/fabrika-free/main/install.sh | bash
```

## Rules

1. **Public repo** — no secrets, no paid content, no internal references
2. **Funnel to paid** — course leads to paid tiers on galson.pro
3. **Self-contained** — must work without any other dependencies

