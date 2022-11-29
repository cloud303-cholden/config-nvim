local M = {}

M.load = function()
  local ok, go = pcall(require, "go")
  if not ok then
    return
  end

  go.setup({
    luasnip = true,
  })
end

return M
