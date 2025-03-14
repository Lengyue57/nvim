return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      jump = {
        nohlsearch = true,
        autojump = true,
      },
      label = {
        distance = true,
      },
      modes = {
        search = {
          enabled = true,
        },
      },
    },
    keys = {
      { "r", mode = "o", function() require("flash").remote() end },
    }
  },
}
