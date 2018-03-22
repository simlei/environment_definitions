# my local software

export PATH="$HOME/.local/bin:$PATH"

# common software

## L.a.N
export LN_VERSION="0.10.1"
export LN_MAN="/volume/software/common/packages/links_and_nodes/$LN_VERSION/scripts/ln_manager"
export LN_BASE="/volume/software/common/packages/links_and_nodes/$LN_VERSION"

# CLASH related

export CLASHCONTROL=/home/leis_si/soma-test/clashcontrol
export CLASHDEVROOT=/home/leis_si/soma-test
export CLASHREPO=/home/leis_si/soma-test/soma

function goclash() { cd "$CLASHCONTROL"; }
function sourceclash() { ( cd "$CLASHCONTROL"; source "./.envrc"; ); }
