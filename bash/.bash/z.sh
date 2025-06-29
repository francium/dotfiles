# https://github.com/rupa/z
# Linux
[[ -f /usr/share/z/z.sh ]] && source /usr/share/z/z.sh
# MacOS
[[ -f /opt/homebrew/etc/profile.d/z.sh ]] && source /opt/homebrew/etc/profile.d/z.sh

# Slow down aging and keep results around longer
export _Z_MAX_SCORE=250000

# fzf + z (https://github.com/junegunn/fzf/wiki/examples#integration-with-z)
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}
