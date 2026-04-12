vim.pack.add({
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/rmagatti/goto-preview",
})

require("oil").setup({
    view_options = {
        show_hidden = true,
    },
})

local goto_preview = require("goto-preview")
goto_preview.setup()
vim.keymap.set("n", "gp", goto_preview.goto_preview_definition)
