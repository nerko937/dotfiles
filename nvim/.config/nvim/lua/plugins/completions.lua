vim.pack.add({
    { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
    "https://github.com/github/copilot.vim",
    "https://github.com/m4xshen/autoclose.nvim",
    "https://github.com/Wansmer/treesj",
})

require('blink.cmp').setup({
    keymap = { preset = 'enter' },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = false }
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        -- can't make it working with rust,
        -- might be because of lack of examples with vim.pack
        implementation = "lua",
    }
})

-- disable copilot on startup
vim.g.copilot_enabled = false

require("autoclose").setup({
    options = {
        disabled_filetypes = { "text", "markdown", "fzf" },
        disable_command_mode = true,
        disable_when_touch = true,
    }
})

local treesj = require("treesj")
treesj.setup()
vim.keymap.set("n", "<leader>m", treesj.toggle)
