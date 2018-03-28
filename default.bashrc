shopt -s checkwinsize
shopt -s globstar

# utilities

source "$LOCALBASH_DIR/aliases.sh"
source "$LOCALBASH_DIR/envtools.sh"
source "$LOCALBASH_DIR/utils.sh"

export EDITOR=$(which vim)
export PYENV_ROOT="$HOME/.pyenv"

eval "$(direnv hook bash)"
