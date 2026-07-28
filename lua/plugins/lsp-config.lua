return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"bashls",
				"hyprls",
				"pyright",
				"cssls",
                "qmlls",
				"clangd",
				"codelldb",
				"clang_format",
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.diagnostic.config({
				virtual_text = true, -- show message inline
				signs = true, -- show symbols in the gutter
				underline = true, -- underline problematic code
				update_in_insert = false,
				severity_sort = true,
			})

			-- Define servers (NO lspconfig)
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})

            vim.lsp.config("qmlls", {
              cmd = {"qmlls"},
              capabilities = capabilities,
            })

			vim.lsp.config("hyprls", {
				capabilities = capabilities,
			})

			vim.lsp.config("pyright", {
				capabilities = capabilities,
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})

			-- vim.lsp.config("cmake", {
			-- 	capabilities = capabilities,
			-- })
			vim.lsp.config("clangd", {
				cmd = { "clangd", "--query-driver=/usr/bin/clang++,/usr/bin/g++" },
				capabilities = capabilities,
			})

			-- Enable servers
			vim.lsp.enable({
				"lua_ls",
				"bashls",
				"hyprls",
				"pyright",
				"cssls",
				"cmake",
			})

			-- Keymaps
			local keymap = vim.keymap
			keymap.set("n", "<leader>ki", vim.lsp.buf.hover)
			keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
			keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		end,
	},
}
