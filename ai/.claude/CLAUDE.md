# General Guidelines

- Never use the em dash "—". Use plain dash "-" instead
- Don't add comments that are obvious. Only comment functions and implementation that are complex.

# graphify

- **graphify** (`~/.claude/skills/graphify/SKILL.md`) - any input to knowledge graph. Trigger: `/graphify`
  When the user types `/graphify`, invoke the Skill tool with `skill: "graphify"` before doing anything else.

# Security rules

- Never read, print, summarize, copy, or modify secrets.
- Treat `.env`, `.env.*`, private keys, service account files, credential directories, config directories and package manager auth files as forbidden.
- If a task requires a secret value, ask me to provide a redacted example instead.
- Use `.env.example` for documentation, never real `.env` files.
