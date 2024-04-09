local M = {}

M.load = function()
  local ok, sg = pcall(require, "sg")
  if not ok then
    return
  end
  sg.setup({})
end

return M
