vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/akinsho/git-conflict.nvim",
})

vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', {})
vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', {})
vim.keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', {})

require("git-conflict").setup()

-- return {
--     {
--         "lewis6991/gitsigns.nvim",
--         config = function()
--             require("gitsigns").setup{
--                 on_attach = function(client)
--                     vim.keymap.set('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>', {})
--                     vim.keymap.set('n', '<leader>hr', ':Gitsigns reset_hunk<CR>', {})
--                     vim.keymap.set('v', '<leader>hr', ':Gitsigns reset_hunk<CR>', {})
--                 end,
--             }
--         end
--     },
--     {'mbbill/undotree'},
--     {'akinsho/git-conflict.nvim', version = "*", config = true},
-- }
