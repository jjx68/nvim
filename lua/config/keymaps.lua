-- Key mappings

-- Vim-Tmux Navigation
vim.keymap.set('n', '<C-h>', '<cmd>TmuxNavigateLeft<CR>', { desc = "Navigate Left (Tmux/Vim)" })
vim.keymap.set('n', '<C-j>', '<cmd>TmuxNavigateDown<CR>', { desc = "Navigate Down (Tmux/Vim)" })
vim.keymap.set('n', '<C-k>', '<cmd>TmuxNavigateUp<CR>', { desc = "Navigate Up (Tmux/Vim)" })
vim.keymap.set('n', '<C-l>', '<cmd>TmuxNavigateRight<CR>', { desc = "Navigate Right (Tmux/Vim)" })
vim.keymap.set('n', '<C-\\>', '<cmd>TmuxNavigatePrevious<CR>', { desc = "Navigate to Previous (Tmux/Vim)" })

-- Oil
vim.keymap.set("n", "<C-n>", function()
    local oil = require("oil")
    oil.open_float()
    oil.open_preview()
end, { desc = "Open Oil Float with Preview" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
vim.keymap.set("n", "<C-i>", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })
vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter Symbols" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })

-- Aerial
vim.keymap.set("n", "<leader>fa", "<cmd>Telescope aerial<CR>", { desc = "Search Aerial Symbols" })

-- Harpoon
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
local harpoon_tmux = require("harpoon.tmux")
local harpoon_cmd_ui = require("harpoon.cmd-ui")
vim.keymap.set("n", "<leader>a", harpoon_mark.add_file, { desc = "Add File to Harpoon" })
vim.keymap.set("n", "<leader>h", harpoon_ui.toggle_quick_menu, { desc = "Harpoon Menu" })
vim.keymap.set("n", "<leader>1", function() harpoon_ui.nav_file(1) end, { desc = "Harpoon File 1" })
vim.keymap.set("n", "<leader>2", function() harpoon_ui.nav_file(2) end, { desc = "Harpoon File 2" })
vim.keymap.set("n", "<leader>3", function() harpoon_ui.nav_file(3) end, { desc = "Harpoon File 3" })
vim.keymap.set("n", "<leader>4", function() harpoon_ui.nav_file(4) end, { desc = "Harpoon File 4" })
vim.keymap.set("n", "<leader>5", function() harpoon_ui.nav_file(5) end, { desc = "Harpoon File 5" })
vim.keymap.set("n", "<leader>m", function() harpoon_cmd_ui.toggle_quick_menu() end, { desc = "Harpoon Command Menu" })
vim.keymap.set("n", ";1", function() harpoon_tmux.sendCommand(1, 1) end, { desc = "Harpoon Command 1" })
vim.keymap.set("n", ";2", function() harpoon_tmux.sendCommand(1, 2) end, { desc = "Harpoon Command 2" })
vim.keymap.set("n", ";3", function() harpoon_tmux.sendCommand(1, 3) end, { desc = "Harpoon Command 3" })
vim.keymap.set("n", ";4", function() harpoon_tmux.sendCommand(1, 4) end, { desc = "Harpoon Command 4" })
vim.keymap.set("n", ";5", function() harpoon_tmux.sendCommand(1, 5) end, { desc = "Harpoon Command 5" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- Sessions
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Load session for the current directory" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select a session to load" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc = "Load the last session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop session persistence (no auto-save on exit)" })

-- Neotest Keybindings
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true, desc = "Run Test Nearest" })
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true, desc = "Run Test File" })
vim.keymap.set("n", "<leader>s", ":TestSuite<CR>", { silent = true, desc = "Run Test Suite" })
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true, desc = "Run Last Test" })
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true, desc = "Visit Last Test File" })

-- LSP
vim.keymap.set('n', '<leader>r', vim.lsp.buf.format, {})

-- Vim
vim.keymap.set('n', '<leader>n', ':set relativenumber!<CR>', { desc = "Toggle Relative Numbers" })
