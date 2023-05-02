local M = {}

M.load = function()
  require("noice").setup({
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  })

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
      query = vim.treesitter.query.parse(
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
