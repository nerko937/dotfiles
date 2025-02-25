return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
        },
        config = function()
            -- `:help cmp`
            local cmp = require "cmp"
            local luasnip = require "luasnip"
            luasnip.config.setup {}
            cmp.setup {
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end
                },
                completion = {completeopt = "menu,menuone,noinsert"},
                -- :help ins-completion`
                mapping = cmp.mapping.preset.insert {
                    ["<Enter>"] = cmp.mapping.confirm {select = true},
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<C-j>"] = cmp.mapping.select_next_item(),
                    ["<C-k>"] = cmp.mapping.select_prev_item(),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" }
                }
            }
        end,
    },
    {"github/copilot.vim"},
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "kiyoon/python-import.nvim",
        build = "uv tool install . --force --reinstall",
        keys = {
            {
                "<M-CR>",  -- alt + enter
                function()
                    require("python_import.api").add_import_current_word_and_notify()
                end,
                mode = { "i", "n" },
                silent = true,
                desc = "Add python import",
                ft = "python",
            },
            {
                "<M-CR>",
                function()
                    require("python_import.api").add_import_current_selection_and_notify()
                end,
                mode = "x",
                silent = true,
                desc = "Add python import",
                ft = "python",
            },
            {
                "<space>i",
                function()
                    require("python_import.api").add_import_current_word_and_move_cursor()
                end,
                mode = "n",
                silent = true,
                desc = "Add python import and move cursor",
                ft = "python",
            },
            {
                "<space>i",
                function()
                    require("python_import.api").add_import_current_selection_and_move_cursor()
                end,
                mode = "x",
                silent = true,
                desc = "Add python import and move cursor",
                ft = "python",
            },
            {
                "<space>tr",
                function()
                    require("python_import.api").add_rich_traceback()
                end,
                silent = true,
                desc = "Add rich traceback",
                ft = "python",
            },
        },
        opts = {
            extend_lookup_table = {
                ---@type string[]
                import = {
                    -- "tqdm",
                },

                ---@type table<string, string>
                import_as = {
                    -- These are the default values. Here for demonstration.
                    -- np = "numpy",
                    -- pd = "pandas",
                },

                ---@type table<string, string>
                import_from = {
                    timezone = "django.utils",
                    Pattern = "apps.allsafe.models",
                    -- tqdm = nil,
                    -- tqdm = "tqdm",
                },

                ---@type table<string, string[]>
                statement_after_imports = {
                    -- logger = { "import my_custom_logger", "", "logger = my_custom_logger.get_logger()" },
                },
            },
        },
    },
}
