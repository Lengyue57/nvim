-- 代码补全配置

return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- 片段来源
    { "hrsh7th/cmp-nvim-lsp", dependencies = "neovim/nvim-lspconfig" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },

    -- For `vsnip` users.
    -- { "hrsh7th/cmp-vsnip" },
    -- { "hrsh7th/vim-vsnip" },

    -- For `luasnip` users.
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },

    -- For `ultisnips` users.
    -- { "SirVer/ultisnips" },
    -- { "quangnguyen30192/cmp-nvim-ultisnips" },

    -- For `snippy` users.
    -- { "dcampos/nvim-snippy" },
    -- { "rafamadriz/cmp-snippy" },

    { "onsails/lspkind-nvim" },
    { "rafamadriz/friendly-snippets" },
  },
  config = function()
    local cmp = require("cmp")

    cmp.setup {
      snippet = {
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- require"snippy".expand_snippet(args.body) -- For `snippy` users.
        end
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        -- { name = "vsnip" }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = "ultisnips" }, --For ultisnips users.
        -- { name = "snippy" }, -- For snippy users.
        { name = "buffer" },
        { name = "path" },
      },
      formatting = {
        format = require("lspkind").cmp_format {
          with_text = true,
          maxwidth = 50,
          before = function(entry, vim_item)
            vim_item.menu = "[" .. entry.source.name .. "]"
            return vim_item
          end
        },
      },
      mapping = {
        ["<C-,>"] = cmp.mapping.complete(),
        -- 上一个
        ["<A-k>"] = cmp.mapping.select_prev_item(),
        ["<A-Up>"] = cmp.mapping.select_prev_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<A-j>"] = cmp.mapping.select_next_item(),
        ["<A-Down>"] = cmp.mapping.select_next_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<ESC>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<Tab>"] = cmp.mapping.confirm { select = true },
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ select = false })
          else
            fallback()
          end
        end, { "i" }),
      },
    }

    -- require("luasnip.loaders.from_vscode").lazy_load()
  end,
}