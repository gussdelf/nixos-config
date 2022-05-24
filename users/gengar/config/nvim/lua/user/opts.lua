local o = vim.opt
local g = vim.g
local a = 4

-- Indent
o.smartindent = true

-- I prefer tabs over spaces
o.expandtab = false
o.tabstop = a
o.shiftwidth = a

-- Clipboard
o.clipboard = "unnamedplus"

-- Mouse
o.mouse = "a"

-- Undo
o.undofile = true

-- Search
o.ignorecase = true
o.smartcase = true
o.incsearch = true

-- Filetypes
g.did_load_filetypes = 0
g.do_filetype_lua = 1

-- Python
g.python_host_prog = "/usr/bin/python"
g.python3_host_prog = "/usr/bin/python3"

-- Paren
o.showmatch = true
g.matchtime = 10

-- Grep
o.grepprg = "rg --vimgrep"

-- Others
o.formatoptions:remove { "c", "r", "o" }
o.compatible = false
o.so = 5
o.swapfile = false
o.shadafile = "NONE"
o.history = 10000
o.timeoutlen = 500
o.updatetime = 200
-- o.runtimepath = "$XDG_CONFIG_HOME/nvim,$VIMRUNTIME,$XDG_CONFIG_HOME/nvim/after,$XDG_CONFIG_HOME/nvim/spell,$XDG_CONFIG_HOME/nvim/lua"
