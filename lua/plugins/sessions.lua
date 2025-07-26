-- 編輯器会話管理

local command = vim.api.nvim_create_user_command

return {
  "folke/persistence.nvim",
  command = {
    "SessionSave",
    "SessionList",
    "SessionSelect",
    "SessionLoad",
    "SessionLoadLast",
  },
  config = function()
    local persistence = require("persistence")
    persistence.setup()
    command("SessionSave", function() persistence.save() end, {})
    command("SessionList", function() persistence.list() end, {})
    command("SessionSelect", function() persistence.select() end, {})
    command("SessionLoad", function() persistence.load() end, {})
    command("SessionLoadLast", function() persistence.load({ last = true }) end, {})
  end,
}
