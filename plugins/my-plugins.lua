-- This file runs automatically when Neovim starts

-- Prevent loading plugin twice
if vim.g.loaded_my_plugin then
  return
end
-- luacheck: ignore vim
vim.g.loaded_my_plugin = true

-- Create user command
vim.api.nvim_create_user_command("MyPluginGreet", function()
  require("my-plugin").greet()
end, { desc = "Show greeting from my-plugin" })
