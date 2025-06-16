#!/bin/sh

# Link config
mkdir -p ~/.config/nvim
touch ~/.config/nvim/init.vim
if grep -Fq "source ~/dotfiles/.config/nvim/init.vim" ~/.config/nvim/init.vim
then
	printf '~/.config/nvim/init.vim already links to managed config\n'
else
	printf 'Linking ~/.config/nvim/init.vim to managed nvim config\n'
	printf "\nsource ~/dotfiles/.config/nvim/init.vim\n" >> ~/.config/nvim/init.vim
fi

# Install plugins
python3 ./nvim_plugin_install_update.py

# Copy over lua files
printf 'Added lua config to ~/.config/nvim/lua/taylor\n'
mkdir -p ~/.config/nvim/lua/taylor
cp .config/nvim/lua/taylor/lspconfig.lua ~/.config/nvim/lua/taylor/lspconfig.lua
cp .config/nvim/lua/taylor/treesitterconfig.lua ~/.config/nvim/lua/taylor/treesitterconfig.lua
