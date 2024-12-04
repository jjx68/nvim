-- telescope.lua:
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        -- or                              , branch = '0.1.x',
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    cwd = vim.fn.getcwd(),
                    path_display = { "smart" },
                    sorting_strategy = "ascending",
                    mappings = {
                        i = {                                                           -- Insert mode keymaps
                            ["<C-t>"] = require("telescope.actions").select_tab,        -- Open entry in a new tab
                            ["<C-v>"] = require("telescope.actions").select_vertical,   -- Open entry in a vertical split
                            ["<C-o>"] = require("telescope.actions").select_horizontal, -- Open entry in a horizontal split
                        },
                        n = {                                                           -- Normal mode keymaps
                            ["t"] = require("telescope.actions").select_tab,            -- Open entry in a new tab
                            ["v"] = require("telescope.actions").select_vertical,       -- Open entry in a vertical split
                            ["o"] = require("telescope.actions").select_horizontal,     -- Open entry in a horizontal split
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    aerial = {
                        -- Set the width of the first two columns (the second
                        -- is relevant only when show_columns is set to 'both')
                        col1_width = 4,
                        col2_width = 30,
                        -- How to format the symbols
                        format_symbol = function(symbol_path, filetype)
                            if filetype == "json" or filetype == "yaml" then
                                return table.concat(symbol_path, ".")
                            else
                                return symbol_path[#symbol_path]
                            end
                        end,
                        -- Available modes: symbols, lines, both
                        show_columns = "both",
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            require("telescope").load_extension("harpoon")
            require('telescope').load_extension('projects')
        end,
    },
}
