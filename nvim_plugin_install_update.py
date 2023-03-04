import os
import subprocess

if __name__ == "__main__":
    plugins_dir = os.path.expanduser("~/.local/share/nvim/site/pack")
    if not os.path.exists(plugins_dir):
        os.makedirs(plugins_dir)

    plugins = [
        ("tmurias", "nerdtree"),
        ("windwp", "nvim-autopairs"),
        ("tpope", "vim-fugitive"),
        ("tmurias", "bufexplorer"),
        ("neovim", "nvim-lspconfig"),
        ("editorconfig", "editorconfig-vim"),
        ("preservim", "tagbar"),
        ("nvim-treesitter", "nvim-treesitter"),
        ("morhetz", "gruvbox"),
        ("mhartington", "oceanic-next"),
    ]

    for p in plugins:
        # Make the directory of the plugin owner if it doesn't exist
        owner_dir = os.path.join(plugins_dir, p[0], "start")
        if not os.path.exists(owner_dir):
            os.makedirs(owner_dir)
        # If the plugin is already installed, update it. Otherwise, clone it
        plugin_dir = os.path.join(owner_dir, p[1])
        if os.path.exists(plugin_dir):
            subprocess.Popen(["git", "pull"], cwd=plugin_dir).wait()
        else:
            plugin_source = "https://github.com/" + p[0] + "/" + p[1]
            subprocess.Popen(["git", "clone", plugin_source], cwd=owner_dir).wait()
