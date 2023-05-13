# General
    # f# like |> pipelining, example `echo "~/.bashrc" |: vim _`
    # sed here is removing the last newline of the output
    alias ::='sed -z "$ s/\n$//" | xargs -i_ --'

    export LS_COMMON_OPTS='-h'
        # -h human readable
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias ls='ls $LS_COMMON_OPTS --color=auto -X'
    alias l='ls $LS_COMMON_OPTS --color=auto -X'
    alias ll='ls $LS_COMMON_OPTS --color=auto -lX'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls $LS_COMMON_OPTS -G'
    alias l='ls $LS_COMMON_OPTS -G'
    alias ll='ls $LS_COMMON_OPTS -G -l'
fi

    # Usage: `gtk-light <gtk-application>`
    alias gtk-light='GTK_THEME=Adwaita:light'

    function mkcd {
        command mkdir -p "$1" && \
        command cd "$1" && \
        pwd
    }
    function cd {
        command cd "${@:1}" && ls
    }

    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'

    alias reload='source ~/.bashrc'
    alias :q='exit'
    alias :wq='exit'
    alias grep='grep --color=always'
    alias vgrep='grep --color=always -v'
    alias rm='rm  -i'
    # -v prints out each directory created
    alias mkdir='mkdir -pv'
if [[ "$OSTYPE" != "darwin"* ]]; then
    alias open='xdg-open'
fi
    alias d.='cd ~/dotfiles'

    alias gti=git
    alias ggit=git
    function git-root() {
        ROOT=$(git rev-parse --show-toplevel 2>/dev/null) && \
        echo Changed directory to $ROOT && \
        cd $ROOT || \
        echo No git repo found
    }
    function git-cd() {
        git clone "$1" && DIR=$(basename "$1" .git) && \
        echo Changed directory to "$DIR" && \
        cd "$DIR"
    }

    alias man80='MANWIDTH=80 man'


# System
    alias cpulimit='sudo set-powersave && sudo set-freq 1600'
    alias cpufull='sudo set-performance && sudo set-freq 2800'
    alias batstat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
    alias vitals='sensors | grep "Exhaust\|Physical\|Core"'


# Utils
    function col {
        eval "awk '{ print \$$1 }'"
    }

    function skip {
        tail -n +$(($1 + 1))
    }

    function take {
        head -n $1
    }


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias sel='tr --delete "\n" | xclip -selection c'
    alias seln='xclip -selection c'
    alias pst='xclip -selection c -o'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias sel='tr --delete "\n" | pbcopy'
    alias seln='pbcopy'
    alias pst='pbpaste'
fi

    alias wget-dir='wget -r --no-parent'
    alias simpleserver='env python3 -m http.server'
    function nite {
        pkill gammastep
        gammastep -P -O $1 &
    }

    alias yt-mp3="youtube-dl -x --audio-format mp3"
    alias yt-720p="youtube-dl -f 'bestvideo[height<=720]+bestaudio'"
    alias yt-1080p="youtube-dl -f 'bestvideo[height<=1080p]+bestaudio'"
    alias yt-mp3-playlist-indexed="youtube-dl -x --audio-format mp3 -o \"%(playlist_index)s - %(title)s.%(ext)s\""
    function make-m3u-playlist {
        PATTERN=$1
        if [ -z $PATTERN ]; then
            echo "Usage: $0 <media file extension>"
            return
        fi

        ls -1 | grep --color=never -E $PATTERN > "00 - playlist.m3u"
    }

    alias mpv-audio='mpv --no-video'

    function passfzf() {
        FZF_CANCEL=130
        PREV_DIR=$(pwd)

        command cd ~/.password-store
        SELECTION=$(fd -tf --color=never | sed "s/\.gpg$//" | fzf)
        if [[ "$?" == "$FZF_CANCEL" ]]; then
            cd $PREV_DIR
            return
        fi

        if [ "$1" == "-v" ]; then
            pass $SELECTION
        else
            pass -c $SELECTION
        fi
        command cd $PREV_DIR
    }


# Vim
    alias n='nvim'


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
