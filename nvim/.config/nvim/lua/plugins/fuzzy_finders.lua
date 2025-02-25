return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "BurntSushi/ripgrep",
            {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
            {"debugloop/telescope-undo.nvim"}
        },
        config = function()
            local telescope = require "telescope"
            telescope.setup {
                defaults = {
                    file_ignore_patterns = { ".git/", ".venv/", ".ruff_cache/", ".pytest_cache/", ".coverage" },
                    layout_strategy='vertical'
                },
                pickers = {
                    find_files = {
                        hidden = true
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true, -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true, -- override the file sorter
                        case_mode = "smart_case" -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                },
                opts = {
                    extensions = {
                        undo = { side_by_side = false },  -- doesnt work
                    },
                },
            }
            telescope.load_extension("fzf")
            telescope.load_extension("undo")
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
            vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
            vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {})
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope undo<cr>")
        end
    },
}
