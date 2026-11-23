-- 代码补全配置

return {
  "saghen/blink.cmp",
  event = {
    "InsertEnter",
    "CmdlineEnter",
  },
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
      preset = "none",
      ["<C-,>"] = { "show", "show_documentation", "hide_documentation" },
      ["<ESC>"] = { "hide", "fallback" },

      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback"
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = {
        function(cmp)
          return cmp.show({ initial_selected_item_idx = 2 })
        end,
        "select_next",
        "fallback",
      },

      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },

      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    appearance = {
      -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = "normal"
    },
    completion = {
      documentation = {
        auto_show = false,
        window = { border = "rounded" },
      },
      menu = { auto_show = false },
      ghost_text = { enabled = true },
    },
    signature = {
      enabled = true,
      window = { border = "rounded" },
    },
    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust" }
  },
  opts_extend = { "sources.default" }
}
