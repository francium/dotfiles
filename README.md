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

Vim requires separate initialization using, `$ nvim +PlugInstall
+UpdateRemotePlugins +qa`  or by calling `:PlugInstall` from the Vim command
line.

Tmux requires separate initialization using `<prefix> <shift><i>` from within
Tmux.


## Updating

    make update

Vim requires separate upgrade procedure using `:PlugUpgrade` from the Vim
command line.  Tmux requires separate initialization using `<prefix><shift><u>`.


## Uninstallation

    make uninstall
