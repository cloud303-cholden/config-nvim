local M = {}

M.load = function()
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end

  local ok, navic = pcall(require, "nvim-navic")
  if not ok then
    return
  end

  navic.setup({
    separator = " -> ",
  })

  lualine.setup({
    sections = {
      lualine_c = {
        { navic.get_location, cond = navic.is_available, colored = true },
      },
    },
  })
end

return M
