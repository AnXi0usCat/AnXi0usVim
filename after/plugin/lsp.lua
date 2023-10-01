local lsp = require('lsp-zero').preset({
    name = 'recommended',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = true,
})

lsp.ensure_installed({
    'pyright',
    'rust_analyzer',
    'gopls'
})

--local cmp = require('cmp')
--local cmp_select = { behavior = cmp.SelectBehaviour.Select }
--local cmp_mappings = lsp.defaults.cmp_mappings({
--    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--    ['<C-y>'] =  cmp.mapping.confrm({ select = true}),
--    ['<C-Space>'] = cmp.mapping.complete(),
--})

lsp.configure('pyright', {
    settings = {completions = {
        completeFunctionCalls = true
    },
    python = {
        analysis = {
            autoSearchPaths = true,
            diagnosticMode = "workspace",
            useLibraryCodeForTypes = true
        }
    }
}
})

lsp.configure('black', {

    settings = {completions = {
        completeFunctionCalls = true
    }}
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    everity_sort = true,
    float = {
        focused = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})
