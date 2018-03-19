# general goodies

manopt() {
  local cmd=$1 opt=$2
  [[ $opt == -* ]] || { (( ${#opt} == 1 )) && opt="-$opt" || opt="--$opt"; }
  man "$cmd" | col -b | awk -v opt="$opt" -v RS= '$0 ~ "(^|,)[[:blank:]]+" opt "([[:punct:][:space:]]|$)"'
}

helpgrep() {
  local cmd=$1 opt=$2
  ${cmd} --help | grep -e "$opt"
}

alias prt=~/bin/print2x2x1.sh

usbdev() {
  ls /dev/serial/by-path
}
