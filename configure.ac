AC_PREREQ(2.52)

AC_INIT([Apertium Northern Saami-Bokmål], [0.6.1], [apertium-stuff@lists.sourceforge.net], [apertium-sme-nob], [https://wiki.apertium.org/wiki/Apertium-sme-nob])
AM_INIT_AUTOMAKE
AC_PROG_AWK

PKG_CHECK_MODULES(APERTIUM, apertium >= 3.6.0)
PKG_CHECK_MODULES(LTTOOLBOX, lttoolbox >= 3.5.0)
PKG_CHECK_MODULES(CG3, cg3 >= 1.3.0)

AC_PATH_PROG([HFSTLEXC], [hfst-lexc], [false], [$PATH$PATH_SEPARATOR$with_hfst_lexc/bin])
AS_IF([test x$HFSTLEXC = xfalse], [AC_MSG_ERROR([You don't have hfst-lexc installed])])

AC_PATH_PROG([HFSTTWOLC], [hfst-twolc], [false], [$PATH$PATH_SEPARATOR$with_hfst_twolc/bin])
AS_IF([test x$HFSTTWOLC = xfalse], [AC_MSG_ERROR([You don't have hfst-twolc installed])])

AC_PATH_PROG([HFSTPROC], [hfst-proc], [false], [$PATH$PATH_SEPARATOR$with_hfst_proc/bin])
AS_IF([test x$HFSTPROC = xfalse], [AC_MSG_ERROR([You don't have hfst-proc installed])])

AC_PATH_PROG([HFSTSUBSTITUTE], [hfst-substitute], [false], [$PATH$PATH_SEPARATOR$with_hfst_substitute/bin])
AS_IF([test x$HFSTSUBSTITUTE = xfalse], [AC_MSG_ERROR([You don't have hfst-substitute installed])])

AC_PATH_PROGS(ZCAT, [gzcat zcat], [false])
AS_IF([test x$ZCAT = xfalse], [AC_MSG_ERROR([You don't have zcat nor gzcat installed])])


m4_ifdef([AP_CHECK_LING],[],[AC_MSG_ERROR([AP_CHECK_LING not defined, is apertium.m4 in ACLOCAL_PATH? See: https://wiki.apertium.org/wiki/Installation_troubleshooting])])

AP_CHECK_LING([1], [giella-sme], [0.1])
AP_CHECK_LING([2], [apertium-nob], [1.1.0])

PKG_CHECK_MODULES(REGTEST, apertium-regtest >= 0.0.1, [],
                  [AC_MSG_WARN([Running tests requires apertium-regtest])])

AP_MKINCLUDE

AC_OUTPUT([Makefile])
