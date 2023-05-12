local M = {}

M.load = function()
  local notify = require("notify")
  local stages_util = require("notify.stages.util")
  local nonicons = require("nvim-nonicons.extentions.nvim-notify")

  local stages = {
    function(state)
      local next_height = state.message.height + 2
      local next_row =
        stages_util.available_slot(state.open_windows, next_height, stages_util.DIRECTION.BOTTOM_UP)
      if not next_row then
        return nil
      end
      return {
        relative = "editor",
        anchor = "NE",
        width = state.message.width,
        height = state.message.height,
        col = vim.opt.columns:get(),
        row = next_row,
        border = "rounded",
        style = "minimal",
      }
    end,
    function()
      return {
        col = { vim.opt.columns:get() },
        time = true,
      }
    end,
  }

  local compact = function(bufnr, notif, highlights)
    local base = require("notify.render.base")
    local namespace = base.namespace()
    local icon = notif.icon
    local title = notif.title[1]

    local prefix = string.format("%s | %s:", icon, title)
    notif.message[1] = string.format("%s %s", prefix, notif.message[1])

    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, notif.message)

    local icon_length = vim.str_utfindex(icon)
    local prefix_length = vim.str_utfindex(prefix)

    vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, 0, {
      hl_group = highlights.icon,
      end_col = icon_length + 1,
      priority = 50,
    })
    vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, icon_length + 1, {
      hl_group = highlights.title,
      end_col = prefix_length + 1,
      priority = 50,
    })
    vim.api.nvim_buf_set_extmark(bufnr, namespace, 0, prefix_length + 1, {
      hl_group = highlights.body,
      end_line = #notif.message,
      priority = 50,
    })
  end

  notify.setup({
    render = compact,
    stages = stages,
    icons = nonicons.icons,
    fps = 144,
    timeout = 3000,
  })
end

return M
