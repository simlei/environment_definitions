shopt -s checkwinsize
shopt -s globstar
HISTSIZE=2000
HISTFILESIZE=8000
HISTCONTROL=ignoreboth

# utilities

source "$LOCALBASH_DIR/aliases.sh"
source "$LOCALBASH_DIR/envtools.sh"
source "$LOCALBASH_DIR/utils.sh"

# important application locations

export EDITOR=$(which vim)
export PYENV_ROOT="$HOME/.pyenv"

eval "$(direnv hook bash)"
