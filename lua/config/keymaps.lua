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
vim.keymap.set("n", "<C-k>", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fm", builtin.marks, { desc = "Marks" })
vim.keymap.set("n", "<leader>fr", builtin.registers, { desc = "Registers" })
vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter Symbols" })
vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Commands" })

-- Aerial
vim.keymap.set("n", "<C-s>", "<cmd>Telescope aerial<CR>", { desc = "Search Aerial Symbols" })

-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set({ "n", "v" }, "<leader>c", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- Sessions
vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end,
    { desc = "Load session for the current directory" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc = "Select a session to load" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end,
    { desc = "Load the last session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end,
    { desc = "Stop session persistence (no auto-save on exit)" })

-- Neotest Keybindings
vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true, desc = "Run Test Nearest" })
vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true, desc = "Run Test File" })
vim.keymap.set("n", "<leader>s", ":TestSuite<CR>", { silent = true, desc = "Run Test Suite" })
vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true, desc = "Run Last Test" })
vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true, desc = "Visit Last Test File" })

-- LSP
vim.keymap.set('n', '<leader>r', vim.lsp.buf.format, {})

-- Neorg
vim.keymap.set("n", "<leader>nn", "<cmd>Neorg workspace notes<CR>", { desc = "Open Neorg Notes Workspace" })

-- Marks
vim.keymap.set("n", "<leader>m", ":MarksListAll<CR>", { silent = true, desc = "Show all marks in open buffers" })

-- Vim
vim.keymap.set('n', '<leader>nr', ':set relativenumber!<CR>', { desc = "Toggle Relative Numbers" })
vim.keymap.set('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-l>', '<Right>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '<Up>', { noremap = true, silent = true })
