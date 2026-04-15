vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/stevearc/aerial.nvim",
})

local fzf_lua = require("fzf-lua")
fzf_lua.setup({
    "telescope",
    fzf_colors = true,
    winopts = {
        preview = {
            vertical = "up:70%",
            layout = "vertical",
            scrollbar = "float",
        },
    },
    keymap = {
        builtin = {
            ["<c-space>"] = "toggle",
        },
        fzf = {
            ["ctrl-space"] = "toggle",
        },
    },
})

vim.keymap.set("n", "<leader>ff", fzf_lua.files)
vim.keymap.set("n", "<leader>fg", fzf_lua.live_grep)
vim.keymap.set("n", "<leader>fr", fzf_lua.lsp_references)
vim.keymap.set("n", "<leader>fu", fzf_lua.undotree)
vim.keymap.set("n", "<leader>fj", fzf_lua.jumps)
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua combine pickers=files;grep_project<CR>")

local aerial = require("aerial")
aerial.setup()
vim.keymap.set("n", "<leader>fi", aerial.fzf_lua_picker)
