shopt -s checkwinsize
shopt -s globstar
HISTSIZE=2000
HISTFILESIZE=8000
HISTCONTROL=ignoreboth

source "$LOCALBASH_DIR/profile/stdlib.sh"

# utilities

source "$LOCALBASH_DIR/aliases.sh"
source "$LOCALBASH_DIR/envtools.sh"
source "$LOCALBASH_DIR/utils.sh"

# important application locations

export EDITOR=$(which vim)
export PYENV_ROOT="$HOME/.pyenv"

# initialization

PATH_add $HOME/.local/bin
PATH_add $PYENV_ROOT/bin

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(direnv hook bash)"
