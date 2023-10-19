local M = {}

M.load = function()
  require("nordic").setup({
    transparent_bg = true,
    reduced_blue = false,
    bold_keywords = true,
  })

  local colorscheme = "nordic"
  vim.cmd("colorscheme " .. colorscheme)

  -- vim.api.nvim_create_autocmd({ "BufRead" }, {
  --   pattern = { "*" },
  --   callback = function()
  --     vim.cmd([[syn match FoldLineCount //]])
  --   end,
  -- })

  vim.cmd("highlight NavicSeparator guifg=#000000 guibg=#000FDD")
  vim.cmd("highlight LineNr guifg=#3a4251")
  -- vim.cmd("highlight Field guifg=#9FC6B2")
  -- vim.cmd("highlight Field guifg=#8FBCA7")
  vim.cmd("highlight Field guifg=#70D0B7")
  vim.cmd("highlight Type guifg=#B48EAD gui=bold")
  vim.cmd("highlight @operator guifg=#60728A")
  -- vim.cmd("highlight @operator guifg=#f0dbd4")
  -- vim.cmd("highlight Function guifg=#81A1C1")
  vim.cmd("highlight Function guifg=#848389")
  vim.cmd("highlight Folded guifg=#4c566a guibg=none gui=italic")
  vim.cmd("highlight CursorLine guibg=#3b4252")
  vim.cmd("highlight Namespace guifg=#A3BE8C gui=italic")
  vim.cmd("highlight @namespace guifg=#A3BE8C gui=italic")
  vim.cmd("highlight CursorLineNr guifg=#A3BE8C cterm=italic,bold gui=italic,bold")
end

return M
