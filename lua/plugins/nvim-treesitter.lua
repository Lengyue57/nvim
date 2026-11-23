local ensure = {
  "bash",
  "vim",
  "vimdoc",
  "lua",
  "xml",
  "markdown",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "c",
  "cpp",
  "cmake"
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    vim.cmd.syntax("off")
    require("nvim-treesitter").install(ensure)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
      end,
    })
  end,
}
