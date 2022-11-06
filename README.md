Note: Some configs are Linux specific.


# Requirements

- Make (installation)
- git (initializing plugins)


# Usage

Clone this repository into your `$HOME` directory and `cd` into the clone repo.


## Install

```
    git clone --recursive -j 4 <repo URL>
    cd dotfiles
    make install

    # optionally configure GNOME
    ./gnome.sh
```

Tmux requires an additional step using `<prefix> <shift><i>` (from within a tmux
session) to install plugins.


## Updating

```
    make update

    # optionally apply GNOME configurations
    ./gnome.sh
```

Tmux requires an additional step using `<prefix><shift><u>` (from within a tmux
session) to update plugins.


## Uninstallation

```
    make uninstall
```
Note GNOME configuration's aren't reset


## Per machine gitconfig

Create a `~/.gitconfig_private` to allow a per-machine config
```
[user]
    email = bob@example.com
    name = bob
```


## Private bash modules

Each directory under `~/.bash_private/` that has a `init.sh` script will be
sourced


## Vim

Need to install extra packages for some things
- `npm i -g neovim` (possibly for syntax highlighting in some cases)


## Private vim modules

If `~/.vim_private/init.vim` exists, it will be sourced


## Installing Coc Plugins

See https://github.com/neoclide/coc.nvim/wiki/Language-servers for additional
plugins


### Use coc-marketplace to quick fix and list extensions

`:CocInstall coc-marketplace`

List extensions: `CocList marketplace`


### Rust

`:CocInstall coc-rust-analyzer`


### C/C++/Obj-C

Install the Clang language server,
```sh
# Arch Linux
pacman -S ccls
```


### Python

`:CocInstall coc-pyright`
