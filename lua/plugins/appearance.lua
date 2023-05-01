local M = {}

M.load = function()
  local ok, indent_blankline = pcall(require, "indent_blankline")
  if not ok then
    return
  end

  indent_blankline.setup({
    char = "┊",
    show_trailing_blankline_indent = false,
    char_highlight_list = {
      "Comment",
    },
  })

  require("headlines").setup({
    markdown = {
      query = vim.treesitter.parse_query(
        "markdown",
        [[
          (atx_heading [
            (atx_h1_marker)
            (atx_h2_marker)
            (atx_h3_marker)
            (atx_h4_marker)
            (atx_h5_marker)
            (atx_h6_marker)
          ] @headline)

          (thematic_break) @dash

          (fenced_code_block) @codeblock

          (block_quote_marker) @quote
          (block_quote (paragraph (inline (block_continuation) @quote)))
        ]]
      ),
      headline_highlights = {
        "Headline1",
        "Headline2",
        "Headline3",
        "Headline4",
        "Headline5",
        "Headline6",
      },
      codeblock_highlight = "CodeBlock",
      dash_highlight = "Dash",
      dash_string = "-",
      quote_highlight = "Quote",
      quote_string = "┃",
      fat_headlines = true,
      fat_headline_upper_string = "▃",
      fat_headline_lower_string = "🬂",
    },
  })
end

return M
