export LOCALBASH_DLR_DIR=$LOCALBASH_DIR/dlr
 
# my local software

export PATH="$HOME/.local/bin:$PATH"

# L.a.N.

export LN_VERSION="0.10.1"
export LN_MAN="/volume/software/common/packages/links_and_nodes/$LN_VERSION/scripts/ln_manager"
export LN_BASE="/volume/software/common/packages/links_and_nodes/$LN_VERSION"

# CLASH project

export CLASHCONTROL=/home/leis_si/soma-test/clashcontrol
export CLASHDEVROOT=/home/leis_si/soma-test
export CLASHREPO=/home/leis_si/soma-test/soma

function goclash() { cd "$CLASHCONTROL"; source "./.envrc"; } # direnv should take care of this later

# now source base environment

source "$LOCALBASH_DLR_DIR/base_env.sh"

# now source some utils

source "$LOCALBASH_DLR_DIR/utils.sh"
