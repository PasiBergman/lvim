# My LunarVim configuration

- [Neovim](https://github.com/neovim/neovim) stable
- [LunarVim](http://github.com/LunarVim/LunarVim) rolling

![LunarVim](assets/lvim-config-lunarvim.png =800x)

I mainly use:

- TypeScript & JavaScript
  - Node
  - Vue
  - React
- C#
  - .NET (Core)
  - ASP.NET Core
- Python 3
- Lua
- Swift
  - iOS/iPadOS/macOS
- HTML & CSS
- Markdown & JSON & Yaml

## Setup/Dependencies

### macOS (Homebrew)

```shell
# Homebrew
brew update
brew install neovim fzy luarocks ripgrep shellcheck shfmt fnm python@3.9
brew install font-fira-code-nerd-font

# Fast Node Manager
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

# LunarVim (rolling)
LVBRANCH=rolling \
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

# My LunarVim configuration
cd ~/.config
mv lvim lvim-original
git clone https://github.com/PasiBergman/lvim.git lvim-my
ln -s lvim-my lvim
```

### LunarVim

I have disabled the automatic installation of language servers.

```vim
:PackerSync
:LspInstall vuels omnisharp tsserver sumneko_lua pyright html cssls
:LspInstall jsonls yamlls vimls emmet_ls dockerls tailwindcss
```

## Screenshots

![TypeScript](assets/lvim-config-ts.png =800x)
![Vue](assets/lvim-config-vue.png =800x)
![C#](assets/lvim-config-cs.png =800x)
