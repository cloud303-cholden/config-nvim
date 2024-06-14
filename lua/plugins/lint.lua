local M = {}

M.load = function()
  vim.filetype.add({
    pattern = {
      ['.*/.github/workflows/.*%.yml'] = 'yaml.ghaction',
      ['.*/.github/workflows/.*%.yaml'] = 'yaml.ghaction',
    },
  })

  require('lint').linters_by_ft = {
    ghaction = { 'actionlint' },
    tflint = { 'tfvars', 'tf', 'hcl' },
  }

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

return M
