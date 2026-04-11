vim.pack.add({
    { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
    "https://github.com/github/copilot.vim",
    "https://github.com/m4xshen/autoclose.nvim",
})
-- disable copilot on startup
vim.g.copilot_enabled = false

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
        -- todo, change to rust once it becomes mature enough to support vim.pack
        implementation = "lua",
    }
})

require("autoclose").setup({
    options = {
        disabled_filetypes = { "text", "markdown" },
        disable_when_touch = false,
    }
})
