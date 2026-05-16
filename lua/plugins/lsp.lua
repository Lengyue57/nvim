-- LSP 配置

local ensure_installed_servers = {
  "vimls",
  "lua_ls",
}

local servers = {
  enabled = {
    "clangd",
    "gdscript",
  },
  disabled = {
    "ts_ls",
  },
}

local function lsp_configs()
  local vue_plugin = {
    name = "@vue/typescript-plugin",
    location = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server"),
    languages = { "vue" },
    configNamespase = "typescript",
  }
  return {
    clangd = {
      cmd = { "clangd", "--header-insertion=never" },
    },
    pylsp = {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = { enabled = false },
            pyflakes = { enabled = false },
          },
        },
      },
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
      {
        "neovim/nvim-lspconfig",
        config = function()
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          vim.lsp.config("*", {
            capabilities = capabilities
          })
          local configs = lsp_configs()
          for server, config in pairs(configs) do
            vim.lsp.config(server, config)
          end
        end,
      },
    },
    opts = {
      ensure_installed = ensure_installed_servers,
      automatic_enable = {
        exclude = servers.disabled,
      },
    },
    config = function(_, opts)
      vim.lsp.enable(servers.enabled)
      require("mason-lspconfig").setup(opts)
    end,
  },
}
