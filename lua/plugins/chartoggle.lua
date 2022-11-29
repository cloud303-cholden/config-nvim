local M = {}

M.load = function()
  local ok, chartoggle = pcall(require, "chartoggle")
  if not ok then
    return
  end

  chartoggle.setup({
    leader = " ",
    keys = { ",", ";" },
  })
end

return M
