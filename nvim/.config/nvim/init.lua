vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.cmdheight = 0
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

-- pasting the same item multiple times
vim.keymap.set("x", "<leader>p", "\"_dP")
-- moving lines
vim.keymap.set({"v", "n"}, "J", "10j")
vim.keymap.set({"v", "n"}, "K", "10k")
-- disabling autocomment on new lines
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
-- diagnostics in floating window
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

