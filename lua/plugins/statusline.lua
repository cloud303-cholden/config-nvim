local M = {}

M.load = function()
  local ok, lualine = pcall(require, "lualine")
  if not ok then
    return
  end

  local ok, navic = pcall(require, "nvim-navic")
  if not ok then
    return
  end

  local navbuddy = require("nvim-navbuddy")
  navbuddy.setup({
    window = {
      border = "rounded", 
    },
  })

  navic.setup({
    separator = "    ",
    icons = {
        File          = " ",
        Module        = " ",
        Namespace     = " ",
        Package       = " ",
        Class         = " ",
        Method        = " ",
        Property      = " ",
        Field         = " ",
        Constructor   = " ",
        Enum          = "練",
        Interface     = "練",
        Function      = " ",
        Variable      = " ",
        Constant      = " ",
        String        = " ",
        Number        = " ",
        Boolean       = "◩ ",
        Array         = " ",
        Object        = " ",
        Key           = " ",
        Null          = "ﳠ ",
        EnumMember    = " ",
        Struct        = " ",
        Event         = " ",
        Operator      = " ",
        TypeParameter = " ",
    },
  })

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "nord",
      component_separators = { right = "", left = "" },
      section_separators = { right = "", left = "" },
      ignore_focus = { "NvimTree", "toggleterm" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          color = { gui = "bold" },
          fmt = function(str)
            return "  " .. str
          end,
        },
      },
      lualine_b = {
        {
          "branch",
          color = { gui = "italic" },
          icons_enabled = true,
          icon = " ",
        },
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          sections = { "error", "warn" },
          symbols = { error = "  ", warn = "  " },
          colored = true,
          update_in_insert = false,
          always_visible = true,
        },
      },
      lualine_c = {
        {
          navic.get_location,
          cond = navic.is_available,
          padding = { left = 1, right = 0 },
          colored = true,
        },
      },
      lualine_x = {
        {
          "filename",
          file_status = true,
          path = 1, -- Relative path
          shorting_target = 80,
          symbols = {
            modified = " ",
            readonly = "",
            unnamed = "",
          },
          filetype_names = {
            toggleterm = 'Term',
          },
          color = { gui = "italic" },
        },
      },
      lualine_y = {
        {
          "diff",
          colored = true,
          symbols = { added = "  ", modified = "  ", removed = "  " },
          cond = function()
            return vim.fn.winwidth(0) > 80
          end,
        },
      },
      lualine_z = {
        {
          "location",
          padding = 0,
          color = { gui = "bold" },
        },
        {
          "filetype",
          colored = false,
          icon_only = true,
          icon = { align = "right" },
          color = { gui = "bold" },
        },
      },
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
end

return M
