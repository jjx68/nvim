local function random_quote()
    local quotes = {
        "Talk is cheap. Show me the code. - Linus Torvalds",
        "Code is like humor. When you have to explain it, it's bad. - Cory House",
        "Programming isn't about what you know; it's about what you can figure out. - Chris Pine",
        "Fix the cause, not the symptom. - Steve Maguire",
        "First, solve the problem. Then, write the code. - John Johnson",
        "Any fool can write code that a computer can understand. Good programmers write code that humans can understand. - Martin Fowler",
        "Simplicity is the soul of efficiency. - Austin Freeman",
        "I'm not a great programmer; I'm just a good programmer with great habits. - Kent Beck",
    }

    -- Select a random quote
    return quotes[math.random(#quotes)]
end

return {
    "nvimdev/dashboard-nvim",
    --event = "VimEnter",
    cond = function()
        -- check if there is any content in the current buffer.
        local is_stdin_empty = vim.fn.line2byte('$') == -1
        -- check if arguments were passed to Neovim.
        local has_no_args = vim.fn.argc() == 0
        return is_stdin_empty and has_no_args
    end,
    config = function()
        local function sync_projects_with_dashboard()
            -- Paths for project.nvim and Dashboard
            local project_nvim_file = vim.fn.stdpath("data") .. "/project_nvim/project_history"
            local dashboard_projects_file = vim.fn.stdpath("cache") .. "/dashboard/cache"

            -- Read `project.nvim` history
            local project_lines = {}
            local project_file = io.open(project_nvim_file, "r")
            if project_file then
                for line in project_file:lines() do
                    table.insert(project_lines, line)
                end
                project_file:close()
            end

            -- Write to Dashboard's recent_projects file
            local dashboard_file = io.open(dashboard_projects_file, "w")
            if dashboard_file then
                dashboard_file:write("return " .. vim.inspect(project_lines))
                dashboard_file:close()
            end
        end


        -- Sync on startup
        sync_projects_with_dashboard()

        require("dashboard").setup({
            theme = "hyper", -- Use the hyper theme
            config = {
                header = {
                    "⠀⠀⢀⣤⣶⣾⣿⣿⣿⣶⣶⣐⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣔⢒⣛⣓⣲⢄⡀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⣴⣿⣿⣿⣿⣿⡿⣿⣿⣿⣿⣝⠛⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣷⣿⣿⣿⣿⡻⢿⣿⣷⠀⠀⠀⠀⠀⠀",
                    "⠼⣿⣿⣿⣿⣿⣿⣷⣦⣼⣿⡿⣿⣆⢹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣧⣩⣿⣷⠀⠙⢿⡇⠀⠀⠀⠀⠀",
                    "⠀⢿⣿⡿⣿⣿⣿⣿⣿⣿⣿⡇⠀⢿⡆⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢜⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢸⣇⠀⠀⠀⠀⠀",
                    "⠀⠘⣿⣷⣿⣿⣿⣿⠻⣿⣿⢁⣀⣈⣷⡽⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠹⣧⣼⣿⣿⣿⣿⡟⠀⠀⢸⡏⠀⠀⠀⠀⠀",
                    "⠀⠀⠈⢻⣿⣿⣿⡟⠛⠉⠁⠀⠀⠚⠁⠁⣀⠀⢀⣀⣤⣤⣧⣄⠀⣄⠀⠀⠂⠀⠈⠛⠿⣿⣿⠋⠀⠀⣠⠞⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣇⣨⠿⠛⠛⠉⠉⠉⠛⠿⣇⠀⠀⠀⠀⠀⠀⠉⠉⠓⠋⠁⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢿⣶⣖⠤⠀⠀⠀⠀⢀⣹⡏⠇⠀⠀⠀⣀⠀⢀⠔⠀⢀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⡠⠊⡡⠒⣁⠔⢁⠠⠀⠀⠀⠀⠀⠀⠀⠉⢻⣷⣄⣀⣠⣴⡿⠛⠁⠀⢀⠴⠊⡠⠖⠁⡠⠖⠁⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠐⠋⠐⠊⠀⠊⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⢿⣿⣛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠊⠀⠐⠊⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⢀⣣⣾⣷⡀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡴⠟⠛⠉⠉⠛⣷⣬⡑⠄⠈⠐⠈⠒⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠛⠉⠀⠀⠀⠀⠀⠀⠉⠈⠻⠀⠀⠀⠀⠀⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢄⠀⠀⠀⠀⠀⠀⠀⠁⢀⡀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠆⠀⠀⠀⠀⠀⠀⠀⠀⠙⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
                    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤",
                },
                shortcut = {
                    { desc = "Find File",       group = "@property", key = "f", action = "Telescope find_files" },
                    { desc = "Recent Files",    group = "@property", key = "r", action = "Telescope oldfiles" },
                    { desc = "Projects",        group = "@property", key = "p", action = "Telescope projects" },
                    { desc = "Restore Session", group = "@property", key = "s", action = "require('persistence').select()" },
                },
                packages = { enable = true },
                --project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
                project = {
                    enable = true,
                    limit = 4,
                    icon = "📂",
                    label = "Recent Projects:",
                    action = function(path)
                        local persistence = require("persistence")

                        -- Check if the path is a directory
                        if vim.fn.isdirectory(path) == 1 then
                            vim.cmd("cd " .. path) -- Change to the directory
                            vim.cmd("Oil .")       -- Open Oil if configured

                            -- Attempt to load the session for the directory
                            persistence.load()
                        else
                            -- Open the file directly
                            vim.cmd("edit " .. path)
                        end
                    end,
                },
                mru = { enable = true, limit = 8, icon = '📄', label = '', cwd_only = false },
                footer = { "", random_quote(), },
            },
        })
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
