AC_INIT([helloMaya], [0.3.0], [bug-report@email])
AC_DEFINE([PLUGIN_VENDOR], ["Your Name"], [Plugin vendor name])

AC_PREREQ([2.63])
AC_CONFIG_SRCDIR([src/helloMaya.cpp])
AM_INIT_AUTOMAKE([-Wall -Werror])

AC_ARG_VAR([MAYA_LOCATION], [Full path to Maya install folder.])
AC_SUBST(MAYA_LOCATION)

if test ["${MAYA_LOCATION+set}" = set]; then
	if ! test -d [$MAYA_LOCATION]; then
		AC_MSG_ERROR(MAYA_LOCATION $MAYA_LOCATION is not a valid directory.)
	else
		if ! test -f ["$MAYA_LOCATION/include/maya/MGlobal.h"]; then
			AC_MSG_ERROR(Could not find file MGlobal.h in $MAYA_LOCATION/include/maya)
		fi
		echo "MAYA_LOCATION = $MAYA_LOCATION"
	fi
else
	AC_MSG_ERROR(MAYA_LOCATION is not set.)
fi

if test ["${PLUGIN_DIR+set}" = set]; then
	if ! test -d [$PLUGIN_DIR]; then
		AC_MSG_ERROR(PLUGIN_DIR $PLUGIN_DIR is not a valid directory.)
	else
		echo "PLUGIN_DIR = $PLUGIN_DIR"
	fi
else
	AC_MSG_ERROR(PLUGIN_DIR is not set.)
fi
AC_SUBST(PLUGIN_DIR)

if test ["${MEL_DIR+set}" = set]; then
	if ! test -d [$MEL_DIR]; then
		AC_MSG_ERROR(MEL_DIR $MEL_DIR is not a valid directory.)
	else
		echo "MEL_DIR = $MEL_DIR"
		AC_SUBST(MEL_DIR)
	fi
else
	AC_MSG_WARN(MEL_DIR is not set.)
fi

if test ["${PYTHON_DIR+set}" = set]; then
	if ! test -d [$PYTHON_DIR]; then
		AC_MSG_ERROR(PYTHON_DIR $PYTHON_DIR is not a valid directory.)
	else
		echo "PYTHON_DIR = $PYTHON_DIR"
		AC_SUBST(PYTHON_DIR)
	fi
else
	AC_MSG_WARN(PYTHON_DIR is not set.)
fi

if test ["${ICON_DIR+set}" = set]; then
	if ! test -d [$ICON_DIR]; then
		AC_MSG_ERROR(ICON_DIR $ICON_DIR is not a valid directory.)
	else
		echo "ICON_DIR = $ICON_DIR"
		AC_SUBST(ICON_DIR)
	fi
else
	AC_MSG_WARN(ICON_DIR is not set.)
fi

if test ["${SHELF_DIR+set}" = set]; then
	if ! test -d [$SHELF_DIR]; then
		AC_MSG_ERROR(SHELF_DIR $SHELF_DIR is not a valid directory.)
	else
		echo "SHELF_DIR = $SHELF_DIR"
		AC_SUBST(SHELF_DIR)
	fi
else
	AC_MSG_WARN(SHELF_DIR is not set.)
fi

AC_ARG_ENABLE([ccheck], AS_HELP_STRING([--disable-ccheck], [Skip compiler version check. Only do basic testing]))

AS_IF([test "x$enable_ccheck" != "xno"], [
	if test ["$CXX" = ""] || test ["$CXX" = "g++"]; then
		AC_CHECK_PROGS(GXX, "g++", "")
		if test ["$GXX" = "g++"]; then
			CXX="g++"
			GXX_VERSION=`$GXX -dumpversion`
			echo "g++ is version $GXX_VERSION"
		fi
	else
		AC_CHECK_PROGS(GXX2, $CXX, "")
		if ! test ["$GXX2" = ""]; then
			CXX=$GXX2
			GXX_VERSION=`$GXX2 -dumpversion`
			echo "$GXX2 is version $GXX_VERSION"
		fi
	fi

	if ! test "$GXX_VERSION" = "4.1.2"; then
		echo "A compatible g++ was not found. Checking for g++412 instead."
		AC_CHECK_PROGS(GXX412, "g++412", "")
		if test ["$GXX412" = "g++412"]; then
			CXX=$GXX412
			GXX_VERSION=`$GXX412 -dumpversion`
			echo "g++412 is version $GXX_VERSION"
			if ! test "$GXX_VERSION" = "4.1.2"; then
				AC_MSG_ERROR(Could not find compatible g++ compiler)
			fi
		else
			AC_MSG_ERROR(Could not find compatible g++ compiler)
		fi
	fi


	if test ["$CC" = ""] || test ["$CC" = "gcc"]; then
		AC_CHECK_PROGS(GCC, "gcc", "")
		if test ["$GCC" = "gcc"]; then
			CC="gcc"
			GCC_VERSION=`$GCC -dumpversion`
			echo "gcc is version $GCC_VERSION"
		fi
	else
		AC_CHECK_PROGS(GCC2, $CC, "")
		if ! test ["$GCC2" = ""]; then
			CC=$GCC2
			GCC_VERSION=`$GCC2 -dumpversion`
			echo "$GCC2 is version $GCC_VERSION"
		fi
	fi

	if ! test "$GCC_VERSION" = "4.1.2"; then
		echo "A compatible gcc was not found. Checking for gcc412 instead."
		AC_CHECK_PROGS(GCC412, "gcc412", "")
		if test ["$GCC412" = "gcc412"]; then
			CC=$GCC412
			GCC_VERSION=`$GCC412 -dumpversion`
			echo "gcc412 is version $GCC_VERSION"
			if ! test "$GCC_VERSION" = "4.1.2"; then
				AC_MSG_ERROR(Could not find compatible gcc compiler)
			fi
		else
			AC_MSG_ERROR(Could not find compatible gcc compiler)
		fi
	fi

	echo "$CC and $CXX versions seem to be compatible"
], [
	echo "Doing basic compiler checks"
	if test ["$CC" = ""]; then
		CC="gcc"
	fi
	if test ["$CXX" = ""]; then
		CXX="g++"
	fi
])

AC_PROG_CXX($CXX)
AC_PROG_CC($CC)

AC_SUBST(AM_CXXFLAGS)
AC_SUBST(AM_LDFLAGS)

AC_OPENMP
AC_SUBST(OPENMP_CFLAGS)

AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile src/Makefile])
AC_OUTPUT
