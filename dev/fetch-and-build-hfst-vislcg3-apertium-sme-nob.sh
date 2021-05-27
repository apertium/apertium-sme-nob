#!/bin/bash

### This script will download and compile HFST (including OpenFST and
### foma), vislcg3 and apertium/lttoolbox/apertium-sme-nob.
###
### Before you run the script, you should:
###
### 1. change the PREFIX and SRC variables to where you want tools
### installed and where you want the sources fetched, respectively (or
### simply leave them as they are),
###
### 2. make sure you have installed the other prerequisites. On
### Debian/Ubuntu, you might do something like:
###
### sudo apt-get install subversion build-essential g++ pkg-config gawk libxml2 libxml2-dev libxml2-utils xsltproc flex automake autoconf libtool libpcre3-dev  libicu-dev libreadline-dev zlib1g-dev bison
###
### More in-depth on prerequisites:
### * https://wiki.apertium.org/wiki/Installation (lttoolbox and apertium)
### * https://wiki.apertium.org/wiki/HFST (foma, OpenFST, HFST)
### * https://wiki.apertium.org/wiki/Apertium_and_Constraint_Grammar (vislcg3)

### Where you want apertium/hfst/vislcg3 etc. installed:
PREFIX="$HOME/apertium-local"
### Where you want to put the source code for apertium/hfst/vislcg3 etc.:
SRC="$HOME/apertium-src"


### Change this to something like J="-j2" if you want to try to speed up compilation:
J=""



### The rest of this file should not need editing.




PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

LD_LIBRARY_PATH="$PREFIX/lib"
export LD_LIBRARY_PATH
DYLD_LIBRARY_PATH="$PREFIX/lib"
export DYLD_LIBRARY_PATH

# Prefer our installation, then macports, then whatever is in default $PATH:"
PATH="$PREFIX/bin:/opt/local/bin:/usr/local/bin:$PATH"
export PATH

test -d "$PREFIX" || mkdir "$PREFIX"
test -d "$SRC" || mkdir "$SRC"

set -o pipefail

# OpenFST is now included with HFST by default
# { cd "$SRC" &&
#   curl http://openfst.cs.nyu.edu/twiki/pub/FST/FstDownload/openfst-1.2.9.tar.gz >openfst-1.2.9.tar.gz  &&
#   tar -xzvf openfst-1.2.9.tar.gz &&
#   cd openfst-1.2.9/  &&
#   ./configure --prefix=$PREFIX &&
#   make $J &&
#   make install &&
#   echo 'OpenFST successfully installed'
# } | sed 's/^/OpenFST: /' &&

{ cd "$SRC" &&
  svn co svn://svn.code.sf.net/p/foma/code/trunk/foma &&
  cd foma &&
  sed -i.tmp "s%prefix = /usr/local%prefix = $PREFIX%" Makefile &&
  ( make $J || ( sed -i.tmp2 "s%-ltermcap%-lncurses%" Makefile && make $J ) ) &&
  make install && 
  echo 'foma successfully installed'
} | sed 's/^/foma: /' &&
  
# SFST is 1. not needed and 2. just frustrating
# { cd "$SRC" &&
#   curl ftp://ftp.ims.uni-stuttgart.de/pub/corpora/SFST/SFST-1.4.6c.tar.gz > SFST-1.4.6c.tar.gz &&
#   tar -xzvf SFST-1.4.6c.tar.gz &&
#   cd SFST/src &&
#   sed -i.tmp "s%PREFIX = /usr/local%PREFIX = $PREFIX%" Makefile &&
#   make $J CFLAGS=-fPIC &&
#   make install &&
#   make libinstall &&
#   echo 'SFST successfully installed'
# } | sed 's/^/SFST: /' &&
   
{ cd "$SRC" &&
  svn co svn://svn.code.sf.net/p/hfst/code/trunk/hfst3 &&
  cd hfst3 &&
  ./autogen.sh &&
  ./configure LDFLAGS=-L$PREFIX/lib --prefix=$PREFIX --enable-lexc --enable-proc --with-foma --without-sfst --with-unicode-handler=ICU &&
  make $J CXXFLAGS="-fpermissive -I$PREFIX/include" &&
  make install &&
  (ldconfig || true) &&
  echo 'HFST successfully installed'
} | sed 's/^/HFST: /' &&


{ cd "$SRC" &&
  svn co http://beta.visl.sdu.dk/svn/visl/tools/vislcg3/trunk vislcg3 &&
  cd vislcg3 &&
  if test -f /opt/local/lib/libicuuc.dylib ; then
      ./cmake.sh -DCMAKE_LIBRARY_PATH=/opt/local/lib -DCMAKE_INCLUDE_PATH=/opt/local/include -DCMAKE_INSTALL_PREFIX=$PREFIX
  else
      ./cmake.sh -DCMAKE_LIBRARY_PATH=/usr/local/lib -DCMAKE_INCLUDE_PATH=/usr/local/include -DCMAKE_INSTALL_PREFIX=$PREFIX
  fi &&
  make $J &&
  make install &&
  (ldconfig || true) &&
  echo 'vislcg3 successfully installed'
} | sed 's/^/vislcg3: /' &&


{ cd "$SRC" &&
  svn co svn://svn.code.sf.net/p/apertium/svn/trunk/lttoolbox &&
  cd lttoolbox &&
  ./autogen.sh --prefix=$PREFIX &&
  make $J &&
  make install &&
  (ldconfig || true) &&
  echo 'lttoolbox successfully installed'
} | sed 's/^/lttoolbox: /' &&

{ cd "$SRC" &&
  svn co svn://svn.code.sf.net/p/apertium/svn/trunk/apertium &&
  cd apertium &&
  ./autogen.sh --prefix=$PREFIX &&
  make $J &&
  make install &&
  (ldconfig || true) &&
  echo 'apertium successfully installed'
} | sed 's/^/apertium: /' &&

{ cd "$SRC" &&
  svn co svn://svn.code.sf.net/p/apertium/svn/trunk/apertium-sme-nob &&
  cd apertium-sme-nob &&
  ./autogen.sh --prefix=$PREFIX &&
  make $J &&
  make install &&
  (ldconfig || true) &&
  echo 'apertium-sme-nob successfully installed'
} | sed 's/^/apertium-sme-nob: /' &&

{
  echo ""
  echo "All done."
  echo ""
  echo "To be able to compile and run the translator, ensure these lines"
  echo "are in your ~/.bashrc:"
  echo ""
  echo "PATH=\"$PREFIX/bin:\$PATH\"" >>~/.bash_profile_local
  echo "" >>~/.bash_profile_local
  echo "PKG_CONFIG_PATH=\"$PREFIX/lib/pkgconfig\"" >>~/.bash_profile_local
  echo "export PKG_CONFIG_PATH" >>~/.bash_profile_local
  echo "LD_LIBRARY_PATH=\"$PREFIX/lib\"" >>~/.bash_profile_local
  echo "export LD_LIBRARY_PATH" >>~/.bash_profile_local
  echo "DYLD_LIBRARY_PATH=\"$PREFIX/lib\"" >>~/.bash_profile_local
  echo "export DYLD_LIBRARY_PATH" >>~/.bash_profile_local
}
