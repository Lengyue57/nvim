local command = vim.api.nvim_create_user_command

command("Rename", function() vim.lsp.buf.rename() end, {})
command("Rname", function() vim.lsp.buf.rename() end, {})
command("Definition", function() vim.lsp.buf.definition() end, {})
command("References", function() vim.lsp.buf.references() end, {})
command("Diag", function() vim.diagnostic.open_float() end, {})
command("DiagListLoc", function() vim.diagnostic.setloclist() end, {})
command("DiagListQf", function() vim.diagnostic.setqflist() end, {})
