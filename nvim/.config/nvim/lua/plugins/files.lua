vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/Pocco81/auto-save.nvim",
})

require("oil").setup({
    view_options = {
        show_hidden = true,
    },
})

require('auto-save').setup({ write_all_buffers = false })
