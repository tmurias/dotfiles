Repository for setting up dotfiles for use across multiple unix machines

# BASH

.bashrc contains bash config. Copy this to ~/.bashrc and replace previous
version if present.


# NEOVIM

Run the setup_nvim.sh script to link config and install plugins.

Treesitter instructions:
- Make sure gcc and g++ are installed (maybe clang is supported too, idk)
- Parsers are already built-in for c, lua, vimscript, vimdoc, markdown
- Others need to be installed manually, eg.
    - :TSInstallFromGrammar cpp
    - :TSInstallFromGrammar python
- TSInstallFromGrammar installs locally from plugin directory instead of downloading from web

Also need to install ctags for jump-to-definition and the tagbar to work.

Access to system clipboard: need to install a provider (eg. xclip for X11 or
wl-clipboard for wayland).
