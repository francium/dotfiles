# General
    alias reload='source ~/.bashrc'
    alias :q='exit'
    alias :wq='exit'
    alias ..='cd ..'
    alias grep='grep --color=always'
    alias ls='ls -hlx --color=auto'
    alias l='ls -hlX --color=auto'
    alias ll='ls -ahlX --color=auto'
    alias rm='rm  -i'
    # -v prints out each directory created
    alias mkdir='mkdir -pv'
    alias open='xdg-open'


# System
    alias cpulimit='sudo set-powersave && sudo set-freq 1600'
    alias cpufull='sudo set-performance && sudo set-freq 2800'
    alias batstat='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
    alias vitals='sensors | grep "Exhaust\|Physical\|Core"'


# Utils
    alias wget-dir='wget -r --no-parent'
    alias simpleserver='python -m http.server'
    alias httpsserve='~/linux-scripts/httpsserve'


# NodeJS
    alias nbin='PATH=$PATH:`npm bin`'


# Python
    alias pe='pipenv'


# Vim
    alias n='nvim'
    alias nd='d=1 nvim' # dark theme
    # Reopen last file edited with vim
    alias :e='nvim $( history | sed -n "s/^ *[0-9][0-9]* *vim *\(.*\)/\1/p" | tail -1 )'


function name {
    PROMPT_COMMAND=
    echo -en "\033]0;$1\a"
}

function mpv-audio {
    mpv --no-video $1
}

# find wrapper
function findfile {
    find . -iname "*$1*"
}

watchexec() {
    # watchexec WATCHED_FILE "command to execute..."
    # Make sure command to execute is within strings.
    while true; do
        inotifywait -e modify $1
        rc=$?
        if [ $rc == 1 ]; then
            eval ${@:2}
        else
            echo "Unhandled return code $rc"
        fi
    done
}

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

function log {
    filename=~/wiki/log/`date +%Y-%m-%d`.md
    if [ ! -e $filename ]; then
        echo -e "# `date '+%A, %B %d %Y'`\n\n\n" > $filename
    fi
    $EDITOR $filename
}

# Use fzf to find a file and open it in the $EDITOR
function fe {
    FILE=`fzf`
    if [ $? == 0 ]; then
        $EDITOR $FILE
    fi
}

#########################################################################################
# https://stackoverflow.com/questions/36513310/how-to-get-a-gits-branch-with-fuzzy-finder
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

gf() {
  is_in_git_repo &&
    git -c color.status=always status --short |
    fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
}

gb() {
  is_in_git_repo &&
    git branch -a -vv --color=always | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

gt() {
  is_in_git_repo &&
    git tag --sort -version:refname |
    fzf --height 40% --multi
}

gh() {
  is_in_git_repo &&
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
    fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
}

gr() {
  is_in_git_repo &&
    git remote -v | awk '{print $1 " " $2}' | uniq |
    fzf --height 40% --tac | awk '{print $1}'
}

bind '"\er": redraw-current-line'
bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
bind '"\C-g\C-b": "$(gb)\e\C-e\er"'
bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
bind '"\C-g\C-r": "$(gr)\e\C-e\er"'
#########################################################################################
