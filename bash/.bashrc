# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Bash history size
export HISTSIZE=100000
# Prevent back-to-back duplicates from being saved
export HISTCONTROL=ignoreboth:erasedups

export EDITOR=nvim
export PATH=$PATH:~/.local/bin:~/.local/ibin:~/bin
export XDG_CONFIG_HOME=~/.config


if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" == "gnome-terminal" ]; then
    export TERM=xterm-256color
fi


# Distros seem to vary, so both of these are required
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
[[ -d /etc/bash_completion.d ]] && for file in /etc/bash_completion.d/* ; do
    source "$file"
done


# Modules
[[ -f ~/.bash/aliases.sh ]] && source ~/.bash/aliases.sh
[[ -f ~/.bash/fzf.sh ]] && source ~/.bash/fzf.sh
[[ -f ~/.bash/go.sh ]] && source ~/.bash/go.sh
[[ -f ~/.bash/nix.sh ]] && source ~/.bash/nix.sh
[[ -f ~/.bash/node.sh ]] && source ~/.bash/node.sh
[[ -f ~/.bash/prompt.sh ]] && source ~/.bash/prompt.sh
[[ -f ~/.bash/ls_colors.sh ]] && source ~/.bash/ls_colors.sh
[[ -f ~/.bash/python.sh ]] && source ~/.bash/python.sh
[[ -f ~/.bash/ranger.sh ]] && source ~/.bash/ranger.sh
[[ -f ~/.bash/ruby.sh ]] && source ~/.bash/ruby.sh
[[ -f ~/.bash/z.sh ]] && source ~/.bash/z.sh

[[ -d ~/.bash_private ]] && for module in ~/.bash_private/*; do
    [[ -f $module/init.sh ]] && source $module/init.sh
done


# Prevent non-zero error from any previous command propagating at start up (eg
# not have first prompt show non-zero error code for previous start up command)
echo -n


# Set dark theme env var
export d=1
