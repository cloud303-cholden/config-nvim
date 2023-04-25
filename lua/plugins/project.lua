local M = {}

M.load = function()
  local ok, project = pcall(require, "project_nvim")
  if not ok then
    return
  end

  project.setup({
    detection_methods = { "pattern" },
    patterns = { ".git" },
    exclude_dirs = {
      "/usr/*",
      "~/.rustup/*",
      "~/.config/*",
      "~/.zsh/*",
      "~/.lua/*",
      "~/.cargo/*",
      "~/repos/odoo/*",
    },
  })
end

return M
