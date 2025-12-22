return {
    {
        "mason-org/mason.nvim",
        config=function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls",
                --"asm_lsp",
                "bashls",
                "hyprls",
                --"bsql",
                --"clanged",
                "pyright",
                "cssls",
                "cmake",
                --"atotools_ls",
            }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local keymap = vim.keymap
            vim.lsp.enable({'bashls', 'hyprls', 'pyright', 'cssls', 'cmake'})
            keymap.set('n', '<leader>ki', vim.lsp.buf.hover, {})
            keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end
    }
}
