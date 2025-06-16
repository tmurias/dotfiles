Repository for setting up dotfiles for use across multiple unix machines

# BASH

.bashrc contains bash config. Copy this to ~/.bashrc and replace previous
version if present.


# NEOVIM

Run the setup_nvim.sh script to link config and install plugins.

Treesitter instructions:
- C/C++:
    - Make sure gcc and g++ are installed (maybe clang is supported too, idk)
    - :TSInstall c
    - :TSInstall cpp
- Python
    - Make sure python (or python3) is in path, in addition to gcc and g++ being installed
    - :TSInstall python
- Other
    - Install vim and lua to be able to parse config files
        - :TSInstall vim
        - :TSInstall lua
    - For :help menu
        - :TSInstall vimdoc

Also need to install ctags for jump-to-definition and the tagbar to work.

Access to system clipboard: need to install a provider (eg. xclip for X11 or
wl-clipboard for wayland).
