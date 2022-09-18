local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter_configs.setup({
	ensure_installed = { "python", "go", "rust" },
	ignore_install = { "" },
	highlight = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = {
    enable = true
  },
})
