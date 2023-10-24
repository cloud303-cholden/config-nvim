local M = {}

M.load = function()
  -- Use 'q' to quit from common plugins
  vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
    callback = function()
      vim.cmd([[
	      nnoremap <silent> <buffer> q :close<CR>
	      set nobuflisted
	    ]])
    end,
  })

  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.wgsl" },
    callback = function()
      vim.cmd("set filetype=wgsl")
    end,
  })
end

return M
