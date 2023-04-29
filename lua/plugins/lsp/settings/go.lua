local M = {}

M.settings = {
  settings = {
    gopls = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

M.load = function()
  local ok, go = pcall(require, "go")
  if not ok then
    return
  end

  go.setup({
    lsp_inlay_hints = {
      enable = true,
      only_current_line = true,
    },
    luasnip = true,
  })
end

return M
