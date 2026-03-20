#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Link config
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
if grep -Fq "source $SCRIPT_DIR/.config/nvim/init.vim" ~/.config/nvim/init.vim
then
	printf '~/.config/nvim/init.vim already links to managed config\n'
else
	printf 'Linking ~/.config/nvim/init.vim to managed nvim config\n'
	printf "\nsource $SCRIPT_DIR/.config/nvim/init.vim\n" >> ~/.config/nvim/init.vim
fi

# Install plugins
python3 ./nvim_plugin_install_update.py

# Link lua files
mkdir -p ~/.config/nvim/lua/taylor
ln -sf "$SCRIPT_DIR/.config/nvim/lua/taylor/lspconfig.lua" \
	~/.config/nvim/lua/taylor/lspconfig.lua
ln -sf "$SCRIPT_DIR/.config/nvim/lua/taylor/treesitterconfig.lua" \
	~/.config/nvim/lua/taylor/treesitterconfig.lua
printf 'Added lua config to ~/.config/nvim/lua/taylor\n'
