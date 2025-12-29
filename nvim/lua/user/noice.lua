require("noice").setup({
  cmdline = {
    view = "cmdline_popup", -- centered popup
    format = {
      cmdline = { icon = ":" },
      search_down = { icon = "/" },
      search_up = { icon = "?" },
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = "50%", -- center vertically
        col = "50%", -- center horizontally
      },
      size = {
        width = 60,
        height = "auto",
      },
      border = {
        style = "rounded",
      },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})
