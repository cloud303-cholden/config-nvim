local M = {}

M.settings = {
  cmd = { "terraform-ls", "serve" },
}

M.load = function()
  -- Autoformat TF files
  vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tf", "*.tfvars" },
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

return M
