# fnm
FNM_PATH=~/.fnm
if [[ -d $FNM_PATH ]]; then
    export PATH=$FNM_PATH:$PATH
    eval "$(fnm env)"
else
    alias nvm="echo install fnm from https://github.com/Schniz/fnm"
    alias fnm="echo install fnm from https://github.com/Schniz/fnm"
    alias node="echo install fnm from https://github.com/Schniz/fnm"
    alias nvm="echo install fnm from https://github.com/Schniz/fnm"
fi
