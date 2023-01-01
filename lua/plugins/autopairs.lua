local M = {}

M.load = function()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if not ok then
    return
  end

  autopairs.setup({})

  local rule = require("nvim-autopairs.rule")
  local conds = require("nvim-autopairs.conds")

  autopairs.add_rules({
    rule("<", ">", "rust"):with_pair(conds.not_before_text(" ")),
  })
end

return M
