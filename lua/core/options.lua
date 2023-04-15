local M = {}

M.load = function()
  local o = vim.opt
  local g = vim.g

  o.backup = false
  o.hlsearch = false
  o.ignorecase = true
  o.autoread = true
  o.showmode = false
  o.smartcase = true
  o.smartindent = true
  o.splitbelow = true
  o.splitright = true
  o.swapfile = false
  o.termguicolors = true
  o.undofile = true
  o.writebackup = false
  o.expandtab = true
  o.cursorline = true
  o.number = true
  o.showcmd = false
  o.ruler = false
  o.wrap = true
  o.number = false

  o.pumheight = 10
  o.cmdheight = 1
  o.conceallevel = 0
  o.showtabline = 0
  o.timeoutlen = 1000
  o.updatetime = 300
  o.shiftwidth = 2
  o.tabstop = 2
  o.laststatus = 3
  o.numberwidth = 4
  o.scrolloff = 8
  o.sidescrolloff = 8

  o.signcolumn = "yes"
  o.mouse = "a"
  o.fileencoding = "utf-8"
  o.clipboard = "unnamedplus"
  o.guifont = "monospace:h17"
  o.fcs = "eob: "
  o.shell = "zsh"
  o.guicursor = "i:block"

  o.colorcolumn = { 99 }
  o.fillchars = { eob = " " }
  o.completeopt = { "menu", "menuone", "noselect" }

  o.shortmess:append("c")
  o.whichwrap:append("<,>,[,],h,l")
  o.iskeyword:append("-")

  g.loaded_perl_provider = 0
  g.loaded_node_provider = 0
  g.loaded_ruby_provider = 0

  vim.cmd("au FocusGained * :checktime")
  vim.cmd(":set nosplitright")
end

return M
