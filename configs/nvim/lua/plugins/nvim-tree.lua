return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup {
			view = {
				width = 35,
				relativenumber = true,
				side = "right",
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					git_placement = "signcolumn",
					web_devicons = { folder = { enable = true }, },
					glyphs = { folder = {
						arrow_closed = " ",
						arrow_open = " ",
					},
				},
			},
		},
		filters = { custom = { ".DS_Store" } },
		git = { ignore = false },
	}
end,
}
