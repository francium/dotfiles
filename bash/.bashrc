# function __tic() {
#     eval "(( $1 = ${EPOCHREALTIME/./} / 1000 ))"
# }
#
# __tic _T_START

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# Bash history size
export HISTSIZE=1000000
# Technically redundant, as per `man bash`: "The  shell  sets the default value
# to the value of HISTSIZE after reading any startup files."
export HISTFILESIZE=$HISTSIZE

# Prevent back-to-back duplicates from being saved
export HISTCONTROL=ignoreboth:erasedups
# shopt -s histappend

export EDITOR=nvim
export PATH=$PATH:~/.local/bin:~/.local/ibin:~/.local/ibin_private:~/bin
export XDG_CONFIG_HOME=~/.config

export MANWIDTH=80
export MANPATH=~/.local/share/man:$MANPATH


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
[[ -f ~/.bash/deno.sh ]] && source ~/.bash/deno.sh
[[ -f ~/.bash/fzf.sh ]] && source ~/.bash/fzf.sh
[[ -f ~/.bash/asdf.sh ]] && source ~/.bash/asdf.sh
[[ -f ~/.bash/homebrew.sh ]] && source ~/.bash/homebrew.sh
[[ -f ~/.bash/go.sh ]] && source ~/.bash/go.sh
[[ -f ~/.bash/haskell.sh ]] && source ~/.bash/haskell.sh
[[ -f ~/.bash/nix.sh ]] && source ~/.bash/nix.sh
[[ -f ~/.bash/nnn.sh ]] && source ~/.bash/nnn.sh
[[ -f ~/.bash/node.sh ]] && source ~/.bash/node.sh
[[ -f ~/.bash/prompt.sh ]] && source ~/.bash/prompt.sh
[[ -f ~/.bash/python.sh ]] && source ~/.bash/python.sh
[[ -f ~/.bash/rust.sh ]] && source ~/.bash/rust.sh
[[ -f ~/.bash/ranger.sh ]] && source ~/.bash/ranger.sh
[[ -f ~/.bash/ruby.sh ]] && source ~/.bash/ruby.sh
[[ -f ~/.bash/z.sh ]] && source ~/.bash/z.sh


# Set dark theme env var, do before running private bash configs
export d=1


[[ -d ~/.bash_private ]] && for module in ~/.bash_private/*; do
    [[ -f $module/init.sh ]] && source $module/init.sh
done


# Do colors after to allow private configs to override environment variable
[[ -f ~/.bash/ls_colors.sh ]] && source ~/.bash/ls_colors.sh


# Prevent non-zero error from any previous command propagating at start up (eg
# not have first prompt show non-zero error code for previous start up command)
echo -n

# __tic _T_END

# _T_TOTAL=$(($_T_END- $_T_START))
# if [ -z $SILENCE_SLOW_INIT_TIME_WARNING ]; then
#     if (($_T_TOTAL > 50)); then
#         echo "Warning: Bashrc took ${_T_TOTAL}ms to initialize"
#     fi
# fi
