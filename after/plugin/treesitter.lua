-- 1. Wrap the require in a 'pcall' (protected call)
-- This stops the "module not found" error from crashing your startup
local status, ts_configs = pcall(require, "nvim-treesitter.configs")
if not status then
    return -- Exit quietly if Treesitter isn't ready yet
end

-- 2. Your existing configuration
ts_configs.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "rust", "python" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
