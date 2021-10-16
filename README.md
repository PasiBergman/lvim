# LunarVim configuration

## My usage

I mostly code with

- TypeScript & JavaScript
  - Node
  - Vue
  - React
- C#
  - .NET & ASP.NET Core
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

# Fast Node Manager. Replace
NODE_VERSION="14.18.1"
fnm install $NODE_VERSION
fnm default $NODE_VERSION
fnm use $NODE_VERSION

# NPM
npm install -g eslint_d markdownlint-cli neovim prettier stylelint yarn

# PIP
pip3 install black isort flake8 pynvim

# LuaRocks
luarocks luacheck

# StyLua
STYLUA_VERSION="0.11.0"
cd ~/.local/bin
wget https://github.com/JohnnyMorganz/StyLua/releases/download/v${STYLUA_VERSION}/stylua-${STYLUA_VERSION}-macos.zip
unzip stylua-${STYLUA_VERSION}-macos.zip
rm stylua-${STYLUA_VERSION}-macos.zip
chmod +x stylua

# LunarVim
LVBRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
```

### LunarVim

I have disabled the automatic installation of language servers.

```vim
:PackerSync
:LspInstall vuels omnisharp tsserver sumneko_lua pyright html cssls yamlls
:LspInstall jsonls vimls emmet_ls dockerls tailwindcss
```
