vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.keymap.set('n','<leader>h', ':nohlsearch<CR>')

vim.keymap.set('n','<S-f>',':RG<cr>')
vim.keymap.set('n','<C-f>',':Telescope find_files<cr>')
vim.keymap.set('n','<F2>',':NvimTreeFindFileToggle<cr>')
vim.keymap.set('n','<A-d>',':DogeGenerate<CR>')
