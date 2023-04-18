local M = {}

M.load = function()
  local ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if not ok then
    return
  end

  treesitter_configs.setup({
    ensure_installed = { "python", "go", "rust", "lua" },
    ignore_install = { "" },
    highlight = {
      enable = true,
      disable = { "json" },
    },
    autopairs = {
      enable = true,
    },
    indent = {
      disable = { "python" },
      enable = true,
    },
  })
end

return M
