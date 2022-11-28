local ok, project = pcall(require, "project_nvim")
if not ok then
  return
end

project.setup({})

local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.load_extension("projects")
