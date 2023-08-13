local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    mode = "buffers",
    numbers = "ordinal",
    close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
    buffer_close_icon = '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
    color_icons = true,
    show_buffer_icons = true,
    show_close_icon = false,
    separator_style = "thin", -- "slant" | "thick" | "thin" | { 'any', 'any' },
  },

   highlights = {
    fill = {
      fg = { attribute = "fg", highlight = "TabLine" },
      bg = { attribute = "bg", highlight = "TabLine" },
   },
      background = {
         fg = { attribute = "fg", highlight = "TabLine" },
         bg = { attribute = "bg", highlight = "TabLine" },
      },
      tab = {
         fg = { attribute = "fg", highlight = "TabLine" },     -- color of number in not selected tab
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      tab_selected = {
         fg = { attribute = "fg", highlight = "GruvboxRed" },  -- color of number in selected tab
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      tab_separator = {
         fg = { attribute = "fg", highlight = "GruvboxBg0" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      tab_separator_selected = {
         fg = { attribute = "fg", highlight = "GruvboxRed" },  -- color of separator and underline of selected tab
         underline = true;
      },
--   tab_close = {
--    fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
--      fg = { attribute = "fg", highlight = "TabLineSel" },
--      bg = { attribute = "bg", highlight = "TabLine" },
--   },
      close_button = {
         fg = { attribute = "fg", highlight = "TabLine" },
         bg = { attribute = "bg", highlight = "TabLine" },
      },
      close_button_visible = {
         fg = { attribute = "fg", highlight = "GruvboxOrange" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      close_button_selected = {
         fg = { attribute = "fg", highlight = "GruvboxRed" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      buffer_visible = {
         fg = { attribute = "fg", highlight = "GruvboxOrange" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      buffer_selected = {
         fg = { attribute = "fg", highlight = "GruvboxRed" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
         bold = true,
         italic = true,
      },
      numbers = {
         fg = { attribute = "fg", highlight = "TabLine" },
         bg = { attribute = "bg", highlight = "TabLine" },
      },
      numbers_visible = {
         fg = { attribute = "fg", highlight = "GruvboxOrange" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      numbers_selected = {
         fg = { attribute = "fg", highlight = "GruvboxRed" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
         bold = true,
         italic = true,
      },
      modified = {
         fg = { attribute = "fg", highlight = "TabLine" },
         bg = { attribute = "bg", highlight = "TabLine" },
      },
      modified_visible = {
         fg = { attribute = "fg", highlight = "GruvboxOrange" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      modified_selected = {
         fg = { attribute = "fg", highlight = "GruvboxRed" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
--   duplicate = {
--      fg = { attribute = "fg", highlight = "TabLine" },
--      bg = { attribute = "bg", highlight = "TabLine" },
--      italic = true,
--   },
--   duplicate_visible = {
--      fg = { attribute = "fg", highlight = "Normal" },
--      bg = { attribute = "bg", highlight = "Normal" },
--      italic = true,
--   },
--   duplicate_selected = {
--      fg = { attribute = "fg", highlight = "TabLineSel" },
--      bg = { attribute = "bg", highlight = "TabLineSel" },
--      italic = true,
--   },
      separator = {
         fg = { attribute = "fg", highlight = "GruvboxBg0" },
         bg = { attribute = "bg", highlight = "TabLine" },
      },
      separator_visible = {
         fg = { attribute = "fg", highlight = "GruvboxBg0" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      separator_selected = {
         fg = { attribute = "fg", highlight = "GruvboxBg0" },
         bg = { attribute = "bg", highlight = "TabLine" },
      },
      indicator_visible = {
         fg = { attribute = "fg", highlight = "GruvboxBg0" },
         bg = { attribute = "bg", highlight = "GruvboxBg0" },
      },
      indicator_selected = {
         fg = { attribute = "fg", highlight = "GruvboxRed" },
         bg = { attribute = "bg", highlight = "GruvboxRed" },
      },
  },
}
