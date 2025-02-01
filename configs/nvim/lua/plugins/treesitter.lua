return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
