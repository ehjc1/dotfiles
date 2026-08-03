# AI config (`~/.claude`, `~/.codex`, `~/.config/opencode`)

Stowed with `stow --no-folding ai` (or `make install-ai`). `--no-folding` keeps
`~/.claude` a real directory so runtime files (history, credentials, caches,
plugin installs) never land inside the repo.

`ai/.claude/CLAUDE.md` is the only instruction file. Agents that read
`AGENTS.md` instead get a symlink to it, so nothing is duplicated per agent.
Support a new agent by adding its config dir to `AGENT_DIRS` in the Makefile:

```make
AGENT_DIRS = $(HOME)/.codex $(HOME)/.config/opencode
```

`make link-agents` then creates `<dir>/AGENTS.md -> ai/.claude/CLAUDE.md`, and
re-running it is safe.

## What reproduces automatically

| Thing | Where it lives | How it comes back |
|---|---|---|
| Global instructions | `ai/.claude/CLAUDE.md` | stow symlink |
| Same instructions for non-Claude agents | `ai/.claude/CLAUDE.md` | `make link-agents` symlinks `AGENTS.md` in each `AGENT_DIRS` entry |
| Statusline | `ai/.claude/statusline-command.sh` | stow symlink |
| Settings, plugins, marketplaces | `ai/.claude/settings.json` | stow symlink; Claude installs plugins on next launch |
| Personal skills | `ai/.claude/skills/` | stow symlink |
| Personal slash commands | `ai/.claude/commands/` | stow symlink |
| User-scope MCP servers | `ai/.claude/mcp-servers.json` | `make install-mcp` |

## Plugins

Declared in `settings.json` under `enabledPlugins` + `extraKnownMarketplaces`.
Claude Code fetches the marketplace and installs the plugin on first launch.

| Plugin | Marketplace repo |
|---|---|
| `pyright-lsp` | `anthropics/claude-plugins-official` (built in) |
| `agent-skills` | `addyosmani/agent-skills` |
| `svelte` | `sveltejs/ai-tools` |
| `ponytail` | `DietrichGebert/ponytail` |
| `caveman` | `JuliusBrussee/caveman` |
| `impeccable` | `pbakaus/impeccable` - marketplace known, enabled per-project only |

Add a plugin: `claude plugin install <name>@<marketplace>`, then commit the
resulting `settings.json` diff.

## Skills

Personal skills in `ai/.claude/skills/`:

- `graphify` - any input to a persistent knowledge graph (`/graphify`)
- `grill-me` - adversarial interview on a plan or design
- `using-agent-skills` - meta-skill for skill discovery

Everything else (`build`, `review`, `ship`, `ponytail-*`, `caveman-*`,
`svelte-*`, ...) ships inside the plugins above - nothing to track here.

## Slash commands

`ai/.claude/commands/`: `build`, `code-simplify`, `plan`, `review`, `ship`,
`spec`, `test`, `webperf`. These mirror the `agent-skills` plugin commands and
override them at user scope.

## MCP servers

`ai/.claude/mcp-servers.json` holds **user-scope** servers only. They are
replayed with `claude mcp add-json --scope user` because MCP config lives in
`~/.claude.json`, which also holds OAuth tokens and per-project state and so is
never stowed.

Currently: `svelte` (`https://mcp.svelte.dev/mcp`, http).

**Not reproducible from dotfiles:**

- **claude.ai connectors** - Notion, Gmail, Google Drive, Google Calendar. These
  are attached to the Anthropic account, not the machine. They reappear after
  `claude` login; no local config exists for them.
- **Project-scope servers** - e.g. `playwright` and `linear-server` in the KFST
  repo. They belong to that project's config and need their own auth. Re-add per
  project:
  ```sh
  claude mcp add playwright npx @playwright/mcp@latest
  claude mcp add --transport http linear-server https://mcp.linear.app/mcp
  ```

Add a user-scope server: register it with `claude mcp add ... --scope user`,
then mirror the entry into `mcp-servers.json` (secrets stay out - reference env
vars, never paste tokens).

## Fresh machine

```sh
git clone <dotfiles> ~/dotfiles && cd ~/dotfiles
make install-ai      # stow + MCP servers
claude               # log in; plugins and connectors pull down on first run
```
