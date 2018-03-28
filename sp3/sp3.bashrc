export SP3BASH_DIR="$LOCALBASH_DIR/sp3"

source "$SP3BASH_DIR/bashrcartifacts.sp3.bashrc" ## OS-specific?
source "$LOCALBASH_DIR/default.bashrc" ## PARENT
source "$SP3BASH_DIR/aliases.bashrc" ## aliases, probably overwriting

# important software
export AMMONITE_SCRIPTS="$HOME/ammSc"
export CONSCRIPT_HOME="$HOME/.conscript"
export PG_OF_PATH="$HOME/openframeworks"

export EDITOR=$(which gedit) ## editor
