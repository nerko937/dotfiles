return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme catppuccin-mocha]])
            vim.api.nvim_set_hl(0, 'LineNr', { fg='#6c7086' })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        opts = {
            options = { theme = "catppuccin" },
            sections = { lualine_c = { { 'filename', path = 1 } } }
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require "nvim-treesitter.configs"
            configs.setup {
                ensure_installed = {
                    "bash",
                    "html",
                    "lua",
                    "luadoc",
                    "markdown",
                    "markdown_inline",
                    "vim",
                    "vimdoc",
                    "dockerfile",
                    "json",
                    "yaml",
                    "python",
                    "javascript",
                    "typescript",
                    "rust",
                },
                highlight = {
                    enable = true
                }
            }
        end
    },
    { 'RRethy/vim-illuminate' },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        ft = { "md" },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        -- config = function()
        --     require("markview").setup({})
        -- end
    }
}
