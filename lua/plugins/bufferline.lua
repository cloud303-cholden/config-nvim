local M = {}

M.load = function()
  require("bufferline").setup({
    options = {
      modified_icon = " ",
      always_show_bufferline = true,
      show_close_icon = false,
      show_buffer_close_icons = false,
      indicator = { style = "none" },
      separator_style = { "|", "|" },
    },
  })
end

return M
