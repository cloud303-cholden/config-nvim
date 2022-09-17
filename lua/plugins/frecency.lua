local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

telescope.setup({
  extensions = {
    frecency = {
      -- db_root = "home/my_username/path/to/db_root",
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/home/ch/.config",
        ["repos"] = "/home/ch/repos",
      }
    }
  },
})

telescope.load_extension("frecency")
