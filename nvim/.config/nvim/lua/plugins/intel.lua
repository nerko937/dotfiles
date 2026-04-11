vim.pack.add({
    "https://github.com/rmagatti/goto-preview",
})

require("goto-preview").setup()

vim.keymap.set("n", "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap=true})
-- return {
--     {
--         "rmagatti/goto-preview",
--         event = "BufEnter",
--         config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
--         keys = {
--             { "gp", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "n" }
--         }
--     },
--     {
--         'stevearc/aerial.nvim',
--         opts = {},
--         dependencies = {
--             "nvim-treesitter/nvim-treesitter",
--         },
--     }
-- }
