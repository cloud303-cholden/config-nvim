## Prerequisites
- `neovim 0.7`
- `rust-analyzer`

## Installation
This configuration can be installed by cloning it to the default configuration location:
```sh
git clone https://github.com/cloud303-cholden/config-nvim ~/.config/nvim
```

Personally, I would clone the configuration to something like a `~/repos` directory and symlink it to the actual configuration location. For example:
```sh
git clone https://github.com/cloud303-cholden/config-nvim ~/repos
ln -s ~/repos/config-nvim ~/.config/nvim
```
There are a couple advantages to this.
1. All of my projects where I use version control are in a single location, simplifying how they are managed and accessed.
2. I don't need to check my bloated `~/.config` directory or its subdirectories into version control.

## Credits
Based on Christian Chiarulli's sample configuration [here](https://github.com/LunarVim/nvim-basic-ide.git).
