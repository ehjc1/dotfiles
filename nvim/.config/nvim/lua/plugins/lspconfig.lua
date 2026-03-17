return {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        pyright = {
          autostart = true,
          settings = {
            pyright = {
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                ignore = { "*" },
                typeCheckingMode = "off",
              },
            },
          },
        },
        tsserver = {
          enabled = false,
        },
        ts_ls = {
          enabled = false,
        },
        vtsls = {
          enabled = false,
        },
      },
    },
    setup = {
      pyright = function(_, opts)
        require("lspconfig").pyright.setup(vim.tbl_deep_extend("force", opts, {
          on_attach = function(client, _)
            -- Let ruff handle everything except hover
            client.server_capabilities.codeActionProvider = false
            client.server_capabilities.renameProvider = false
            client.server_capabilities.referencesProvider = false
            client.server_capabilities.definitionProvider = false
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        }))
        return true -- tell LazyVim we handled setup ourselves
      end,

      ruff = function(_, opts)
        require("lspconfig").ruff.setup(vim.tbl_deep_extend("force", opts, {
          on_attach = function(client, _)
            -- Let pyright handle hover
            client.server_capabilities.hoverProvider = false
          end,
        }))
        return true
      end,
    },
  },
}
