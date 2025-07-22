local command = vim.api.nvim_create_user_command

command("Rname", vim.lsp.buf.rename, {})
command("Def", vim.lsp.buf.definition, {})
command("Refs", vim.lsp.buf.references, {})
