vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/nvim-tree/nvim-web-devicons",  -- lualine dep
    "https://github.com/nvim-lualine/lualine.nvim",
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = "TSUpdate",
    },
    -- "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/RRethy/vim-illuminate",
})

vim.cmd.colorscheme("catppuccin-nvim")
override line number color to brighter one
vim.api.nvim_set_hl(0, 'LineNr', { fg='#6c7086' })

require("lualine").setup({
    -- add current filename to status line
    sections = { lualine_c = { { 'filename', path = 1 } } }
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

local ensureInstalled = { 'lua', 'python' }
local alreadyInstalled = require('nvim-treesitter.config').get_installed()
local parsersToInstall = vim.iter(ensureInstalled)
    :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
    end)
    :totable()
require('nvim-treesitter').install(parsersToInstall)

-- "https://github.com/lukas-reineke/indent-blankline.nvim",
-- require("ibl").setup({
    -- enable in python
    -- scope = {
    --     show_start = false,
    --     highlight = "LineNr",
    --     include = {
    --         node_type = { ["python"] = { "*" } },
    --     }
    -- }
-- })

-- return {
--     {
--         "nvim-treesitter/nvim-treesitter",
--         build = ":TSUpdate",
--         config = function()
--             local configs = require "nvim-treesitter.configs"
--             configs.setup {
--                 ensure_installed = {
--                     "bash",
--                     "html",
--                     "lua",
--                     "luadoc",
--                     "markdown",
--                     "markdown_inline",
--                     "vim",
--                     "vimdoc",
--                     "dockerfile",
--                     "json",
--                     "yaml",
--                     "python",
--                     "javascript",
--                     "typescript",
--                     "rust",
--                 },
--                 highlight = {
--                     enable = true
--                 }
--             }
--         end
--     },
--     {
--         "OXY2DEV/markview.nvim",
--         lazy = false,
--         ft = { "md" },
--         dependencies = {
--             "nvim-treesitter/nvim-treesitter",
--             "nvim-tree/nvim-web-devicons"
--         },
--     },
-- }
