-- Lua:
-- For dark theme (neovim's default)
vim.o.background = 'dark'
-- For light theme

local c = require('vscode.colors').get_colors()
require('vscode').setup({
})
require('vscode').load()

vim.o.termguicolors = true
vim.cmd[[ colorscheme vscode]]
