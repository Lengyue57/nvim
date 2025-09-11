return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      labels = "abcdefghijklmnopqrstuvwxyz,./;'",
      srarch = {
        mode = function(str) return "\\<" .. str end,
      },
      jump = {
        nohlsearch = true,
        autojump = false,
      },
      label = {
        before = false,
        after = true,
        distance = true,
      },
      modes = {
        search = {
          enabled = false,
        },
      },
    },
    keys = {
      { "r", mode = "o", function() require("flash").remote() end, { noremap = true } },
      { "''", mode = "", function() require("flash").jump() end, { noremap = true } },
      { "'s", mode = "", function() require("flash").treesitter_search() end, { noremap = true } },
      { "<c-s>", mode = "c", function() require("flash").toggle() end, { noremap = true } },
    }
  },
}
