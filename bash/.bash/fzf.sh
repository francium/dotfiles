# FZF
export FZF_TMUX_HEIGHT=66%
export FZF_DEFAULT_OPTS='
  --layout=reverse
 --color=fg:-1,bg:-1,hl:#ff6666
 --color=fg+:#ffffff,bg+:#3d3d3d,hl+:#ff6666
 --color=info:#ffffff,prompt:#ff6666,pointer:#ffffff
 --color=marker:#ff6666,spinner:#ff6666,header:#ffffff
'
export FZF_DEFAULT_COMMAND='fd --hidden --exclude .git --exclude node_modules'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type d"

# Different distros seem to install it to different locations
if [[ -f /usr/share/fzf/key-bindings.bash ]]; then
    # Arch
    source /usr/share/fzf/key-bindings.bash
elif [[ -f /usr/share/bash-completion/completions/fzf ]]; then
    # Ubuntu
    source /usr/share/doc/fzf/examples/key-bindings.bash
fi


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

# gf() {
#   is_in_git_repo &&
#     git -c color.status=always status --short |
#     fzf --height 40% -m --ansi --nth 2..,.. | awk '{print $2}'
# }

# Git branch
gb() {
  is_in_git_repo &&
    git branch --sort=committerdate -vv --color=always | grep -v '/HEAD\s' |
    fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
    sed 's#^remotes/[^/]*/##'
}

# Git all branches
# gbr() {
#   is_in_git_repo &&
#     git branch --sort=committerdate -vv --color=always --all | grep -v '/HEAD\s' |
#     fzf --height 40% --ansi --multi --tac | sed 's/^..//' | awk '{print $1}' |
#     sed 's#^remotes/[^/]*/##'
# }

# gt() {
#   is_in_git_repo &&
#     git tag --sort -version:refname |
#     fzf --height 40% --multi
# }

# gh() {
#   is_in_git_repo &&
#     git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph |
#     fzf --height 40% --ansi --no-sort --reverse --multi | grep -o '[a-f0-9]\{7,\}'
# }

# gr() {
#   is_in_git_repo &&
#     git remote -v | awk '{print $1 " " $2}' | uniq |
#     fzf --height 40% --tac | awk '{print $1}'
# }

# bind '"\er": redraw-current-line'
# bind '"\C-g\C-f": "$(gf)\e\C-e\er"'
# bind '"\C-g\C-g": "$(gb)\e\C-e\er"'
# bind '"\C-g\C-t": "$(gt)\e\C-e\er"'
# bind '"\C-g\C-h": "$(gh)\e\C-e\er"'
# bind '"\C-g\C-r": "$(gr)\e\C-e\er"'
#########################################################################################


# List all commands using `compgen -c`
__fzf_compgen__() {
  local output opts
  opts="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS +m"
  output=$(
    compgen -c | FZF_DEFAULT_OPTS="$opts" $(__fzfcmd) --query "$READLINE_LINE"
  ) || return
  READLINE_LINE=${output#*$'\t'}
  if [[ -z "$READLINE_POINT" ]]; then
    echo "$READLINE_LINE"
  else
    READLINE_POINT=0x7fffffff
  fi
}
bind -m emacs-standard -x '"\ef": __fzf_compgen__'
bind -m vi-command -x '"\ef": __fzf_compgen__'
bind -m vi-insert -x '"\ef": __fzf_compgen__'
