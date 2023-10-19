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

  o.pumheight = 10
  o.cmdheight = 0
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
  vim.wo.foldmethod="expr"
  vim.wo.foldexpr="nvim_treesitter#foldexpr()"
  vim.wo.foldnestmax=2
  vim.wo.foldlevel = 4
  vim.o.foldcolumn = '1'
  vim.o.foldlevelstart = 0
  vim.o.foldenable = true
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.wo.foldtext =
    [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . '  ' . (v:foldend - v:foldstart + 1)]]

  o.signcolumn = "yes"
  o.mouse = "a"
  o.fileencoding = "utf-8"
  o.clipboard = "unnamedplus"
  o.guifont = "monospace:h17"
  o.fcs = "eob: "
  o.shell = "zsh"
  o.guicursor = "i:block"

  -- o.colorcolumn = { 99 }
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
