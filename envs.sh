
ENVIRONMENTS_PATH="$LOCALBASH_DIR/envs"

function splitpath()
{
  sed 's/:/\n/g'
}

function showenv()
{
  echo "--- PATH"
  echo $PATH | splitpath
  echo "--- LIBRARY_PATH"
  echo $LIBRARY_PATH | splitpath
  echo "--- LD_LIBRARY_PATH"
  echo $LD_LIBRARY_PATH | splitpath
  echo "--- C_INCLUDE_PATH"
  echo $C_INCLUDE_PATH | splitpath
  echo "--- CMAKE_PREFIX_PATH"
  echo $CMAKE_PREFIX_PATH | splitpath
  echo "--- CMAKE_LIBRARY_PATH"
  echo $CMAKE_LIBRARY_PATH | splitpath
  echo "--- CMAKE_INCLUDE_PATH"
  echo $CMAKE_INCLUDE_PATH | splitpath
}

function showpath()
{
  echo "--- PATH"
  echo $PATH | splitpath
}

function envfile 
{
  echo "$ENVIRONMENTS_PATH/$1.sh"
}

function pushenv
{
  NEWPROMPTLINE="PS1=\"\$PS1 $1 > \"" 
  echo "loading environment $1 $NEWPROMPTLINE"
  $BASH --rcfile <(cat ~/.bashrc; cat $(envfile $1); echo $NEWPROMPTLINE)
}

function popenv
{
  exit
}

function withenv
{
  source $(envfile $1)
  ${@:2:$#}
}

