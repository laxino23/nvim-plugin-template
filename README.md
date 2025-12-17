# my-plugin.nvim

A minimal Neovim plugin template written in Lua.
一个用Lua编写的简约Neovim插件模板。

## Overview / 概述

This template provides a solid foundation for developing Neovim plugins in Lua. It includes best practices for code quality, testing, linting, and release management. Whether you're a beginner or experienced developer, this setup ensures your plugin is maintainable, testable, and easy to distribute.
这个模板为用Lua开发Neovim插件提供了坚实的基础。它包括代码质量、测试、Linting和发布管理的良好实践。无论你是初学者还是经验丰富的开发者，这个设置都能确保你的插件易于维护、可测试且易于分发。

Key benefits:

- Pre-configured tools for formatting, linting, and commit standards.
- Built-in testing with Busted.
- Automated changelog generation.
- Easy integration with package managers like lazy.nvim.
- Support for commands, keymaps, and configurable options.

主要优势：

- 预配置的格式化、Linting和提交标准工具。
- 使用Busted的内置测试。
- 自动生成变更日志。
- 与lazy.nvim等包管理器的轻松集成。
- 支持命令、键映射和可配置选项。

## Features / 功能

- **Simple Setup**: Easily configure the plugin with a single `setup()` function.
- **Configurable Options**: Customize behavior through a table of options.
- **Commands and Keymaps**: Built-in support for Neovim commands and keybindings.
- **Testing Infrastructure**: Ready-to-use tests with Busted framework.
- **Documentation**: Optional help file generation for `:help my-plugin`.
- **CI/CD Ready**: GitHub workflows for linting, testing, and automated releases to LuaRocks.

- **简单设置**：通过单个`setup()`函数轻松配置插件。
- **可配置选项**：通过选项表自定义行为。
- **命令和键映射**：内置支持Neovim命令和键绑定。
- **测试基础设施**：使用Busted框架的即用型测试。
- **文档**：可选的帮助文件生成，用于`:help my-plugin`。
- **CI/CD就绪**：GitHub工作流用于Linting、测试和自动发布到LuaRocks。

## Installation / 安装

To install this plugin, use your preferred Neovim package manager. Here's an example with [lazy.nvim](https://github.com/folke/lazy.nvim):

使用您喜欢的Neovim包管理器安装此插件。以下是使用[lazy.nvim](https://github.com/folke/lazy.nvim)的示例：

```lua
{
  "username/my-plugin.nvim",  -- Replace with your actual repository
  config = function()
    require("my-plugin").setup({
      greeting = "Hello World!",
      enable_keymaps = true,
    })
  end,
}
```

For other managers like packer.nvim or vim-plug, refer to their documentation for adding GitHub repositories. After installation, restart Neovim or run `:Lazy sync` (for lazy.nvim).

对于其他管理器如packer.nvim或vim-plug，请参考其文档添加GitHub仓库。安装后，重启Neovim或运行`:Lazy sync`（针对lazy.nvim）。

## Configuration / 配置

The plugin comes with sensible defaults, but you can override them in the `setup()` function.

插件带有合理的默认值，但您可以在`setup()`函数中覆盖它们。

Default configuration:
默认配置：

```lua
{
  greeting = "Hello from my-plugin!",  -- Message displayed by the greet command
  enable_keymaps = true,               -- Enable default keymaps like <leader>mp
}
```

Example of custom setup:
自定义设置示例：

```lua
require("my-plugin").setup({
  greeting = "Custom greeting message!",
  enable_keymaps = false,  -- Disable keymaps if not needed
})
```

These options allow flexibility: for instance, disabling keymaps prevents conflicts with your existing setup.

这些选项提供了灵活性：例如，禁用键映射可以避免与现有设置冲突。

## Usage / 使用

### Commands / 命令

- `:MyPluginGreet` - Displays the configured greeting message in a popup or echo.
  This is useful for quick notifications or debugging.

- `:MyPluginGreet` - 在弹出窗口或回显中显示配置的问候消息。
  这对于快速通知或调试很有用。

### Keymaps / 键映射

If `enable_keymaps` is true:

- `<leader>mp` - Triggers the greet function (shows the greeting).
  You can remap this in your init.lua if needed.

如果`enable_keymaps`为true：

- `<leader>mp` - 触发greet函数（显示问候）。
  如有需要，您可以在init.lua中重新映射。

### Lua API / Lua API

- `require("my-plugin").greet()` - Manually trigger the greeting.
- `require("my-plugin").setup(opts)` - Configure the plugin with a table of options.

- `require("my-plugin").greet()` - 手动触发问候。
- `require("my-plugin").setup(opts)` - 使用选项表配置插件。

## Development Setup / 开发设置

To contribute or modify this template, set up your environment as follows. This ensures code consistency and quality.

要贡献或修改此模板，请按照以下步骤设置环境。这确保了代码的一致性和质量。

### 1. Install Prerequisites / 安装前提条件

Install these tools globally for best results. They automate checks and formatting.

全局安装这些工具以获得最佳效果。它们自动化检查和格式化。

#### A. Pre-commit (Required) / Pre-commit（必需）

Manages Git hooks to run linters before commits. Prevents bad code from entering the repo.
管理Git钩子，在提交前运行Linting。防止不良代码进入仓库。

- **Pip (Universal):** `pip install pre-commit`
- **MacOS (Homebrew):** `brew install pre-commit`

#### B. StyLua & Luacheck (Required) / StyLua & Luacheck（必需）

StyLua formats Lua code; Luacheck lints for errors and best practices.
StyLua格式化Lua代码；Luacheck检查错误和最佳实践。

- **Cargo (Recommended):** `cargo install stylua`
- **Luarocks (Recommended):** `luarocks install luacheck`
- **MacOS (Homebrew):** `brew install stylua luacheck`

Install luarocks (or add luacheck in luarocks):
`luarocks install --local --only-deps my-plugins-scm-1.rockspec`
`luarocks install --local busted`
`luarocks install --local luacheck`

#### C. Git Cliff (Required for Changelogs) / Git Cliff（变更日志必需）

Generates CHANGELOG.md from commit history using Conventional Commits.
使用Conventional Commits从提交历史生成CHANGELOG.md。

- **Cargo (Recommended):** `cargo install git-cliff`
- **MacOS (Homebrew):** `brew install git-cliff`
- **After add the git cliff:**
  `cd /path/to/your/clone/`
  `rm CHANGELOG.md`
  `git cliff --output CHANGELOG.md`

#### D. Commitizen (Optional) / Commitizen（可选）

Interactive tool for writing standardized commit messages.
用于编写标准化提交消息的交互工具。

- **NPM:** `npm install -g commitizen cz-conventional-changelog`
- **IF YOU SEE THIS:** `npm error Error: EACCES: permission denied, mkdir '/usr/local/lib/node_modules/commitizen'`
  1. **create a dir for npm global packages:** `mkdir ~/.npm-global`
  2. **config npm to use thisdir**: `npm config set prefix '~/.npm-global'`
  3. **add to your .shrc the PATH:** `echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.zshrc #zsh for example`
  4. **reload:** `source ~/.zshrc`
  5. **now install it without sudo:** `npm install -g commitizen
cz-conventional-changelog`

### 2. Initialize the Project / 初始化项目

After cloning:
克隆后：

1. **Install Pre-commit hook:** `pre-commit install` (Runs StyLua and Luacheck on commits).
2. **Install Commit-msg hook:** `pre-commit install --hook-type commit-msg` (Validates commit messages).
3. **Verify:** `pre-commit run --all-files` (Should pass on clean repo).

4. **安装Pre-commit钩子：** `pre-commit install`（在提交时运行StyLua和Luacheck）。
5. **安装Commit-msg钩子：** `pre-commit install --hook-type commit-msg`（验证提交消息）。
6. **验证：** `pre-commit run --all-files`（在干净仓库中应通过）。

### 3. Usage Guide / 使用指南

#### Committing Code / 提交代码

Follow [Conventional Commits](https://www.conventionalcommits.org/) for semantic versioning.
遵循[Conventional Commits](https://www.conventionalcommits.org/)以实现语义化版本控制。

- **Interactive:** `git cz` (Wizard-guided).
- **Manual:** `git commit -m "feat(core): add new feature"` (Hook enforces format).

- **交互式：** `git cz`（向导引导）。
- **手动：** `git commit -m "feat(core): add new feature"`（钩子强制格式）。

#### Updating Changelog / 更新变更日志

- Preview: `git cliff --unreleased`
- Generate: `git cliff --output CHANGELOG.md`

- 预览： `git cliff --unreleased`
- 生成： `git cliff --output CHANGELOG.md`

#### Running Tests / 运行测试

- Run all: `busted`
- Run specific: `busted -m 'TestName'`
- Run with coverage: `busted --coverage`
- Watch mode: `busted --watch`

#### Linting /

- Lint all Lua files: `luacheck lua/ spec/`
- Auto-fix with stylua: `stylua lua/ spec/`
- Check formatting only stylua: `stylua --check lua/ spec/`

#### Documentation / 文档

- Install: cargo install lemmy-help: `lemmy-help lua/my-plugins/init.lua > doc/my-plugins.txt`

#### Release / 发布

```bash
# Generate changelog
git cliff --tag v1.0.0 > CHANGELOG.md

# Commit with commitizen
npx cz

# Tag release
git tag v1.0.0
git push --tags
```

### 4. File Structure / 文件结构

```
my-plugin.nvim/
├── .github/                # GitHub workflows
│   └── workflows/
│       ├── lint.yml        # Luacheck linting
│       ├── test.yml        # Busted tests
│       └── release.yml     # Auto-publish to LuaRocks
├── lua/                    # Core Lua code
│   └── my-plugin/
│       └── init.lua        # Main entry point
├── plugin/                 # Auto-loaded scripts
│   └── my-plugin.lua       # Commands and keymaps
├── spec/                   # Tests
│   └── my-plugin_spec.lua  # Example test file
├── doc/                    # Documentation
│   └── my-plugin.txt       # Vim help file (optional)
├── .busted                 # Busted config
├── .editorconfig           # Editor settings
├── .gitignore              # Git ignores
├── .luacheckrc             # Luacheck config
├── my-plugin-scm-1.rockspec # LuaRocks spec
├── README.md               # This file
└── LICENSE                 # Your license
```

This structure keeps things organized: core logic in `lua/`, tests in `spec/`, and configs at root.
此结构保持组织性：核心逻辑在`lua/`中，测试在`spec/`中，配置在根目录。

## Development / 开发

### Running Tests / 运行测试

Tests use Busted for unit and integration testing.
测试使用Busted进行单元和集成测试。

- Install deps: `luarocks test --local`
- Run all: `busted`
- Single file: `busted spec/my-plugin_spec.lua`

- 安装依赖： `luarocks test --local`
- 运行全部： `busted`
- 单个文件： `busted spec/my-plugin_spec.lua`

### Linting / Linting

Manually lint: `luacheck lua/` (Checks for issues like unused variables).
手动Linting： `luacheck lua/`（检查如未使用变量等问题）。

## License / 许可证

MIT License. Feel free to fork and adapt for your own plugins!
MIT许可证。欢迎fork并适应到您自己的插件！
