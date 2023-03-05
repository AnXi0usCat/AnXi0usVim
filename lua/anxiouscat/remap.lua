--vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- shorten the function name
local keymap = vim.api.nvim_set_keymap

-- buffer operations
keymap("n", "<leader>w", "<cmd>w<cr>", { noremap = true })
keymap("n", "<leader>c", ":bd<cr>", { noremap = true })
keymap("n", "<leader>C", ":bd!<cr>", { noremap = true })
keymap("n", "<leader>q", "<cmd>q<cr>", { noremap = true })

-- better navigation between windows
keymap("n", "<C-l>", "<C-W>l", { noremap = true })
keymap("n", "<C-h>", "<C-W>h", { noremap = true })
keymap("n", "<C-k>", "<C-W>k", { noremap = true })
keymap("n", "<C-j>", "<C-W>j", { noremap = true })

-- better window resizing:w
keymap("n", "<C-S-Up>",    ":resize +2<CR>", { noremap = true })
keymap("n", "<C-S-Down>",  ":resize -2<CR>", { noremap = true })
keymap("n", "<C-S-Left>",  ":vertical resize -2<CR>", { noremap = true })
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", { noremap = true })

-- navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", { noremap = true })
keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true })


---keep copied stuff in register
keymap("x", "<leader>p", "\"_dP", { noremap = true })


-- neo tree open/close
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { noremap = true })
keymap("n", "<leader>o", "<cmd>Neotree focus<cr>", { noremap = true })
