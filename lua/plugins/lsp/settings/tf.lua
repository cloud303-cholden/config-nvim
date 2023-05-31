local M = {}

M.settings = {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars", "tf" },
  root_dir = require("lspconfig").util.root_pattern("*.tf", "*.tfvars"),
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
