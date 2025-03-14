local colors = {
  white     = "#e6edf3",
  silver    = "#8b949e",
  lightgray = "#262c36",
  gray      = "#171b22",
  darkgray  = "#0d1117",
  black     = "#010409",
  red       = "#ff7b72",
  lime      = "#7ee787",
  blue      = "#79c0ff",
  purple    = "#d2a8ff",
  skyblue   = "#a5d6ff",
  yellow    = "#e3b341",
  orange    = "#ffa657",
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      icons_enabled = true,
      theme = {
        normal = {
          a = {
            bg = colors.silver,
            fg = colors.black,
            gui = "bold",
          },
          b = {
            bg = colors.black,
            fg = colors.white,
          },
        },
        insert = {
          a = {
            bg = colors.yellow,
            fg = colors.black,
            gui = "bold",
          },
        },
        visual = {
          a = {
            bg = colors.lime,
            fg = colors.black,
            gui = "bold",
          },
        },
        replace = {
          a = {
            bg = colors.red,
            fg = colors.black,
            gui = "bold",
          },
        },
        inactive = {
          a = {
            bg = colors.gray,
            fg = colors.white,
          },
        },
      },
      component_separators = { left = "", right = ""},
      section_separators = { left = "", right = ""},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = { "filename" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = {},

      lualine_x = {},
      lualine_y = {
        "encoding",
        {
          "fileformat",
          icons_enabled = true,
          symbols = {
            unix = "LF",
            dos  = "CRLF",
            mac  = "CR",
          }
        },
        "filetype",
      },
      lualine_z = { "selectioncount", "location", "progress" },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = { "diff", "diagnostics" },
      lualine_c = {},

      lualine_x = {},
      lualine_y = {
        "encoding",
        {
          "fileformat",
          icons_enabled = true,
          symbols = {
            unix = "LF",
            dos  = "CRLF",
            mac  = "CR",
          }
        },
        "filetype",
      },
      lualine_z = { "location" },
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  }
}
