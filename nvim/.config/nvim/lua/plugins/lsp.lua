vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "pyright",
        "lua_ls",
    },
})

vim.lsp.config("pyright", {
    settings = {
        python = {
            pythonPath = "./.venv/bin/python",
            analysis = {
                typeCheckingMode = "off",
            },
        },
    }
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
