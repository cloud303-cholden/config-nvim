local M = {}

M.load = function()
  local ok, comment = pcall(require, "Comment")
  if not ok then
    return
  end
  comment.setup({})

  local ok, comment_ft = pcall(require, "Comment.ft")
  if not ok then
    return
  end
  comment_ft.set('wgsl', '// %s')

  local ok, surround = pcall(require, "nvim-surround")
  if not ok then
    return
  end

  surround.setup({})

  local ok, chartoggle = pcall(require, "chartoggle")
  if not ok then
    return
  end

  chartoggle.setup({
    leader = " ",
    keys = { ",", ";" },
  })

  local wk = require("which-key")
  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = false,
    noremap = true,
    nowait = true,
  }
  local mappings = {
    [","] = {
      ":lua require('chartoggle').toggle(',')<CR>",
      "Toggle Comma",
    },
    [";"] = {
      ":lua require('chartoggle').toggle(';')<CR>",
      "Toggle Semicolon",
    },
  }
  wk.register(mappings, opts)

  local ok, autopairs = pcall(require, "nvim-autopairs")
  if not ok then
    return
  end

  autopairs.setup({})

  local rule = require("nvim-autopairs.rule")
  local conds = require("nvim-autopairs.conds")

  autopairs.add_rules({
    rule("<", ">", "rust"):with_pair(conds.not_before_text(" ")),
  })
end

return M
