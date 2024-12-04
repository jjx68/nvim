return {
	{
		"stevearc/aerial.nvim",
		opts = {}, -- Leave this empty since we define options in `setup`
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("aerial").setup({
				backends = { "treesitter", "lsp", "markdown" }, -- Use Treesitter first, fallback to LSP
				layout = {
					default_direction = "prefer_right", -- Display Aerial on the right if possible
					placement = "window", -- Attach to the current window
				},
				show_guides = true, -- Show nested hierarchy guides
				filter_kind = false, -- Show all symbol kinds
				treesitter = {
					update_delay = 200, -- Delay before updating symbols
				},
			})
		end,
	},
}
