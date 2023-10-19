local M = {}

M.load = function()
  require("nordic").setup({
    transparent_bg = true,
    reduced_blue = false,
    bold_keywords = true,
  })

  local colorscheme = "nordic"
  vim.cmd("colorscheme " .. colorscheme)

  vim.cmd("hi Builtin guifg=#be9db8")
  vim.cmd("hi Constant guifg=#be9db8")
  vim.cmd("hi Function guifg=#5f81a2")
  vim.cmd("hi Variable guifg=#bbc3d4")
  vim.cmd("hi @parameter guifg=#bbc3d4 gui=italic")
  vim.cmd("hi @operator guifg=#60728a")
  vim.cmd("hi @punctuation.bracket guifg=#60728a")
  vim.cmd("hi Field guifg=#8fbcbb gui=bold")
  vim.cmd("hi Keyword guifg=#d08770 gui=italic,bold")
  vim.cmd("hi Field guifg=#8fbcbb gui=bold")
  vim.cmd("hi String guifg=#b1c89d gui=bold")
  vim.cmd("hi CursorLineNr guifg=#b1c89d gui=italic,bold")
  vim.cmd("hi DiagnosticUnderlineHint guibg=#b1c89d guifg=#191d24")
  vim.cmd("hi DiagnosticUnderlineError guibg=#c5727a guifg=#191d24")
  vim.cmd("hi DiagnosticUnderlineWarn guibg=#ebcb8b guifg=#191d24")
  vim.cmd("hi DiagnosticUnderlineInfo guibg=#88c0d0 guifg=#191d24")
  vim.cmd("hi @lsp.type.unresolvedReference guibg=#c5727a guifg=#191d24")
  vim.cmd("hi LineNr guifg=#3a4251")
  vim.cmd("hi @namespace guifg=#b1c89d gui=italic")
  vim.cmd("hi Namespace guifg=#b1c89d gui=italic")
  vim.cmd("hi CursorLine guibg=#3b4252")
  vim.cmd("hi Folded guifg=#4c566a guibg=none gui=italic")
  vim.cmd("hi Type guifg=#b48ead gui=bold")
  vim.cmd("hi WinSeparator guifg=#4c566a guibg=none")
  vim.cmd("hi WinBar guibg=none")
  vim.cmd("hi StatusLine guibg=none")
  vim.cmd("hi TabLineFill guibg=none")
  vim.cmd("hi FloatBorder guibg=none")
  vim.cmd("hi NormalFloat guibg=none")
  vim.cmd("hi TelescopeBorder guibg=none")
  vim.cmd("hi TelescopePreviewBorder guibg=none")
  vim.cmd("hi TelescopeResultsBorder guibg=none")
  vim.cmd("hi TelescopePromptBorder guibg=none")
  vim.cmd("hi WhichKeyBorder guibg=none")
  vim.cmd("hi NoicePopupBorder guibg=none")
  vim.cmd("hi NoiceCmdlinePopup guibg=none")
  vim.cmd("hi NoiceCmdlinePopupBorder guifg=#191d24 guibg=none")
  vim.cmd("hi NoiceCmdlineIcon guibg=none")
  vim.cmd("hi NoiceCmdlineIconSearch guibg=none")
  vim.cmd("hi NoiceCmdline guibg=none")
  vim.cmd("hi NoiceLspProgressSpinner guibg=none")
  vim.cmd("hi NoiceLspProgressClient guibg=none")
  vim.cmd("hi NvimTreeFolderIcon guifg=#d08770")
end

return M
