RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 34)\]"
PURPLE="\[$(tput setaf 55)\]"
PINK="\[$(tput setaf 198)\]"
RESET="\[$(tput sgr0)\]"
BOLD="\[$(tput bold)\]"
PRIMARY=$PURPLE
PRIMARY=$PINK

function update_term_color {
    TERM_COLOR_FILE=~/.term_color
    if [ -e $TERM_COLOR_FILE ]; then
        export TERM_COLOR=`cat $TERM_COLOR_FILE`
        if [ $TERM_COLOR == 'dark' ]; then
            PRIMARY=$GREEN
        else
            PRIMARY=$PURPLE
        fi
    fi
}

function git_branch {
    if [ -d .git ]; then
        git branch | grep \* | cut -d'*' -d' ' -f 2 | awk '{print "["$1"]"}'
    fi
}

function virtual_env {
    if [[ $VIRTUAL_ENV != "" ]]
    then
        venv=" (${VIRTUAL_ENV##*/})"
    else
        venv=""
    fi
}

# from ezprompt.net
# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

function is_tmux {
    if [ $TMUX ]
    then
        echo †
    fi
}

function reprompt {
    if [ $(tput cols) -ge 80 ]
    then
        PS1="$PS1$PRIMARY\\$ $RESET"
    else
        PS1="$PS1$PRIMARY\n\\$ $RESET"
    fi
}

function exit_code {
    if [ $CODE != 0 ]
    then
        echo [$CODE]
    fi
}

function _prompt {
    CODE="$?"
    virtual_env
    # symbols
    # ⋙   ↳ ⤷
    INDICATOR=">>>"
    PS1="$BOLD$RED\`exit_code\`$PRIMARY[\t][\u@\h \W]$RED\`parse_git_branch\`$RESET$BOLD$venv $PRIMARY`is_tmux`\n$PRIMARY$INDICATOR $RESET"

    # window title
    echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
}

PROMPT_COMMAND=_prompt

update_term_color

reprompt
