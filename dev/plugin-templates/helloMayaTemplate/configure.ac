AC_INIT([helloMaya], [0.3.1], [bug-report@email])
AC_DEFINE([PLUGIN_VENDOR], ["Your Name"], [Plugin vendor name])

AC_PREREQ([2.63])
AC_CONFIG_SRCDIR([src/helloMaya.cpp])
AM_INIT_AUTOMAKE([subdir-objects -Wall -Werror])

AC_CANONICAL_HOST
echo "Host is $host_os"
AM_CONDITIONAL(HOST_SYS_LINUX, false)
AM_CONDITIONAL(HOST_SYS_WINDOWS, false)
AM_CONDITIONAL(HOST_SYS_DARWIN, false)
case $host_os in
    linux*)
        # Compiler commands and versions for linux
        AM_CONDITIONAL(HOST_SYS_LINUX, true)
        GCC="gcc"
        GXX="g++"
        GVER="4.1.2"
        GCCV="gcc412"
        GXXV="g++412"
        ;;
#    *win*)
#        # Do something specific for Windows
#        AM_CONDITIONAL(HOST_SYS_WINDOWS, true)
#        ;;
    darwin* )
        # Compiler commands and versions for mac
        AM_CONDITIONAL(HOST_SYS_DARWIN, true)
        GCC="gcc"
        GXX="g++"
        GVER="4.2.1"
        GCCV="gcc421"
        GXXV="g++421"
        ;;
    *)
        #Default Case
        HOST_SYS=-1
        AC_MSG_ERROR([Your platform is not currently supported])
        ;;
esac

AC_ARG_VAR([MAYA_LOCATION], [Full path to Maya install folder.])
AC_ARG_VAR([PLUGIN_DIR], [The folder where the plugin.so file will be installed.])
AC_ARG_VAR([MEL_DIR], [The folder where the mel scripts will be installed.])
AC_ARG_VAR([PYTHON_DIR], [The folder where the python scripts will be installed.])
AC_ARG_VAR([ICON_DIR], [The folder where the icon files will be installed.])
AC_ARG_VAR([SHELF_DIR], [The folder where the shelf files will be installed.])

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
    AC_MSG_ERROR(MAYA_LOCATION is not set. Please see README for more information.)
fi

if test ["${PLUGIN_DIR+set}" = set]; then
    if ! test -d [$PLUGIN_DIR]; then
        AC_MSG_ERROR(PLUGIN_DIR $PLUGIN_DIR is not a valid directory.)
    else
        echo "PLUGIN_DIR = $PLUGIN_DIR"
    fi
else
    AC_MSG_ERROR(PLUGIN_DIR is not set. Please see README for more information.)
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
    if test ["$CXX" = ""] || test ["$CXX" = "$GXX"]; then
        AC_CHECK_PROGS(GXX1, $GXX, "")
        if test ["$GXX1" = "$GXX"]; then
            CXX=$GXX
            GXX_VERSION=`$GXX -dumpversion`
            echo "$GXX is version $GXX_VERSION"
        fi
    else
        AC_CHECK_PROGS(GXX2, $CXX, "")
        if ! test ["$GXX2" = ""]; then
            CXX=$GXX2
            GXX_VERSION=`$GXX2 -dumpversion`
            echo "$GXX2 is version $GXX_VERSION"
        fi
    fi

    if ! test "$GXX_VERSION" = "$GVER"; then
        echo "A compatible C++ compiler was not found. Checking for $GXXV instead."
        AC_CHECK_PROGS(GXX3, "$GXXV", "")
        if test ["$GXX3" = "$GXXV"]; then
            CXX=$GXX3
            GXX_VERSION=`$GXX3 -dumpversion`
            echo "$GXXV is version $GXX_VERSION"
            if ! test "$GXX_VERSION" = "$GVER"; then
                AC_MSG_ERROR(Could not find compatible C++ compiler)
            fi
        else
            AC_MSG_ERROR(Could not find compatible C++ compiler)
        fi
    fi


    if test ["$CC" = ""] || test ["$CC" = "$GCC"]; then
        AC_CHECK_PROGS(GCC1, $GCC, "")
        if test ["$GCC1" = "$GCC"]; then
            CC=$GCC
            GCC_VERSION=`$GCC -dumpversion`
            echo "$GCC is version $GCC_VERSION"
        fi
    else
        AC_CHECK_PROGS(GCC2, $CC, "")
        if ! test ["$GCC2" = ""]; then
            CC=$GCC2
            GCC_VERSION=`$GCC2 -dumpversion`
            echo "$GCC2 is version $GCC_VERSION"
        fi
    fi

    if ! test "$GCC_VERSION" = "$GVER"; then
        echo "A compatible C compiler was not found. Checking for $GCCV instead."
        AC_CHECK_PROGS(GCC3, "$GCCV", "")
        if test ["$GCC3" = "$GCCV"]; then
            CC=$GCC3
            GCC_VERSION=`$GCC3 -dumpversion`
            echo "$GCCV is version $GCC_VERSION"
            if ! test "$GCC_VERSION" = "$GVER"; then
                AC_MSG_ERROR(Could not find compatible C compiler)
            fi
        else
            AC_MSG_ERROR(Could not find compatible C compiler)
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
