# Project Memory

This file is persistent, cross-session memory for this repository. It is
automatically injected into the context of every Claude Code session by the
`SessionStart` hook in `.claude/hooks/session-start.sh`.

Keep it concise and high-signal. Treat it like a running notebook of facts that
should survive between sessions — decisions made, work in progress, conventions,
and gotchas. Prune anything stale.

---

## About this repository

- This is **Anthropic's Agent Skills marketplace** — a collection of `SKILL.md`
  folders under `skills/` (e.g. `algorithmic-art`, `canvas-design`,
  `claude-api`, `docx`, `pdf`, `pptx`, `xlsx`), plus `spec/` (the Agent Skills
  spec) and `template/` (a starter skill).
- It is a *skills* repo, not an application runtime. There is no build step or
  package manifest to install at the repo root.

## Conventions

- Skills live in `skills/<name>/SKILL.md` with YAML frontmatter (`name`,
  `description`) followed by markdown instructions.
- Development happens on feature branches (e.g.
  `claude/session-purpose-benefits-0po7fs`), not directly on `main`.

## Decisions log

- 2026-06-18: Added a persistent-memory layer (`MEMORY.md` + a `SessionStart`
  hook) so context survives across the ephemeral Claude Code web sessions.
  Motivated by the memory/cost patterns in the Galadriel project
  (github.com/avasol/galadriel-public).

## Work in progress

<!-- Add current tasks, open questions, and anything you want the next session
     to pick up here. -->

## Gotchas

<!-- Record surprises, footguns, and non-obvious constraints here. -->
