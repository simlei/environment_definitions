function extension() { fn=$(basename "$1"); echo "${fn##*.}"; }
function filename() { fn=$(basename "$1"); echo "${fn%.*}"; }
