AC_INIT([helloMaya], [0.1.1], [kari.brown@spellboundfx.com])
AC_DEFINE([PLUGIN_VENDOR], ["Kari Brown"], [Plugin vendor name])

AC_PREREQ([2.69])
AC_CONFIG_SRCDIR([src/helloMaya.cpp])
AM_INIT_AUTOMAKE([-Wall -Werror])

AC_PROG_CXX([g++412])
AC_PROG_CC([gcc412])
AC_SUBST(AM_CXXFLAGS)
AC_SUBST(AM_LDFLAGS)

AC_OPENMP
AC_SUBST(OPENMP_CFLAGS)

AC_ARG_VAR([MAYA_LOCATION], [Full path to Maya install folder.])
AC_ARG_VAR([MAYA_PLUG_IN_PATH], [Full path to Maya plugin folder.])
AC_SUBST(MAYA_LOCATION)
AC_SUBST(MAYA_PLUG_IN_PATH)


AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile src/Makefile])
AC_OUTPUT
