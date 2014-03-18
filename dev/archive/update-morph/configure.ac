#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.


AC_PREREQ(2.52)

m4_define([required_lttoolbox_version], [3.2.0])

AC_INIT([apertium-update-morph], [0.1.0], [unhammer@fsfe.org])
# Don't put/look for auxiliary files in the parent directory:
AC_CONFIG_AUX_DIR([.])
AM_INIT_AUTOMAKE([apertium-update-morph], [0.1.0], no-define)
AC_PROG_LN_S

PKG_CHECK_MODULES(LTTOOLBOX,   lttoolbox >= required_lttoolbox_version, [], [PKG_CHECK_MODULES(LTTOOLBOX,   lttoolbox-3.2 >= required_lttoolbox_version)])

# for using Lttoolbox library:
AC_PROG_CXX
ifdef([LT_INIT], [LT_INIT], [AC_PROG_LIBTOOL])
CXXFLAGS="$CXXFLAGS -Wall -Werror"
CXXFLAGS="$CXXFLAGS $LTTOOLBOX_CFLAGS"

AC_ENABLE_SHARED(yes)
AC_ENABLE_STATIC(no)

AC_OUTPUT([Makefile])
