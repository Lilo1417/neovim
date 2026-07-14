return {
    {
        "hrsh7th/cmp-nvim-lsp",

    },
    {
        'L3MON4D3/LuaSnip',

         config = function ()
                    -- Load snippets from ~/.config/nvim/LuaSnip/
                    require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/lua/plugins/LuaSnip/"})
                    -- Somewhere in your Neovim startup, e.g. init.lua
                    require("luasnip").config.set_config({ -- Setting LuaSnip config

                      -- Enable autotriggered snippets
                      enable_autosnippets = true,
                      update_events = 'TextChanged,TextChangedI',

                      -- Use Tab (or some other key if you prefer) to trigger visual selection
                      store_selection_keys = "<Tab>",
                      vim.cmd[[
                      " Expand or jump in insert mode
                        imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 

                        " Jump forward through tabstops in visual mode
                        smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'
                        " Jump backward through snippet tabstops with Shift-Tab (for example)
                        imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
                        smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

                        " Cycle forward through choice nodes with Control-f (for example)
                        imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
                        smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'

                        ]]
                    })

                end,

        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            "rafamadriz/friendly-snippets"
        }
    },
    {
    "hrsh7th/nvim-cmp",
    config = function()
        local cmp = require'cmp'
        require("luasnip.loaders.from_vscode").lazy_load()

          cmp.setup({
            snippet = {
              expand = function(args)
                  require("luasnip").lsp_expand(args.body)
              end,
            },
            window = {
                      completion = cmp.config.window.bordered(),
                      documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
              ['<C-i>'] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.jumpable(1) then
                    luasnip.jump(1)
                  else
                    fallback()
                  end
            end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' },
            }, {
              { name = 'buffer' },
            })
          })
    end,
}
}
