-- global options
vim.o.number = true                   -- show line numbers
vim.o.relativenumber = true           -- number relative to current line

-- Disable unused providers to avoid startup checks.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- 4 spoace indent
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.termguicolors = true

vim.o.updatetime = 50

vim.opt.clipboard = "unnamedplus"
