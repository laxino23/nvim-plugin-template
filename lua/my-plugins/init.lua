local M = {}

-- Default configuration
M.config = {
  greeting = "Hello from my-plugin!",
  enable_keymaps = true,
}

-- Setup function - entry point for users
function M.setup(opts)
  -- Merge user options with defaults
  M.config = vim.tbl_deep_extend("force", M.config, opts or {})

  -- Only setup keymaps if enabled
  if M.config.enable_keymaps then
    M.setup_keymaps()
  end
end

-- Setup keymaps
function M.setup_keymaps()
  vim.keymap.set("n", "<leader>mp", function()
    M.greet()
  end, { desc = "My Plugin: Show greeting" })
end

-- Main plugin function
function M.greet()
  print(M.config.greeting)
end

return M
