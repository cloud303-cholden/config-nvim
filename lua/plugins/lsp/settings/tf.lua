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
  -- Set filetype to terraform instead of terraform-vars (the latter is broken)
  vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = { "*.tfvars" },
    callback = function()
      vim.cmd("set filetype=terraform")
    end,
  })
end

return M
