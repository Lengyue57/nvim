-- LSP 配置

local ensure_installed_servers = {
  "vimls",
  "lua_ls",
}

local servers = {
  enabled = {
    "clangd",
  },
  disabled = {
    "ts_ls",
  },
}

function on_config()
  local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
    languages = { "vue" },
    configNamespase = "typescript",
  }
  local configs = {
    clangd = {
      cmd = { "clangd", "--header-insertion=never" },
    },
    ts_ls = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
    },
    vtsls = {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "vue",
      }
    },
  }
  for server, config in pairs(configs) do
    vim.lsp.config(server, config)
  end
end

return {
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            border = "rounded",
            icons = {
              package_installed = "󰗠",
              package_pending = "󰳟",
              package_uninstalled = "󰅙",
            },
          },
        },
      },
      { "neovim/nvim-lspconfig" },
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = ensure_installed_servers,
        automatic_enable = {
          exclude = servers.disabled,
        },
      }
      vim.lsp.enable(servers.enabled)
      on_config()
    end
  },
}
