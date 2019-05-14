# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" ==\
    "gnome-terminal" ]
then
    export TERM=xterm-256color
fi

##############################################################################

# Bash history size
HISTSIZE=100000

export EDITOR=nvim
export PATH=$PATH:~/.local/bin
export XDG_CONFIG_HOME=~/.config

export FZF_DEFAULT_COMMAND='fd --exclude .git --exclude node_modules --hidden .'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
export BAT_THEME="Monokai Extended Light"

# Ranger
export TERMCMD="gnome-terminal"

# Bash vi mode
# set -o vi

# Cycle command completion mode
bind TAB:menu-complete

# Modules
source ~/.bash_prompt
source ~/.bash_aliases

# nvm
source /usr/share/nvm/init-nvm.sh 2> /dev/null

# git-subrepo
source ~/.local/bin/git-subrepo/.rc 2> /dev/null

# FZF keybindings
source /usr/share/fzf/key-bindings.bash

# https://github.com/rupa/z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
