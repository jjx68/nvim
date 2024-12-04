return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                --lua
                -- null_ls.builtins.formatting.ast_grep,
                --javascript
                -- null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.diagnostics.eslint_d,
                --python
                -- null_ls.builtins.formatting.ast_grep,
                -- null_ls.builtins.formatting.black,
                -- null_ls.builtins.formatting.isort,
                --ruby
                -- null_ls.builtins.diagnostics.rubocop,
                -- null_ls.builtins.formatting.rubocop,
            }
        })
    end
}
