return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            defualt_file_explorer = true,
            keymaps = {
                ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
                ["<C-v>"] = {
                    "actions.select",
                    opts = { vertical = true },
                    desc = "Open the entry in a vertical split",
                },
                ["<C-h>"] = false,
                ["<C-o>"] = {
                    "actions.select",
                    opts = { horizontal = true },
                    desc = "Open the entry in a horizontal split",
                },
                ["<C-p>"] = false,
                ["<leader>p"] = "actions.preview",
            },
            float = {
                -- Add padding around the floating window
                padding = 2,
                -- Customize the floating window's size
                max_width = 0,
                max_height = 0,
                -- Add a border similar to Telescope
                border = "rounded", -- Options: "single", "double", "solid", "rounded"
                -- Enable transparency for the floating window
                preview_split = "right",
            },
            -- Automatically enable file previews
            view_options = {
                show_hidden = true,              -- Show hidden files by default
                is_hidden_file = function(name, _)
                    return name:sub(1, 1) == "." -- Mark files starting with "." as hidden
                end,
            },
        })
    end,
}
