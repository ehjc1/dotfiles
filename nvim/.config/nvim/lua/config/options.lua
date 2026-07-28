-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Pin root detection to cwd so multi-repo workspaces don't jump to the LSP/git
-- root of whatever file is open
vim.g.root_spec = { "cwd" }
