require("config")
-- this installs all plugins from lockfile at once,
-- on initial setup prevents from prompting for install confirmation multiple times
vim.pack.add({})
-- require treesitter and colorscheme first since other plugins depends on it
require("plugins.syntax_and_visuals")
require("plugins.completions")
require("plugins.lsp")
require("plugins.navigation")
require("plugins.pickers")
require("plugins.version_control")
