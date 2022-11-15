local o = vim.opt
local g = vim.g

o.backup = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = { "menu", "menuone", "noselect" }
o.conceallevel = 0
o.fileencoding = "utf-8"
o.hlsearch = true
o.ignorecase = true
o.mouse = "a"
o.pumheight = 10
o.showmode = false
o.showtabline = 0
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.termguicolors = true
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 300
o.writebackup = false
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.cursorline = true
o.number = true
o.laststatus = 3
o.showcmd = false
o.ruler = false
o.numberwidth = 4
o.signcolumn = "yes"
o.wrap = true
o.scrolloff = 8
o.sidescrolloff = 8
o.guifont = "monospace:h17"
o.fillchars = { eob = " " }
o.fcs = "eob: "
o.autoread = true
o.shell = "fish"
o.shortmess:append "c"
o.whichwrap:append("<,>,[,],h,l")
o.iskeyword:append("-")
o.guicursor = "i:block"

g.loaded_perl_provider = 0
g.loaded_node_provider = 0
g.loaded_ruby_provider = 0

vim.cmd [[au FocusGained * :checktime]]
vim.cmd [[:set nosplitright]]
vim.cmd[[highlight Normal guifg=none guibg=none]]
