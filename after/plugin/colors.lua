function ColorMyPensils(color)
	c = c or "rose-pine"
	vim.cmd.colorscheme(c)

	vim.api.nvim_set_hl(0, "Normal", { bg = none, ctermbg=none })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = none, ctermbg=none })
end

ColorMyPensils()
