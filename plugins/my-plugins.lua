-- This file runs automatically when Neovim starts

-- Prevent loading plugin twice
if vim.g.loaded_my_plugins == 1 then
  return
end
-- luacheck: ignore vim
vim.g.loaded_my_plugins = true

-- Create user command
vim.api.nvim_create_user_command("MyPlugins", function()
  require("my-plugins").setup()
end, { desc = "Show greeting from my-plugins" })

return {
  {
    name = "my-plugins.nvim",
    dir = vim.fn.stdpath "config" .. "/lua/my-plugins",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    cmd = { "MyPlugins" },
    keys = {},
    opts = {},
    config = function(_, opts)
      require("my-plugins").setup(opts) -- the require name must match the dir name under the lua folder
    end,
  },
}
