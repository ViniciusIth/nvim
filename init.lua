vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.mapleader = " "

vim.filetype.add({ extension = { templ = "templ" } })

require("config.options")
require("plugins")
require("config.mappings")

if vim.g.neovide then
    require("config.neovide")
end

vim.cmd.colorscheme "catppuccin"
