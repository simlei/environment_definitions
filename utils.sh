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

function extension() { fn=$(basename "$1"); echo "${fn##*.}"; }
function filename() { fn=$(basename "$1"); echo "${fn%.*}"; }
