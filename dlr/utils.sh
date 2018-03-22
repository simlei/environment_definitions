# PRE-REQUISITES: dlrmain.sh
 
alias prt=~/bin/print2x2x1.sh

function usbdev() {
  ls /dev/serial/by-path
}

# Usage: envtool FORMAT Software1 Software2
# see available software shortcut flags below, e.g. -opencv
# e.g bash_setup_env.sh embed_sh -opencv -ln -rkcam > env_software.rc
# (MYFILE="bash_env_exec.sh"; bash_setup_env.sh sh -opencv -ln -rkcam > $MYFILE; chmod +x $MYFILE)
# formaats: see rmpm_do, e.g. "embed_sh" or "sh"

function envtool
{


    if [ -z "$1" ]
    then
    echo "Usage [embed_sh | sh | ... ] software_ids"
    echo "either pipe to file with sh or pipe to source with embed_sh"
    exit $E_NOARGS
    fi

    MY_RKCAM="software.common.rkcam"
    MY_VTK="software.common.vtk"
    MY_OPENCV="software.common.OpenCV $MY_VTK"
    MY_LN="software.links_and_nodes==$MY_LN_VERSION"

    SUBSTITUTION=""
    SUBSTITUTION+="s/-rkcam/$MY_RKCAM/;"
    SUBSTITUTION+="s/-opencv/$MY_OPENCV/;"
    SUBSTITUTION+="s/-ln/$MY_OPENCV/;"

    MY_ARGS=$(sed "$SUBSTITUTION" <<< "$*")

    rmpm_do env --env-format $MY_ARGS
}

alias prt=~/bin/print2x2x1.sh

function usbdev() {
  ls /dev/serial/by-path
}
