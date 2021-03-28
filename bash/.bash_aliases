# vim: ft=bash


# General
    # Avoid having to go back and delete prompt icon if copied and pasted a
    # line with it
    alias ↳=''

    alias ls='ls -hlx --color=auto'
    alias l='ls -hlX --color=auto'
    alias ll='ls -ahlX --color=auto'

    alias c='command cd'
    function cd { command cd "${@:1}"; ls; }
    alias ..='cd ..'

    alias reload='source ~/.bashrc'
    alias :q='exit'
    alias :wq='exit'
    alias grep='grep --color=always'
    alias rm='rm  -i'
    # -v prints out each directory created
    alias mkdir='mkdir -pv'
    alias open='xdg-open'
    alias dotfiles='cd ~/dotfiles'


# System
    alias cpulimit='sudo set-powersave && sudo set-freq 1600'
    alias cpufull='sudo set-performance && sudo set-freq 2800'
    alias batstat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
    alias vitals='sensors | grep "Exhaust\|Physical\|Core"'


# Utils
    function col {
        eval "awk '{ print \$1 }'"
    }
    alias sel='xclip -selection c'
    alias pst='xclip -selection c -o'
    alias wget-dir='wget -r --no-parent'
    alias simpleserver='env python3 -m http.server'
    function make-m3u-playlist {
        PATTERN=$1
        if [ -z $PATTERN ]; then
            echo "Usage: $0 <media file extension>"
            return
        fi

        ls -1 | grep --color=never -E $PATTERN > "00 - playlist.m3u"
    }
    alias mpv-audio='mpv --no-video'
    function nite {
        pkill gammastep
        gammastep -P -O $1 &
    }

    alias youtube-dl-mp3="youtube-dl -x --audio-format mp3"


# NodeJS
    alias nbin='PATH=$PATH:`npm bin`'


# Python
    alias pe='pipenv'


# Tmux
    alias t='tmux'


# Vim
    alias n='nvim'
    # Reopen last file edited with vim
    alias :e='nvim $( history | sed -n "s/^ *[0-9][0-9]* *vim *\(.*\)/\1/p" | tail -1 )'


# Rename shell
function name {
    PROMPT_COMMAND=
    echo -en "\033]0;$1\a"
}


# find wrapper
function findfile {
    find . -iname "*$1*"
}


# Find process id of a graphical application by clicking on it
function uiid {
    xprop _NET_WM_PID | sed 's/_NET_WM_PID(CARDINAL) = //' | ps `cat`
}


function rename_win {
    # Use uiid to select window and use last column as old name
    # WON'T work b/c need window title, not program name which is what uuid gives
    old_name=`uiid | awk 'FNR > 1 {$1=$2=$3=$4=""; gsub(/ /, "", $0); print $0}'`
    echo $old_name
    echo $1
    xdotool search --name "$old_name" set_window --name "$1"
}


function venv {
    if [ $# -gt 0 ]; then
        echo "Activating virtual environment in $1"
        . $1/bin/activate
    else
        echo "Activating virtual environment in env"
        . venv/bin/activate
    fi
}
