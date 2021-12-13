# fnm
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    FNM_PATH=~/.fnm
    if [[ -d $FNM_PATH ]]; then
        export PATH=$FNM_PATH:$PATH
        eval "$(fnm env)"
    else
        MSG="echo install fnm from https://github.com/Schniz/fnm"
        alias nvm=$MSG
        alias fnm=$MSG
        alias node=$MSG
        alias npm=$MSG
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v fnm; then
        eval "$(fnm env)"
    else
        MSG="echo brew install fnm"
        alias nvm=$MSG
        alias fnm=$MSG
        alias node=$MSG
        alias npm=$MSG
    fi
fi


alias nbin="export PATH=./node_modules/.bin:$PATH"
