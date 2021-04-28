# Ruby version manager
#
# Lazy loading to prevent slowing down shell start up

function rvmi {
    echo -n "Initialising rvm..."

    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

    # NOTE: I moved this to NOT be the last one, as that would require this to be
    # outside this separate bash module file. If something doesn't work right,
    # maybe have to actually move this to really be the last PATH variable change
    #
    # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"

    # clear line
    echo -ne "\r$(tput el)"
}

# Args: <command to run after initialization>
function rvmi-proxy {
    alias rrr=
    unalias ruby
    unalias irb
    unalias bundle
    unalias rake
    rvmi

    # All args after first are treated as command + args to execute
    ${@:1}
}

alias rrr="rvmi-proxy"
alias ruby="rvmi-proxy ruby"
alias irb="rvmi-proxy irb"
alias bundle="rvmi-proxy bundle"
alias rake="rvmi-proxy rake"
