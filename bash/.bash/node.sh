# Node version manager
#
# Lazy loading to prevent slowing down shell start up

function nvmi {
    echo -n "Initialising nvm..."

    source /usr/share/nvm/init-nvm.sh 2> /dev/null
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    export PATH=$PATH:`npm config --global get prefix`/bin

    # NPM completion
    [[ -x "$(command -v npm)" ]] && source <(npm completion)

    # clear line
    echo -ne "\r$(tput el)"
}

# Args: <command to run after initialization>
function nvmi-proxy {
    alias nnn=
    unalias node
    unalias npm
    unalias nvm
    nvmi

    # All args after first are treated as command + args to execute
    ${@:1}
}

alias nnn="nvmi-proxy"
alias node="nvmi-proxy node"
alias npm="nvmi-proxy npm"
alias nvm="nvmi-proxy nvm"

alias nbin='PATH=$PATH:`npm bin`'
