# $LOCALBASH_DIR marks the directory this file is in and has to be set in .bashrc
# in this file, one can source modularly aliases, environments, etc

# usually, environments are ad-hoc, i.e. sourced from a local shell.
# this can be done by the commands defined in envs.sh

# provides management and utilities related to environments
ENVIRONMENTS_INITFILE="$LOCALBASH/envs.sh"

# provides goodies that should work on any machine or harmless aliases
GOODIES_GLOBAL_INITFILE="$LOCALBASH/goodies.sh"

source $GOODIES_GLOBAL_INITFILE
source $ENVIRONMENTS_INITFILE
