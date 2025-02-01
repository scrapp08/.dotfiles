return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		local transparent = true

		require("onedark").setup({
			style = "dark",
		})

		vim.cmd("colorscheme onedark")
	end,
}
