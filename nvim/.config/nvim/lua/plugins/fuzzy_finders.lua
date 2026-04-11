vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua"
})

require("fzf-lua").setup({
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

vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep_visual<CR>")
vim.keymap.set("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>")
vim.keymap.set("n", "<leader>fu", "<cmd>FzfLua undotree<CR>")
vim.keymap.set("n", "<leader>fj", "<cmd>FzfLua jumps<CR>")
vim.keymap.set("n", "<leader>/", "<cmd>FzfLua combine pickers=files;grep_visual<CR>")

-- todo 
--             {"debugloop/telescope-undo.nvim"}
--                     aerial = {
--                         -- Set the width of the first two columns (the second
--                         -- is relevant only when show_columns is set to 'both')
--                         col1_width = 4,
--                         col2_width = 30,
--                         -- How to format the symbols
--                         format_symbol = function(symbol_path, filetype)
--                             if filetype == "json" or filetype == "yaml" then
--                                 return table.concat(symbol_path, ".")
--                             else
--                                 return symbol_path[#symbol_path]
--                             end
--                         end,
--                         -- Available modes: symbols, lines, both
--                         show_columns = "both",
--                     },
--                 },
--                 opts = {
--                     extensions = {
--                         undo = { side_by_side = false },  -- doesnt work
--                     },
--                 },
--             }
--             telescope.load_extension("aerial")
