local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<Esc>"] = actions.close,
            },
            n = {
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["q"] = actions.close,
            },
        },
    },
})

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Telescope grep string" })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Telescope git status" })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Telescope git commits" })
vim.keymap.set('n', '<leader>gd', builtin.git_bcommits, { desc = "Telescope git buffer diffs" })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Telescope git branches" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope git files" })
