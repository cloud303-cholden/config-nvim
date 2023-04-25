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

  -- Autoformat TF files
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

return M
