-- LSP 配置

local ensure_installed_servers = {
  "vimls",
  "lua_ls",
}

local enabled_servers = {
  "clangd"
}

for _, server in ipairs(enabled_servers) do
  vim.lsp.enable(server)
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
    opts = {
      ensure_installed = ensure_installed_servers,
    },
  },
}
