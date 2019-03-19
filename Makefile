# (c) Copyright 2019 Bartosz Mierzynski
# This makefile considers:
#  * GNU Coding Standards
#  * Filesystem Hierarchy Standard (FHS)
#  * Single UNIX Specification (SUS)

########################################
# Table of contents
#  0. Common variables
#  1. Setup targets
#  2. Build targets
#  3. Test targets
#  4. Documentation targets
#  5. Clean and install targets

########################################
# 0. Common variables

# make envirionment variables:
# COLUMNS
# HOME
# LANG
# LINES
# LOGNAME
# PATH
# PWD
# SHELL
# TERM

# Assignement below is used to avoid problems with systems where SHELL variable 
# is inherited from environment
SHELL=/bin/sh

# Clears suffixes list and sets new one describing ALL suffixes used in makefile.
# Those newly defined suffixes are target for makefiles implicit rules
# This procedure is done to remove misbehaviour between make programs which work differently
# and have different suffix lists and implicit rules
.SUFFIX:
.SUFFIX: .c .o

# If no default goal is specified then the default goal 
# is the first target from top of file that make encounters
.DEFAULT_GOAL := all

########################################
# Portable utilities that can be used without setting variable for them
# ---------------------------------------------------------------------
#  cat cmp cp diff echo egrep expr false grep install-info ln ls
#  mkdir mv printf pwd rm rmdir sed sleep sort tar test touch tr true
#  chgrp chmod chown mknod
#  --------------------------------------------------------------------
# Only POSIX defined options shall be used and scripts shall use /bin/sh
# For example:
#  mkdir -p 
# is not standard

########################################
# Utility programs (those which may need replacement)
#  INSTALL must be defined in every Makefile
AR       = ar
AS       = as
AWK      = awk
BISON    = bison
CC       = cc
CPP      = $(CC) -E
CXX      = c++
FLEX     = flex
INSTALL  = install
LD       = ld
LDCONFIG = ldconfig
LEX      = lex
MAKE     = make
MAKEINFO = makeinfo
RANLIB   = ranlib
TEXI2DVI = texi2dvi
YACC     = yacc

########################################
# FLAGS a.k.a command variables of utility programs
# - general scheme: VARFLAGS
# - there are exceptions to the scheme
#BISON
BISONFLAGS =
#CC 
# - should be invoked on every CC invocation both those which do compilation or linking
# - should be placed last in compilation command so user can override the other flags
CFLAGS     =-Wall -pedantic -ansi -O2 -g
#preprocessor
# - use in any compilation command that runs preprocessor
CPPFLAGS   =
#CXX - C++ equivalent to CFLAGS
CXXFLAGS   =
#LD
# - use in any compilation command that does linking or directly uses LD
LDFLAGS    =
#LEX
LFLAGS     =
#YACC
YFLAGS     =

########################################
# INSTALL_* variables those must be defined in every makefile
# 1. executables
INSTALL_PROGRAM=$(INSTALL)
# 2. non-executables (libraries, images, docs, etc.)
INSTALL_DATA=${INSTALL} -m 644
# DESTDIR must be prepended to each installed target file
# DESTDIR is defined by user and must be absolute path
# DESTDIR is only supported in install* and uninstall* targets
# DESTDIR is forbidden to be set in makefile
# DESTDIR is forbidden to change software operation in any way

#########################################
# Directory variables
prefix         = /usr/local
exec_prefix    = $(prefix)
bindir         = $(exec_prefix)/bin
sbindir        = $(exec_prefix)/sbin
libexecdir     = $(exec_prefix)/libexec
datarootdir    = $(prefix)/share
datadir        = $(datarootdir)
sysconfdir     = $(prefix)/etc
sharedstatedir = $(prefix)/com
localstatedir  = $(prefix)/var
runstatedir    = $(localstatedir)/run
includedir     = $(prefix)/include
oldincludedir  = /usr/include
docdir         = $(datarootdir)/doc/yourpkg
infodir        = $(datarootdir)/info
htmldir        = $(docdir)
dvidir         = $(docdir)
pdfdir         = $(docdir)
psdir          = $(docdir)
libdir         = $(exec_prefix)/lib
lispdir        = $(datarootdir)/emacs/site-lisp
localedir      = $(datarootdir)/locale
mandir         = $(datarootdir)/man
man0dir        = $(mandir)/man0
man1dir        = $(mandir)/man1
man2dir        = $(mandir)/man2
man3dir        = $(mandir)/man3
man4dir        = $(mandir)/man4
man5dir        = $(mandir)/man5
man6dir        = $(mandir)/man6
man7dir        = $(mandir)/man7
man8dir        = $(mandir)/man8
man9dir        = $(mandir)/man9
manext         = .1
man0ext        = .0
man1ext        = .1
man2ext        = .2
man3ext        = .3
man4ext        = .4
man5ext        = .5
man6ext        = .6
man7ext        = .7
man8ext        = .8
man9ext        = .9
srcdir         =

#######################################
# 1. Setup targets

#######################################
# 2. Build targets

# - compiles program
# - default target
# - doesn't rebuild any documentation
# - should have -g flag for debugging symbols
.PHONY: all
all:
	@$(CC) rand.c -o rand  $(CFLAGS)

#######################################
#  3. Test targets

#######################################
#  4. Documentation targets

#######################################
#  5. Clean and install targets	
# .PHONY targets - not actual files to make but some procedures

.PHONY: clean
clean:
	@rm rand

# - compiles program
# - copies executables and libraries where they should reside for actual use
# - may or may not perform simple test
# - doesn't strip executables
# - should not modify anything  in directory where target was built
# - should create all directiories in which files are to be installed (includes prefixes)
# - the '-' before any command for installing manpage so make will ignore errors
.PHONY: install
install: all
	$(INSTALL_PROGRAM) rand $(DESTDIR)$(bindir)/rand
