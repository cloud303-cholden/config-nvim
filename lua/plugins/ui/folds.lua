local M = {}

M.load = function()
  vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  vim.cmd("highlight MoreMsg guifg=#d08770 guibg=none")
  vim.cmd("highlight FoldColumn guifg=#d08770 guibg=none")

  local builtin = require("statuscol.builtin")
  require("statuscol").setup({
    relculright = true,
    segments = {
      {
        sign = { name = { "Diagnostic" } },
        click = "v:lua.ScSa",
      },
      {
        text = { builtin.lnumfunc },
        click = "v:lua.ScLa",
      },
      {
        text = { " ", builtin.foldfunc, " " },
        click = "v:lua.ScFa",
      },
    }
  })
end

return M
