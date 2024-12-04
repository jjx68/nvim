-- Options

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"

vim.opt.number = true
vim.opt.cursorline = true

-- Enable Treesitter folding
vim.opt.foldmethod = "expr"                     -- Use expression for folding
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding
vim.opt.foldenable = false                      -- Disable folding at startup

-- Configure session options
vim.o.sessionoptions = "buffers,curdir,tabpages,winsize,folds"
