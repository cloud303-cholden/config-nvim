local M = {}

M.load = function()
  require("lint").linters_by_ft = {
    python = {
      "ruff",
    },
  }

  vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "FileWritePost", "TextChanged" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
end

return M
