return {
    'hrsh7th/nvim-cmp',
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-buffer', -- source for text in buffer
        'hrsh7th/cmp-path', -- source for file system paths
        'L3MON4D3/LuaSnip', -- snippet engine
        'saadparwaiz1/cmp_luasnip', -- for autocompletion
        'rafamadriz/friendly-snippets', -- useful snippets
    },
    config = function()
        local cmp = require("cmp")

        local luasnip = require("luasnip")

        -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            completion = {
                completeopt = "menu,menuone,preview,noselect",
            },
            snippet = { 
                -- REQUIRED - you must specify a snippet engine
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
                ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
                ["<C-b>"] = cmp.mapping.scroll_docs(-4), -- scroll up in preview docs
                ["<C-f>"] = cmp.mapping.scroll_docs(4), -- scroll down in preview docs
                ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
                ["<C-e>"] = cmp.mapping.abort(), -- close completion windows
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                -- order dictates recommendation order
                { name = 'luasnip' }, -- snippets
                { name = 'buffer' }, -- text within current buffer
                { name = 'path' }, -- file system paths
            })
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                    { name = "cmdline" },
                }),
        })
    end,
}
