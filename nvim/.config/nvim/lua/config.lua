-- colors
vim.opt.termguicolors = true
-- disabling autocomment on new lines
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
-- set leader key
vim.g.mapleader = " "
-- line numbers config
vim.opt.number = true
vim.opt.relativenumber = true
-- cursorline
vim.opt.cursorline = true
-- don't wrap text to newline
vim.opt.wrap = false
-- scrolloff numbers
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
-- use system clipboard
vim.opt.clipboard = "unnamedplus"
-- status line config
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
-- search eg. with / options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
-- show column on specific char count
vim.opt.colorcolumn = "120"
-- backup settings
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- completion timeouts
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
-- reload file when other process writes to it
vim.opt.autoread = true
-- enable new command ui
require("vim._core.ui2").enable({})
-- vatiations of A kaymap
vim.keymap.set("n", "<leader>a", "$i")
vim.keymap.set("n", "<leader>A", "$hi")
-- open parent directory relative to current buffer
vim.keymap.set("n", "<leader>.", function() vim.cmd.e("%:h") end)
-- diagnostics options
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.diagnostic.config({virtual_text = true})
-- go to definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition)

-- probably to be deleted
-- wrap with parenthesis
vim.keymap.set("n", "<leader>w", "ciw\"\"<esc>P")
-- goto implementation in split
vim.keymap.set("n", "<leader>gd", "<cmd>vsplit<cr><cmd>lua vim.lsp.buf.definition()<cr>")
-- yank highlight
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
