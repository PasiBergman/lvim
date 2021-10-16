# LunarVim configuration

## My usage

I mostly code with

- TypeScript & JavaScript
  - Node
  - Vue
  - React
- C#
  - ASP.NET Core
- Python 3
- Lua
- Swift
  - iOS/iPadOS/macOS

## Setup/Dependencies

### macOS (homebrew)

```shell
# Homebrew
brew update
brew install neovim fzy luarocks ripgrep shellcheck shmft fnm python@3.9
brew install font-fira-code-nerd-font

# Fast Node Manager
fnm install 14.18.1
fnm default 14.18.1
fnm use 14.18.1

# NPM
npm install -g eslint_d markdownlint-cli neovim prettier stylelint yarn

# PIP
pip3 install black isort flake8 pynvim

# LuaRocks
luarocks luacheck

# LunarVim
LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
```

### LunarVim

I have disabled the automatic installation of language servers.

```vim
:LspInstall vuels omnisharp tsserver sumneko_lua pyright html cssls yamlls jsonls vimls
```
