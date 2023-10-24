local f = require("core.utils.string")
local M = {}

M.load = function()
  require("nordic").setup({
    transparent_bg = true,
    reduced_blue = false,
    bold_keywords = true,
  })

  local colorscheme = "nordic"
  vim.cmd("colorscheme " .. colorscheme)

  local magenta = "#be9db8"
  local dark_magenta = "#b48ead"
  local blue = "#5f81a2"
  local light_blue = "#bbc3d4"
  local dark_blue = "#60728a"
  local darker_blue = "#4c566a"
  local bright_blue = "#81a1c1"
  local green = "#b1c89d"
  local light_green = "#8fbcbb"
  local yellow = "#ebcb8b"
  local orange = "#d08770"
  local red = "#c5727a"
  local dark_grey = "#3b4252"
  local black = "#191d24"

  vim.cmd(f"hi Builtin guifg={magenta}")
  vim.cmd(f"hi Constant guifg={magenta}")
  vim.cmd(f"hi Function guifg={blue}")
  vim.cmd(f"hi Variable guifg={light_blue}")
  vim.cmd(f"hi @parameter guifg={light_blue} gui=italic")
  vim.cmd(f"hi @operator guifg={dark_blue}")
  vim.cmd(f"hi @punctuation.bracket guifg={dark_blue}")
  vim.cmd(f"hi Field guifg={light_green} gui=bold")
  vim.cmd(f"hi Keyword guifg={orange} gui=italic,bold")
  vim.cmd(f"hi String guifg={green}")
  vim.cmd(f"hi CursorLineNr guifg={green} gui=italic,bold")
  vim.cmd(f"hi DiagnosticUnderlineHint guibg={green} guifg={black}")
  vim.cmd(f"hi DiagnosticUnderlineError guibg={red} guifg={black}")
  vim.cmd(f"hi DiagnosticUnderlineWarn guibg={yellow} guifg={black}")
  vim.cmd(f"hi DiagnosticUnderlineInfo guibg={light_blue} guifg={black}")
  vim.cmd(f"hi @lsp.type.unresolvedReference guibg={red} guifg={black}")
  vim.cmd(f"hi LineNr guifg={dark_grey}")
  vim.cmd(f"hi @namespace guifg={green} gui=italic")
  vim.cmd(f"hi Namespace guifg={green} gui=italic")
  vim.cmd(f"hi CursorLine guibg={dark_grey}")
  vim.cmd(f"hi InsertCursor guibg={orange}")
  vim.cmd(f"hi NormalCursor guibg={bright_blue}")
  vim.cmd(f"hi Folded guifg={darker_blue} guibg=none gui=italic")
  vim.cmd(f"hi Type guifg={dark_magenta} gui=bold")
  vim.cmd(f"hi WinSeparator guifg={darker_blue} guibg=none")
  vim.cmd(f"hi MatchParen guifg={black} guibg={magenta} gui=none")
  vim.cmd("hi WinBar guibg=none")
  vim.cmd("hi StatusLine guibg=none")
  vim.cmd("hi TabLineFill guibg=none")
  vim.cmd(f"hi FloatBorder guibg=none guifg={darker_blue}")
  vim.cmd("hi NormalFloat guibg=none")
  vim.cmd("hi Pmenu guibg=none")
  vim.cmd(f"hi TelescopeBorder guibg=none guifg={darker_blue}")
  vim.cmd(f"hi TelescopePreviewBorder guibg=none guifg={darker_blue}")
  vim.cmd(f"hi TelescopeResultsBorder guibg=none guifg={darker_blue}")
  vim.cmd(f"hi TelescopePromptBorder guibg=none guifg={darker_blue}")
  vim.cmd("hi TelescopeResultsNormal guibg=none")
  vim.cmd("hi TelescopeNormal guibg=none")
  vim.cmd("hi TelescopePromptNormal guibg=none")
  vim.cmd("hi TelescopeMultiIcon guibg=none")
  vim.cmd("hi TelescopeMultiSelection guibg=none")
  vim.cmd("hi TelescopeSelectionCaret guibg=none")
  vim.cmd("hi TelescopeSelection guibg=none")
  vim.cmd("hi TelescopePreviewMessageFillchar guibg=none")
  vim.cmd("hi TelescopePreviewMessage guibg=none")
  vim.cmd("hi TelescopePreviewNormal guibg=none")
  vim.cmd("hi TelescopePreviewMatch guibg=none")
  vim.cmd("hi TelescopePromptPrefix guibg=none")
  vim.cmd(f"hi TelescopePreviewTitle guibg={darker_blue} guifg={green} gui=bold")
  vim.cmd(f"hi TelescopeTitle guibg={darker_blue} guifg={green} gui=bold")
  vim.cmd(f"hi TelescopeResultsTitle guibg={darker_blue} guifg={green} gui=bold")
  vim.cmd(f"hi TelescopePromptTitle guibg={darker_blue} guifg={green} gui=bold")
  vim.cmd(f"hi WhichKeyBorder guibg=none guifg={darker_blue}")
  vim.cmd(f"hi NoicePopupBorder guibg=none guifg={darker_blue}")
  vim.cmd(f"hi NeoTreeCursorLine guibg={bright_blue} guifg={black}")
  vim.cmd("hi NoiceCmdlinePopup guibg=none")
  vim.cmd(f"hi NoiceCmdlinePopupTitle guibg={darker_blue} guifg={green} gui=bold")
  vim.cmd(f"hi NoiceCmdlinePopupBorder guifg={darker_blue} guibg=none")
  vim.cmd("hi NoiceCmdlineIcon guibg=none")
  vim.cmd(f"hi NoiceCmdlineIconSearch guibg={darker_blue} guifg={green} gui=bold")
  vim.cmd(f"hi NoiceCmdline guibg={darker_blue} guifg={green} gui=bold")
  vim.cmd("hi NoiceLspProgressSpinner guibg=none")
  vim.cmd("hi NoiceLspProgressClient guibg=none")
  vim.cmd("hi NoiceLspProgressTitle guibg=none")
  vim.cmd("hi FloatShadow guibg=none")
  vim.cmd("hi FloatShadowThrough guibg=none")
  vim.cmd(f"hi SpecialCmpBorder guibg=none guifg={darker_blue}")
  vim.cmd("hi WildMenu guibg=none")
  vim.cmd(f"hi NeoTreeDirectoryIcon guifg={green}")
  vim.cmd(f"hi NeoTreeDirectoryName guifg={green} gui=bold")
  vim.cmd(f"hi NeoTreeGitUntracked guifg={dark_blue} gui=bold")
  vim.cmd(f"hi NeoTreeGitConflict guifg={red}")
  vim.cmd(f"hi NeoTreeGitAdded guifg={green}")
  vim.cmd(f"hi NeoTreeFileName guifg={dark_blue}")
  vim.cmd(f"hi NeoTreeGitModified guifg={orange} gui=bold")
  vim.cmd(f"hi NeoTreeNormal guifg={light_blue}")
  vim.cmd(f"hi NeoTreeRootName guifg={magenta} gui=bold")
  vim.cmd(f"hi NeoTreeIndentMarker guifg={blue}")
  vim.cmd(f"hi NeoTreeDotfile guifg={darker_blue}")
  vim.cmd(f"hi NeoTreeMessage guifg={darker_blue}")
  vim.cmd(f"hi IblNormal guifg={darker_blue}")
  vim.cmd(f"hi IblWhitespace guifg={darker_blue}")
  -- vim.cmd(f"hi IblScope guifg={dark_magenta}")
  vim.cmd(f"hi DevIconRs guifg={orange}")
  vim.opt.guicursor = "i-c:block-InsertCursor,n-v:block-NormalCursor"

end

return M
