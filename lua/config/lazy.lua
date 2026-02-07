-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 2. downlaod
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

-- 3. Prepend to runtime path
vim.opt.rtp:prepend(lazypath)

-- 4. Setup plugins
require("lazy").setup({
    -- Telescope
    { 'nvim-telescope/telescope.nvim', version = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Color scheme
    { 'rose-pine/neovim', name = 'rose-pine' },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- Simple plugins
    'mbbill/undotree',
    { 'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    'akinsho/toggleterm.nvim',

    -- LSP & Autocompletion
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lua',
    'L3MON4D3/LuaSnip',
    'rafamadriz/friendly-snippets',

    -- Neo-tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        }
    },

    -- Code Bridge
    "samir-roy/code-bridge.nvim"
})
