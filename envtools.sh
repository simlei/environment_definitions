function splitpath()
{
  sed 's/:/\n/g'
}

function showenvplus()
{
  echo "--- PATH"
  echo $PATH | splitpath
  echo "--- PYTHONPATH"
  echo $PYTHONPATH | splitpath
  echo "--- LD_LIBRARY_PATH"
  echo $LD_LIBRARY_PATH | splitpath

  echo "--- LIBRARY_PATH"
  echo $LIBRARY_PATH | splitpath
  echo "--- CPATH"
  echo $CPATH | splitpath
  
  echo "--- C_INCLUDE_PATH"
  echo $C_INCLUDE_PATH | splitpath
  echo "--- CPLUS_INCLUDE_PATH"
  echo $CPLUS_INCLUDE_PATH | splitpath

  echo "--- CMAKE_PREFIX_PATH"
  echo $CMAKE_PREFIX_PATH | splitpath
  echo "--- CMAKE_LIBRARY_PATH"
  echo $CMAKE_LIBRARY_PATH | splitpath
  echo "--- CMAKE_INCLUDE_PATH"
  echo $CMAKE_INCLUDE_PATH | splitpath
}

function showenv()
{
  echo "--- PATH"
  echo $PATH | splitpath
  echo "--- PYTHONPATH"
  echo $PYTHONPATH | splitpath
  echo "--- LD_LIBRARY_PATH"
  echo $LD_LIBRARY_PATH | splitpath
}


function showpath()
{
  echo "--- PATH"
  echo $PATH | splitpath
}

function direnv_cd() {
  cd "$1"
  eval "$(direnv export bash)"
}

function pyvenv-here() {
  cp "$LOCALBASH_DIR/templates/pyvenv.envrc" "$PWD/.envrc"
}

function venv-here() {
  cp "$LOCALBASH_DIR/templates/venv.envrc" "$PWD/.envrc"
}

function env-up() {
  echo "source_up" >> "$PWD/.envrc"
  direnv allow .
}

function indirenv() {
  $BASH --rcfile <( cat "$HOME/.bashrc"; direnv stdlib; echo 'export PS1="$PS1 direnv > "'; )
}


### - Tracing BASH environment genesis

# you enter a subshell with this function; after comnpletion, type CTRL-D to exit.
# Result is in the $outfile listed below after you exit.
# parameters passed here go into the bash invocation before the short parameters
function trace_bash() {
  local outfile="$HOME/.bashtrace.log"
  PS4='+$BASH_SOURCE> ' BASH_XTRACEFD=7 bash $@ -xl 7> "$outfile"
  echo "bash log stored in $outfile!"
}

# assumes already read $HOME/.bashtrace.log, saves it in $HOME/.bashtrace.sources
function trace_bash_files {
  cat $HOME/.bashtrace.log | grep -E '^\+' | grep -v "completion" | sed 's/\+*\([^>]*\).*/\1/' | sed '/^\s*$/d' | sort | uniq > "$HOME/.bashtrace.sources"
}

function grep_bash_trace() {
  cat $HOME/.bashtrace.sources | xargs -L1 egrep -Hn --color=always $@
}
