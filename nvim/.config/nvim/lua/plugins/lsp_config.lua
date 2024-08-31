return {
    {
        'vonheikemen/lsp-zero.nvim',
        branch = 'v3.x',
        config = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()
            lsp_zero.on_attach(function(client, bufnr)
                -- see :help lsp-zero-keybindings
                -- to learn the available actions
                lsp_zero.default_keymaps({buffer = bufnr})
            end)
        end
    },
    { 'neovim/nvim-lspconfig' },
    {
        'williamboman/mason.nvim',
        dependencies = { 'vonheikemen/lsp-zero.nvim' },
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { 'vonheikemen/lsp-zero.nvim' },
        config = function()
            require('mason').setup({})
            require('mason-lspconfig').setup({
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "rust_analyzer"
                },
                handlers = {
                    function(server_name)
                        require('lspconfig')[server_name].setup({})
                    end,
                    pyright = function()
                        require('lspconfig').pyright.setup({
                            before_init = function(_, config)
                                config.settings.python.pythonPath = "./.venv/bin/python"
                                config.settings.python.analysis.typeCheckingMode = "off"
                            end
                        })
                    end
                },
            })
        end
    },
}
