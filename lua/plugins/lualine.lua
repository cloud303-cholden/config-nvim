local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local _, navic = pcall(require, "nvim-navic")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local nord = require"lualine.themes.nord"
nord.normal.a.bg = "#88c0d0"
nord.normal.b.bg = "#4c566a"
nord.normal.c.bg = "#3b4252"

-- local gps = require("nvim-gps")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " },
	cond = hide_in_width,
}

local mode = {
	"mode",
	fmt = function(str)
		return str
	end,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local filename = {
    "filename",
    file_status = true,
    path = 1, -- Relative path
    shorting_target = 80,
    symbols = {
        modified = " [+]",
        readonly = " [-]",
        unnamed = "[No Name]",
    },
}

local location = {
	"location",
	padding = 0,
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = nord,
		component_separators = { right = "", left = "" },
		section_separators = { right = "", left = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { branch, diagnostics },
		lualine_c = {
      { navic.get_location, cond = navic.is_available }
    },
    lualine_x = { filename },
		lualine_y = { diff },
		lualine_z = { location },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
