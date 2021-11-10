## Pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

## Aliases

function venv {
    if [ $# -gt 0 ]; then
        if [ ! -d $1 ]; then
            echo "$1 does not exist"
            return
        fi
        echo "Activating virtual environment in $1"
        . $1/bin/activate
    elif [ -d ./venv ]; then
        echo "Activating virtual environment in ./venv"
        . ./venv/bin/activate
    else
        echo "No virtualenv specified and no ./venv found"
        echo "Usage: venv [virtual environment directory name (defaults to ./venv)]"
    fi
}

function mkvenv {
    if [ $# -gt 0 ]; then
        if [ -d $1 ]; then
            echo "Directory $1 already exists"
            return
        fi
        echo "Creating virtual environment in $1"
        python -m venv $1
    else
        echo "Creating virtual environment in ./venv"
        if [ -d venv ]; then
            echo "Directory venv already exists"
            return
        fi
        python -m venv venv
    fi
}
