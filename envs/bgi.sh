
export LIBLOCALBASE=$HOME # only safe to change before any libs are installed?

export QTDIR=${LIBLOCALBASE}/opt-qt4
export GIUSRDIR=${LIBLOCALBASE}/opt-graspit

export GRASPIT_BASE=${HOME}/installations/graspit-build/SOURCE/jb-graspit
export GRASPIT_TARGET=${LIBLOCALBASE}/opt-jb-graspit-target
export GRASPIT=$GRASPIT_BASE

export GRASPPL_BASE=${HOME}/installations/graspit-build/SOURCE/graspit-pkgs/grasp_planning_graspit
export GRASPPL_TARGET=${LIBLOCALBASE}/opt-jb-grasppl-target
export GRASPPL=$GRASPPL_BASE

export COINDIR=$GIUSRDIR
export GRASPIT_PLUGIN_DIR=$GRASPIT/plugins/output

export QT4PREFIX=$QTDIR
export PKG_CONFIG_PATH=$QTDIR/lib/pkgconfig

_SUFFIX="lib"
ADDITIONAL_LIBRARY_PATH="$GRASPIT_TARGET/$_SUFFIX:$GIUSRDIR/$_SUFFIX:$QTDIR/$_SUFFIX"
_SUFFIX="include"
ADDITIONAL_INCLUDE_PATH="$GRASPIT_TARGET/$_SUFFIX:$GIUSRDIR/$_SUFFIX:$QTDIR/$_SUFFIX"
_SUFFIX="bin"
ADDITIONAL_BIN_PATH="$GRASPIT_TARGET/$_SUFFIX:$GIUSRDIR/$_SUFFIX:$QTDIR/$_SUFFIX"

export LD_LIBRARY_PATH="$ADDITIONAL_LIBRARY_PATH:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$ADDITIONAL_LIBRARY_PATH:$LIBRARY_PATH"
export C_INCLUDE_PATH="$ADDITIONAL_INCLUDE_PATH:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="$ADDITIONAL_INCLUDE_PATH:$CPLUS_INCLUDE_PATH"
export CPATH="$ADDITIONAL_INCLUDE_PATH:$CPATH"

export CMAKE_LIBRARY_PATH="$ADDITIONAL_LIBRARY_PATH:$CMAKE_LIBRARY_PATH"
export CMAKE_INCLUDE_PATH="$ADDITIONAL_INCLUDE_PATH:$CMAKE_INCLUDE_PATH"
export PATH="$ADDITIONAL_BIN_PATH:$PATH"

## ============= 

#(a) compile the graspit fork separately and (2) compile grasp_planning_graspit as above, but with cmake argument -DBUILD_GRASPIT:BOOL=false, and additionally passing the install location of the graspit fork with the cmake agrument -DCMAKE_PREFIX_PATH=<graspit-install-location>. Note that <graspit-install-location> is not the location where you cloned the graspit fork, but the location where you installed the code with make install.
#--> cmake -DCMAKE_INSTALL_PREFIX=$GRASPPL_TARGET -DCMAKE_PREFIX_PATH=$GRASPIT_TARGET -DBUILD_GRASPIT:BOOL=false ..

# Coin: ./configure --disable-debug --prefix="$GIUSRDIR"
#https://github.com/JenniferBuehler/graspit-pkgs/wiki/Installation-without-ROS

#./configure -prefix $QT4PREFIX -confirm-license -opensource -release -dbus-linked -openssl-linked -system-sqlite -no-phonon -no-phonon-backend -no-webkit -no-openvg -nomake demos -nomake examples -optimized-qmake

#The problem is that the header file <cstdlib> gets included inside an extern "C" {} section. Hence the compiler does not understand function overloading.
#The solution is to take the header inclusion outside of the extern "C" {} section. In order to do that, I added an
#include <cstdlib>
#in file src/fonts/freetype.cpp at line 49 (right before the extern "C" command). There is no need to edit the offending include, because the preprocessor directives take care that its content gets read only once.
#These comments refer to Coin version 3.1.3, compiling with g++ version 4.8.4 (or later), on Ubuntu 14.04.

#https://github.com/cartr/homebrew-qt4/blob/master/coin%403.1.3.rb

# cmake -DCMAKE_INSTALL_PREFIX=/usr

# remove from rpath in linker script any libraries that may hurt


# /sbin/ldconfig -N -v | grep ^/
# https://stackoverflow.com/questions/9922949/how-to-print-the-ldlinker-search-path
# gcc -m64 -Xlinker --verbose  2>/dev/null | grep SEARCH | sed 's/SEARCH_DIR("=\?\([^"]\+\)"); */\1\n/g'  | grep -vE '^$'
# ldconfig -p | grep libjpeg


#2. Download and build Coin-3D
#I got a 3.1.3 tarball from https://bitbucket.org/Coin3D/coin/downloads.
#Unpack the tarball but before attempting to build it, do the following:
#edit Coin-3.1.3/include/Inventor/SbBasic.h and add the line
##include <Inventor/C/errors/debugerror.h>
#after line 27 (#include <Inventor/C/basic.h>)
#This fixes a coding error in Coin that used to be ignored by the compiler but now causes an error.
#You can also get around this by adding -f permissive to your CXXFLAGS but this will not work for #ever.
#I also needed to do the following to set my CXXFLAGS to avoid other compilation errors:
#export CXXFLAGS="-D__CORRECT_ISO_CPP_STDLIB_H_PROTO -D__STRICT_ANSI__
