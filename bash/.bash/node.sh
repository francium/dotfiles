# fnm
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    FNM_PATH=~/.fnm
    if [[ -d $FNM_PATH ]]; then
        export PATH=$FNM_PATH:$PATH
        eval "$(fnm env)"
    else
        MSG="echo install fnm from https://github.com/Schniz/fnm"
        alias nvm=$ALIAS
        alias fnm=$ALIAS
        alias node=$ALIAS
        alias npm=$ALIAS
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v fnm; then
        eval "$(fnm env)"
    else
        MSG="echo brew install fnm"
        alias nvm=$ALIAS
        alias fnm=$ALIAS
        alias node=$ALIAS
        alias npm=$ALIAS
    fi
fi
