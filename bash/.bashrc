# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" == "gnome-terminal" ]
then
    export TERM=xterm-256color
fi
##############################################################################


# Bash history size
export HISTSIZE=100000
# Prevent back-to-back duplicates from being saved
export HISTCONTROL=ignoreboth:erasedups


export EDITOR=nvim
export PATH=$PATH:~/.local/bin:~/bin
export XDG_CONFIG_HOME=~/.config


# Modules
[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
[[ -f ~/.bash_fzf ]] && source ~/.bash_fzf
[[ -f ~/.bash_work ]] && source ~/.bash_work
for module in ~/.bash_private/*; do
    [[ -f $module/init.sh ]] && source $module/init.sh
done


# Bat
export BAT_THEME="Monokai Extended Light"


# Ranger
export TERMCMD="gnome-terminal"


# git-subrepo
[[ -f ~/.local/bin/git-subrepo/.rc ]] && source ~/.local/bin/git-subrepo/.rc


# https://github.com/rupa/z
[[ -f /usr/share/z/z.sh ]] && source /usr/share/z/z.sh


# Nix
[ -e /home/francium/.nix-profile/etc/profile.d/nix.sh ] \
    && source /home/francium/.nix-profile/etc/profile.d/nix.sh


# NVM
# Load manually
function nvmi {
    echo -n "Initialising nvm..."

    source /usr/share/nvm/init-nvm.sh 2> /dev/null
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    export PATH=$PATH:`npm config --global get prefix`/bin

    # NPM completion
    [[ -x "$(command -v npm)" ]] && source <(npm completion)

    # clear line
    echo -ne "\r$(tput el)"
}
# Args: <command to run after initialization>
function nvmi-proxy {
    unalias node
    unalias npm
    unalias nvm
    nvmi

    # All args after first are treated as command + args to execute
    ${@:1}
}
alias node="nvmi-proxy node"
alias npm="nvmi-proxy npm"
alias nvm="nvmi-proxy nvm"
