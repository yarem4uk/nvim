local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

-- print(vim.bo.filetype)

lualine.setup({
  options = {
    icons_enabled = false,
    theme = 'gruvbox-material',
    section_separators = '',
    component_separators = '',
    always_divide_middle = false,
  },
  sections = {
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = ' + ', -- Text to show when the file is modified.
          readonly = ' - ', -- Text to show when the file is non-modifiable or readonly.
          unnamed = '', -- Text to show for unnamed buffers.
        },
      },
    },
    lualine_y = {},
    lualine_z = {
      'location',
      color = nil,
    },
  },
  inactive_sections = {
    lualine_c = {
      {
        'filename',
        symbols = {
          unnamed = '',
        },
      },
    },
  },
})
