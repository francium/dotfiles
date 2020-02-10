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
```

Tmux requires an additional step using `<prefix> <shift><i>` (from within a tmux
session) to install plugins.


## Updating
```
    make update
```

Tmux requires an additional step using `<prefix><shift><u>` (from within a tmux
session) to update plugins.


## Uninstallation
```
    make uninstall
```


## Installing Coc Plugins
See https://github.com/neoclide/coc.nvim/wiki/Language-servers for additional
plugins

### Rust
`:CocInstall coc-rust-analyzer`
