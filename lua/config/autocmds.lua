-- Automated commands


-- Tab settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Set working dir and session
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        local oil = require("oil")
        local persistence = require("persistence")

        vim.schedule(function() -- Delay execution to ensure plugins are fully initialized
            local dir = oil.get_current_dir()
            if dir then
                vim.cmd("cd " .. dir)
                persistence.load()
            end
        end)
    end,
    desc = "Automatically set cwd to Oil's current directory and restore session on VimEnter",
})
