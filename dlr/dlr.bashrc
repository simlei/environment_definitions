source "$LOCALBASH_DIR/profile/stdlib.sh"

PATH_add "/volume/software/common/bin/osl42-x86_64"
PATH_add "/usr/local/bin"

source $LOCALBASH_DIR/default.bashrc
source $DLRBASH_DIR/aliases.sh

export EDITOR=$(which kate)

# -- L.a.N.

export LaN_VERSION="0.10"
export LaN_MAN="/volume/software/common/packages/links_and_nodes/$LaN_VERSION/scripts/ln_manager"
export LaN_BASE="/volume/software/common/packages/links_and_nodes/$LaN_VERSION"

# -- CLASH project

export CLASHCONTROL=/home/leis_si/soma-test/clashcontrol
export CLASHDEVROOT=/home/leis_si/soma-test
export CLASHREPO=/home/leis_si/soma-test/soma
# there is also the ~/cheaphand directory which contains software installations
