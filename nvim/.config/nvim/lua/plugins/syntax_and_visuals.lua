vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",  -- other plugins dependency
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
    "https://github.com/nvim-lualine/lualine.nvim",
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = "TSUpdate",
    },
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/RRethy/vim-illuminate",
    "https://github.com/OXY2DEV/markview.nvim",
})

vim.cmd.colorscheme("catppuccin-nvim")
-- override line number color to brighter one
vim.api.nvim_set_hl(0, 'LineNr', { fg='#6c7086' })

require("lualine").setup({
    -- add current filename to status line
    sections = { lualine_c = { { 'filename', path = 1 } } }
})

local setup_treesitter = function ()
    vim.api.nvim_create_autocmd("FileType", {
        callback = function()
            -- Enable treesitter highlighting and disable regex syntax
            pcall(vim.treesitter.start)
            -- Enable treesitter-based indentation
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })

    local ensureInstalled = { "lua", "python", "markdown", "markdown_inline", "yaml" }
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim.iter(ensureInstalled)
        :filter(function(parser)
            return not vim.tbl_contains(alreadyInstalled, parser)
        end)
        :totable()
    require("nvim-treesitter").install(parsersToInstall)
end

setup_treesitter()

require('ibl').setup({
    -- makes it more precise in python files
    scope = {
        show_start = false,
        highlight = "LineNr",
        include = {
            node_type = { ["python"] = { "*" } },
        }
    }
})

require("markview").setup()
