#!/usr/bin/env bash
#       _                 _
#   ___(_)_ __ ___  _ __ | | ___
#  / __| | '_ ` _ \| '_ \| |/ _ \
#  \__ \ | | | | | | |_) | |  __/
#  |___/_|_| |_| |_| .__/|_|\___|
#                  |_|
#
# Boilerplate for creating a simple bash script with some basic strictness
# checks and help features.
#
# Usage:
#   bash-simple argument
#
# Depends on:
#  list
#  of
#  programs
#  expected
#  in
#  environment
#
# Bash Boilerplate: https://github.com/alphabetum/bash-boilerplate
#
# Copyright (c) 2015 William Melody • hi@williammelody.com

# Notes #######################################################################

# Extensive descriptions are included for easy reference.
#
# Explicitness and clarity are generally preferable, especially since bash can
# be difficult to read. This leads to noisier, longer code, but should be
# easier to maintain. As a result, some general design preferences:
#
# - Use leading underscores on internal variable and function names in order
#   to avoid name collisions. For unintentionally global variables defined
#   without `local`, such as those defined outside of a function or
#   automatically through a `for` loop, prefix with double underscores.
# - Always use braces when referencing variables, preferring `${NAME}` instead
#   of `$NAME`. Braces are only required for variable references in some cases,
#   but the cognitive overhead involved in keeping track of which cases require
#   braces can be reduced by simply always using them.
# - Prefer `printf` over `echo`. For more information, see:
#   http://unix.stackexchange.com/a/65819
# - Prefer `$_explicit_variable_name` over names like `$var`.
# - Use the `#!/usr/bin/env bash` shebang in order to run the preferred
#   Bash version rather than hard-coding a `bash` executable path.
# - Prefer splitting statements across multiple lines rather than writing
#   one-liners.
# - Group related code into sections with large, easily scannable headers.
# - Describe behavior in comments as much as possible, assuming the reader is
#   a programmer familiar with the shell, but not necessarily experienced
#   writing shell scripts.

###############################################################################
# Strict Mode
###############################################################################

# Treat unset variables and parameters other than the special parameters ‘@’ or
# ‘*’ as an error when performing parameter expansion. An 'unbound variable'
# error message will be written to the standard error, and a non-interactive
# shell will exit.
#
# This requires using parameter expansion to test for unset variables.
#
# http://www.gnu.org/software/bash/manual/bashref.html#Shell-Parameter-Expansion
#
# The two approaches that are probably the most appropriate are:
#
# ${parameter:-word}
#   If parameter is unset or null, the expansion of word is substituted.
#   Otherwise, the value of parameter is substituted. In other words, "word"
#   acts as a default value when the value of "$parameter" is blank. If "word"
#   is not present, then the default is blank (essentially an empty string).
#
# ${parameter:?word}
#   If parameter is null or unset, the expansion of word (or a message to that
#   effect if word is not present) is written to the standard error and the
#   shell, if it is not interactive, exits. Otherwise, the value of parameter
#   is substituted.
#
# Examples
# ========
#
# Arrays:
#
#   ${some_array[@]:-}              # blank default value
#   ${some_array[*]:-}              # blank default value
#   ${some_array[0]:-}              # blank default value
#   ${some_array[0]:-default_value} # default value: the string 'default_value'
#
# Positional variables:
#
#   ${1:-alternative} # default value: the string 'alternative'
#   ${2:-}            # blank default value
#
# With an error message:
#
#   ${1:?'error message'}  # exit with 'error message' if variable is unbound
#
# Short form: set -u
set -o nounset

# Exit immediately if a pipeline returns non-zero.
#
# NOTE: this has issues. When using read -rd '' with a heredoc, the exit
# status is non-zero, even though there isn't an error, and this setting
# then causes the script to exit. read -rd '' is synonymous to read -d $'\0',
# which means read until it finds a NUL byte, but it reaches the EOF (end of
# heredoc) without finding one and exits with a 1 status. Therefore, when
# reading from heredocs with set -e, there are three potential solutions:
#
# Solution 1. set +e / set -e again:
#
# set +e
# read -rd '' variable <<EOF
# EOF
# set -e
#
# Solution 2. <<EOF || true:
#
# read -rd '' variable <<EOF || true
# EOF
#
# Solution 3. Don't use set -e or set -o errexit at all.
#
# More information:
#
# https://www.mail-archive.com/bug-bash@gnu.org/msg12170.html
#
# Short form: set -e
set -o errexit

# Print a helpful message if a pipeline with non-zero exit code causes the
# script to exit as described above.
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR

# Allow the above trap be inherited by all functions in the script.
# Short form: set -E
set -o errtrace

# Return value of a pipeline is the value of the last (rightmost) command to
# exit with a non-zero status, or zero if all commands in the pipeline exit
# successfully.
set -o pipefail

# Set IFS to just newline and tab at the start
#
# http://www.dwheeler.com/essays/filenames-in-shell.html
#
# $DEFAULT_IFS and $SAFER_IFS
#
# $DEFAULT_IFS contains the default $IFS value in case it's needed, such as
# when expanding an array and you want to separate elements by spaces.
# $SAFER_IFS contains the preferred settings for the program, and setting it
# separately makes it easier to switch between the two if needed.
#
# Supress ShellCheck unused variable warning:
# shellcheck disable=SC2034
DEFAULT_IFS="${IFS}"
SAFER_IFS=$'\n\t'
IFS="${SAFER_IFS}"

###############################################################################
# Environment
###############################################################################

# $_ME
#
# Set to the program's basename.
_ME=$(basename "${0}")

###############################################################################
# Help
###############################################################################

# _print_help()
#
# Usage:
#   _print_help
#
# Print the program help information.
_print_help() {
  cat <<HEREDOC
      _                 _
  ___(_)_ __ ___  _ __ | | ___
 / __| | '_ \` _ \| '_ \| |/ _ \\
 \__ \ | | | | | | |_) | |  __/
 |___/_|_| |_| |_| .__/|_|\___|
                 |_|
Boilerplate for creating a simple bash script with some basic strictness
checks and help features.
Usage:
  ${_ME} [<arguments>]
  ${_ME} -h | --help
Options:
  -h --help  Show this screen.
HEREDOC
}

###############################################################################
# Program Functions
###############################################################################

_simple() {
  if [ -z "$1" ] 
  then
    echo "No arguments supplied"
    exit 1
  fi

  FILEARG=$1
  if [[ $FILEARG == file://* ]] 
  then
    echo "renaming url to absolute path.."
    FILEARG=${FILEARG#file://}
  fi
  
  if [ ! -f "$FILEARG" ] 
  then
    echo "The file \"$FILEARG\" does not exist!"
    exit 1
  fi
  
  
  printf "Printing $FILEARG\n"
  lp -d sharp-color-03/ds_le_2x1 "$FILEARG"
  
  _new_name="$(dirname $FILEARG)/[printed]$(basename $FILEARG)"
  printf "renaming to $_new_name\n"
  mv $FILEARG $_new_name
}

###############################################################################
# Main
###############################################################################

# _main()
#
# Usage:
#   _main [<options>] [<arguments>]
#
# Description:
#   Entry point for the program, handling basic option parsing and dispatching.
_main() {
  # Avoid complex option parsing when only one program option is expected.
  if [[ "${1:-}" =~ ^-h|--help$  ]]
  then
    _print_help
  else
    _simple "$@"
  fi
}

# Call `_main` after everything has been defined.
_main "$@"
