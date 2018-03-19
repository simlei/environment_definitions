# my local software

export PATH="$HOME/.local/bin:$PATH"

# common software

## L.a.N
export LN_VERSION="0.10.1"
export LN_MAN=/volume/software/common/packages/links_and_nodes/$LN_VERSION/scripts/ln_manager
export LN_BASE="/volume/software/common/packages/links_and_nodes/$LN_VERSION"
source $LN_BASE/scripts/bash.rc

## others

export MATLABPATH="/home/leis_si/matlab_lib:$MATLABPATH"
export PATH="/volume/software/common/bin/osl42-x86_64:$PATH"
export PATH="/usr/local/bin:$PATH"

# CLASH related

export CLASHCONTROL=/home/leis_si/soma-test/clashcontrol
export CLASHDEVROOT=/home/leis_si/soma-test
export CLASHREPO=/home/leis_si/soma-test/soma

source $CLASHCONTROL/env/tools.sh
