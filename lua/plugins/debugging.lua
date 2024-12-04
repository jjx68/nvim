return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio",

        --languages
        "leoluz/nvim-dap-go",
        "mfussenegger/nvim-dap-python",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        require("dapui").setup()

        require("dap-go").setup()
        require("dap-python").setup("python3")

        -- Python specific configuration
        --dap.configurations.python = {
        --	{
        --		type = "python",
        --		request = "launch",
        --		name = "Launch file",
        --		program = "${file}",
        --		pythonPath = "python3",
        --		justMyCode = false, -- Disable step filtering
        --	},
        --}

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        --vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
        --vim.keymap.set("n", "<Leader>dc", dap.continue, {})

        --vim.keymap.set("n", "<F5>", dap.continue, {})
        --vim.keymap.set("n", "<F10>", dap.step_over, {})
        --vim.keymap.set("n", "<F11>", dap.step_into, {})
        --vim.keymap.set("n", "<F12>", dap.step_out, {})

        --vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, {})
        --vim.keymap.set("n", "<Leader>B", function()
        --	require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        --end)
        --vim.keymap.set("n", "<Leader>db", require("dap").clear_breakpoints)

        --vim.keymap.set("n", "<Leader>dr", require("dap").restart)
        --vim.keymap.set("n", "<Leader>ds", require("dap").terminate)

        --vim.keymap.set("n", "<Leader>do", dap.repl.open, {})
        --vim.keymap.set("n", "<Leader>dl", dap.run_last, {})

        ----vim.keymap.set("n", "<Leader>di", require("dap.ui.variables").hover)
        --vim.keymap.set("n", "<Leader>de", function()
        --	require("dap").eval(vim.fn.input("Evaluate expression: "))
        --end)
    end,
}
