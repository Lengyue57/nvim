-- 代码折叠配置

vim.opt.foldcolumn = '0'
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

local handler = function(virt_text, lnum, end_lnum, width, truncate)
  local new_virt_text = {}
  local suffix = (' …  %d lines'):format(end_lnum - lnum)
  local target_width = width - vim.fn.strdisplaywidth(suffix)
  local cur_width = 0
  for _, chunk in ipairs(virt_text) do
    local chunk_text = chunk[1]
    local hl_group = chunk[2]
    local chunk_width = vim.fn.strdisplaywidth(chunk_text)
    if target_width > cur_width + chunk_width then
      table.insert(new_virt_text, chunk)
      cur_width = cur_width + chunk_width
    else
      chunk_text = truncate(chunk_text, target_width - cur_width)
      table.insert(new_virt_text, {chunk_text, hl_group})
      chunk_width = vim.fn.strdisplaywidth(chunk_text)
      -- str width returned from truncate() may less than (target_width - cur_width), need padding
      suffix = suffix .. (' '):rep(target_width - cur_width - chunk_width)
      break
    end
  end
  table.insert(new_virt_text, {suffix, 'MoreMsg'})
  return new_virt_text
end

return {
  'kevinhwang91/nvim-ufo',
  event = "VeryLazy",
  dependencies = { "kevinhwang91/promise-async" },
  commit = "5b75cf5fdb74054fc8badb2e7ca9911dc0470d94",
  config = function()
    local ufo = require("ufo")
    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)
    vim.keymap.set("n", "zr", ufo.openFoldsExceptKinds)
    vim.keymap.set("n", "zm", ufo.closeFoldsWith)

    -- Option 2: nvim lsp as LSP client
    -- Tell the server the capability of foldingRange,
    -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
    vim.lsp.config("*", {
      capabilities = capabilities
    })

    ufo.setup {
      open_fold_hl_timeout = 100,
      fold_virt_text_handler = handler,
    }
  end,
}
