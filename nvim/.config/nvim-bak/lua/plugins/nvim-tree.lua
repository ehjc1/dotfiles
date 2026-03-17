return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local nvim_tree = require("nvim-tree")
    -- local status_ok, nvim_tree = pcall(require, "nvim-tree")
    -- if not status_ok then
    --   return
    -- end

    -- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
    -- if not config_status_ok then
    --   return
    -- end

    -- local tree_cb = nvim_tree_config.nvim_tree_callback

    nvim_tree.setup({
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      view = {
        width = 30,
        side = "left",
      },
      filters = {
        dotfiles = false,
        git_clean = false,
      },
      git = {
        ignore = true,
      },
    })
  end,
}
