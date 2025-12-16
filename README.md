## 🛠️ Development Setup

This project uses a suite of tools to ensure code quality, consistent formatting, and standardized commit messages. Please follow the steps below to set up your environment.

### 1. Install Prerequisites

You will need the following tools installed on your system.

#### A. Pre-commit (Required)

Manages Git hooks to run checks automatically before you commit.

- **Pip (Universal):** `pip install pre-commit`
- **MacOS (Homebrew):** `brew install pre-commit`

#### B. StyLua & Luacheck (Required)

Handles Lua formatting and linting.

- **Cargo (Recommended):** `cargo install stylua`
- **Luarocks (Recommended):** `luarocks install luacheck`
- **MacOS (Homebrew):** `brew install stylua luacheck`

#### C. Git Cliff (Required for Changelogs)

Generates the `CHANGELOG.md` from your commit history.

- **Cargo (Recommended):** `cargo install git-cliff`
- **MacOS (Homebrew):** `brew install git-cliff`

#### D. Commitizen (Optional)

An interactive tool to help you write valid "Conventional Commits".

- **NPM:** `npm install -g commitizen cz-conventional-changelog`

---

### 2. Initialize the Project

After installing the tools and cloning the repository, you **must** initialize the git hooks. This connects the tools to your git actions.

1.  **Install the Pre-commit hook:**
    (This runs StyLua and Luacheck on every commit)

    ```bash
    pre-commit install
    ```

2.  **Install the Commit-msg hook:**
    (This checks if your commit message follows the standard format)

    ```bash
    pre-commit install --hook-type commit-msg
    ```

3.  **Verify Setup:**
    Run this command to check if everything is working (it should pass all checks on the existing files):
    ```bash
    pre-commit run --all-files
    ```

---

### 3. Usage Guide

#### 📝 committing Code

We use [Conventional Commits](https://www.conventionalcommits.org/). You have two ways to commit:

- **Interactive Mode (Recommended):**
  Run `git cz`. This opens a wizard that guides you through the type (feat, fix, docs), scope, and description.

  ```bash
  git cz
  ```

- **Manual Mode:**
  Ensure your commit message follows the pattern `<type>(<scope>): <description>`.
  ```bash
  git commit -m "feat(core): add new trim logic"
  ```
  _If the format is wrong, the pre-commit hook will reject the commit._

#### 📄 Updating the Changelog

When you are ready to release or want to see what has changed:

- **Preview unreleased changes:**
  ```bash
  git cliff --unreleased
  ```
- **Write changes to CHANGELOG.md:**
  ```bash
  git cliff --output CHANGELOG.md
  ```
