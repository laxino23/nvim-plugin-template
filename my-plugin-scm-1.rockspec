-- my-plugin-scm-1.rockspec
rockspec_format = "3.0"
package = "my-plugin"
version = "scm-1"

source = {
  url = "git+https://github.com/username/my-plugin.nvim",
}

description = {
  summary = "A minimal Neovim plugin template",
  detailed = [[
    This is a starter template for creating Neovim plugins in Lua.
    It includes basic structure and testing setup.
  ]],
  homepage = "https://github.com/username/my-plugin.nvim",
  license = "MIT",
}

dependencies = {
  "lua >= 5.1",
}

test_dependencies = {
  "nlua",
}

build = {
  type = "builtin",
  copy_directories = {
    "plugin",
    "doc",
  },
}
