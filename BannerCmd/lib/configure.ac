#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.59])
AC_INIT([banner], [1.3.3], [https://github.com/fumiyas/wcwidth-cjk])
AM_INIT_AUTOMAKE([foreign])
AC_CONFIG_MACRO_DIRS([m4])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_SRCDIR([banner.c])

# Checks for programs.
AC_PROG_CC

AC_DISABLE_SHARED
AC_PROG_LIBTOOL

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([stdlib.h string.h])

# Checks for typedefs, structures, and compiler characteristics.
AC_TYPE_SIZE_T

# Checks for library functions.
AC_FUNC_REALLOC

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
