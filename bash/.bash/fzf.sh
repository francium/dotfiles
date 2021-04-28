# FZF
export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git --exclude node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash


# Use fzf to find a file and open it in the $EDITOR
function fe {
    FILE=`fzf`
    if [ $? == 0 ]; then
        $EDITOR $FILE
    fi
}


# FZF git utils
# https://stackoverflow.com/questions/36513310/how-to-get-a-gits-branch-with-fuzzy-finder
#########################################################################################
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
    git branch --sort=committerdate -vv --color=always | grep -v '/HEAD\s' |
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
bind '"\C-g\C-g": "$(gb)\e\C-e\er"'
bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
bind '"\C-g\C-r": "$(gr)\e\C-e\er"'
#########################################################################################
