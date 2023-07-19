# function fnm-init() {
#     # If the `--shell` flag isn't specified, `fnm env` is very slow
#     eval "$(fnm env --shell=bash)"
# }

# The function contains the cached output of `eval "$(npm completion)"` because
# running the command directly is very slow
function npm-init-completion() {
    ###-begin-npm-completion-###
    #
    # npm command completion script
    #
    # Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
    # Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
    #

    if type complete &>/dev/null; then
    _npm_completion () {
        local words cword
        if type _get_comp_words_by_ref &>/dev/null; then
        _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
        else
        cword="$COMP_CWORD"
        words=("${COMP_WORDS[@]}")
        fi

        local si="$IFS"
        if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                            COMP_LINE="$COMP_LINE" \
                            COMP_POINT="$COMP_POINT" \
                            npm completion -- "${words[@]}" \
                            2>/dev/null)); then
        local ret=$?
        IFS="$si"
        return $ret
        fi
        IFS="$si"
        if type __ltrim_colon_completions &>/dev/null; then
        __ltrim_colon_completions "${words[cword]}"
        fi
    }
    complete -o default -F _npm_completion npm
    elif type compdef &>/dev/null; then
    _npm_completion() {
        local si=$IFS
        compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                    COMP_LINE=$BUFFER \
                    COMP_POINT=0 \
                    npm completion -- "${words[@]}" \
                    2>/dev/null)
        IFS=$si
    }
    compdef _npm_completion npm
    elif type compctl &>/dev/null; then
    _npm_completion () {
        local cword line point words si
        read -Ac words
        read -cn cword
        let cword-=1
        read -l line
        read -ln point
        si="$IFS"
        if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                        COMP_LINE="$line" \
                        COMP_POINT="$point" \
                        npm completion -- "${words[@]}" \
                        2>/dev/null)); then

        local ret=$?
        IFS="$si"
        return $ret
        fi
        IFS="$si"
    }
    compctl -K _npm_completion npm
    fi
    ###-end-npm-completion-###
}

# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#     FNM_PATH=~/.fnm
#     if [[ -d $FNM_PATH ]]; then
#         export PATH=$FNM_PATH:$PATH
#         fnm-init
#     else
#         MSG="echo install fnm from https://github.com/Schniz/fnm"
#         alias fnm=$MSG
#         alias node=$MSG
#         alias npm=$MSG
#     fi
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#     if command -v fnm > /dev/null; then
#         fnm-init
#     else
#         MSG="echo brew install fnm"
#         alias fnm=$MSG
#         alias node=$MSG
#         alias npm=$MSG
#     fi
# fi
#
# alias nvm="echo Use fnm"
# alias fnm-reload='fnm-init'
#
if command -v npm > /dev/null; then
    npm-init-completion
fi

alias nbin="export PATH=./node_modules/.bin:$PATH"
