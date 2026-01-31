local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")
local luasnip = require("luasnip")

mason.setup()
mason_lspconfig.setup({
    ensure_installed = { "pyright", "rust_analyzer", "gopls", "terraformls" },
})

-- 1. Setup Completion (remains largely the same)
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),
})

-- 2. Modern Keymap Setup (Replaces on_attach)
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    end,
})

-- 3. Configure Servers using the new API
local capabilities = cmp_lsp.default_capabilities()

-- Set global capabilities for all servers
vim.lsp.config("*", { capabilities = capabilities })

-- Apply specific settings from our new files
vim.lsp.config("pyright", require("anxiouscat.lsp_settings.pyright"))
vim.lsp.config("rust_analyzer", require("anxiouscat.lsp_settings.rust_analyzer"))

-- 4. Enable the servers
vim.lsp.enable({ "pyright", "rust_analyzer", "gopls", "terraformls" })

-- 5. Diagnostic Config (remains the same)
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
        focused = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

