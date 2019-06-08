Note: Some configs are Linux specific.


# Requirements

- Make (installation)
- git (initializing plugins)


# Usage

Clone this repository into your `$HOME` directory and `cd` into the clone repo.


## Install
    git clone --recursive -j 4 <repo URL>
    cd dotfiles
    make install

Vim requires separate initialization using `:PlugInstall` from the Vim command line.
Tmux requires separate initialization using `<prefix> <shift><i>`.


## Updating

    make update

Vim requires separate upgrade procedure using `:PlugUpgrade` from the Vim command line.
Tmux requires separate initialization using `<prefix><shift><u>`.


## Uninstallation

    make uninstall
