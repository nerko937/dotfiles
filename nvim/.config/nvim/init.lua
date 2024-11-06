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
vim.opt.guicursor = ""
vim.opt.scrolloff = 10
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.g.copilot_enabled = false

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

-- vatiations of A kaymap
vim.keymap.set("n", "<leader>a", "$i")
vim.keymap.set("n", "<leader>A", "$hi")
-- pasting the same item multiple times
vim.keymap.set("x", "<leader>p", "\"_dP")
-- disabling autocomment on new lines
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
-- diagnostics in floating window
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- autosave
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
  callback = function()
    if vim.bo.modified and not vim.bo.readonly and vim.fn.expand("%") ~= "" and vim.bo.buftype == "" then
      vim.api.nvim_command('silent update')
    end
  end,
})

-- netrw lines
vim.g.netrw_bufsettings = 'noma nomod nu rnu nobl nowrap ro'
