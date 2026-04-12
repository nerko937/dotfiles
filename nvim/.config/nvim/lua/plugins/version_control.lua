vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/akinsho/git-conflict.nvim",
    "https://github.com/Pocco81/auto-save.nvim",
})

local gitsigns = require("gitsigns")
gitsigns.setup()
vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk)
vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk)
vim.keymap.set('v', '<leader>hr', gitsigns.reset_hunk)

require("git-conflict").setup()
require('auto-save').setup({ write_all_buffers = false })
