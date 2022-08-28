local colorschemes = "material"

-- Set Material theme (See nvim documentation for more info on colorschems)
-- List of themes:
-- deep ocean
-- oceanic
-- palenight
-- lighter
-- darker
vim.g.material_style = "deep ocean"

require('material').setup({
    contrast = {
        sidebars = true,
        floating_windows = true,
    },
    italics = {
        keywords = true,
        functions = true,
    },
    contrast_filetypes = {
        "terminal",
        "packer",
        "qf",
    },
    disable = {
        borders = true,
        eob_lines = true
    }
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorschemes)

if not status_ok then
  vim.notify("colorscheme " .. colorschemes .. " not found!")
  return
end
