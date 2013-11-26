AC_INIT([helloMaya], [0.1.1], [bug-report@email])
AC_DEFINE([PLUGIN_VENDOR], ["Your Name"], [Plugin vendor name])

AC_PREREQ([2.63])
AC_CONFIG_SRCDIR([src/helloMaya.cpp])
AM_INIT_AUTOMAKE([-Wall -Werror])

if test ["$CXX" = ""] || test ["$CXX" = "g++"]; then
	echo "Checking for g++ version"
	AC_CHECK_PROGS(GXX, "g++", "")
	if test ["$GXX" = "g++"]; then
		GCC_VERSION=`$GXX -dumpversion`
		echo "g++ is version $GCC_VERSION"
	fi
else
	echo "Checking $CXX"
	AC_CHECK_PROGS(GXX2, $CXX, "")
	if ! test ["$GXX2" = ""]; then
		GCC_VERSION=`$GXX2 -dumpversion`
		echo "$GXX2 is version $GCC_VERSION"
	else
		AC_MSG_ERROR(Could not find $CXX)
	fi
fi

if ! test "$GCC_VERSION" = "4.1.2"; then
	echo "A compatible g++ was not found. Checking for g++412 instead."
	AC_CHECK_PROGS(GXX412, "g++412", "")
	if test ["$GXX412" = "g++412"]; then
		GCC_VERSION=`$GXX412 -dumpversion`
		echo "g++412 is version $GCC_VERSION"
	else
		AC_MSG_ERROR(Could not find compatible g++ compiler)
	fi
fi

echo "g++ version is compatible"

AC_PROG_CXX
AC_PROG_CC

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
