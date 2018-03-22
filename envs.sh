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
