-- LSP 配置

local mason_registry_path = vim.fn.stdpath("data") .. "/mason/packages"

local ensure_installed_servers = {
  "vimls",
  "lua_ls",
}

-- 安装列表
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  ts_ls = {
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = mason_registry_path .. "vue-language-server"
          .. "/node_modules/@vue/language-server"
          .. "/node_modules/@vue/typescript-plugin",
          languages = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
        },
      },
    },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  },
}

local not_trusteeship_servers = {
  clangd = {}, -- 一般随 llvm 一起安装，不需要 nvim 下载
}

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      opts = {
        ui = {
          border = "rounded",
          icons = {
            package_installed = "󰗠",
            package_pending = "󰅙",
            package_uninstalled = "󰳟",
          },
        },
      },
    },
    opts = { ensure_installed = ensure_installed_servers, },
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- 设置服务器
    for name, config in pairs(not_trusteeship_servers) do
      if config ~= nil and type(config) == "table" then
        lspconfig[name].setup(config)
      end
    end

    -- 默认设置
    require("mason-lspconfig").setup_handlers {
      function(server)
        if servers[server] ~= nil then
          lspconfig[server].setup(servers[server])
        else
          lspconfig[server].setup {}
        end
      end
    }
  end,
}