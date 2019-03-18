# (c) Copyright 2019 Bartosz Mierzynski
# This makefile abides GNU Coding Standards

# Used to avoid problems with systems where SHELL variable 
# is inherited from environment
SHELL=/bin/sh

# Clears suffixes list and sets new one describing ALL suffixes used in makefile.
# Those newly defined suffixes are target for makefiles implicit rules
# This procedure is done to remove misbehaviour between make programs which work differently
# and have different suffix lists and implicit rules
.SUFFIX:
.SUFFIX: .c .o

########################################
# Portable utilities that can be used without setting variable for them
# ---------------------------------------------------------------------
#  awk cat cmp cp diff echo egrep expr false grep install-info ln ls
#  mkdir mv printf pwd rm rmdir sed sleep sort tar test touch tr true
#  chgrp chmod chown mknod
#  --------------------------------------------------------------------
# Only POSIX defined options shall be used and scripts shall use /bin/sh
# For example:
#  mkdir -p 
# is not standard

########################################
# Utility programs (those which may need replacement)
AR=ar
BISON=bison
CC=cc
FLEX=flex
#INSTALL must be defined in every Makefile
INSTALL=install
LD=ld
LDCONFIG=ldconfig
LEX=lex
MAKE=make
MAKEINFO=makeinfo
RANLIB=ranlib
TEXI2DVI=texi2dvi
YACC=yacc

########################################
# FLAGS a.k.a command variables of utility programs
# - general scheme: VARFLAGS
# - there are exceptions to the scheme
#BISON
BISONFLAGS=
#CC 
# - should be invoked on every CC invocation both those which do compilation or linking
# - should be placed last in compilation command so user can override the other flags
CFLAGS=-Wall -pedantic -ansi -O2 -g
#preprocessor
# - use in any compilation command that runs preprocessor
CPPFLAGS=
#LD
# - use in any compilation command that does linking or directly uses LD
LDFLAGS=
#LEX
LFLAGS=
#YACC
YFLAGS=

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
prefix=/usr/local
exec_prefix=$(prefix)
bindir=$(exec_prefix)/bin
sbindir=$(exec_prefix)/sbin
libexecdir=$(exec_prefix)/libexec
datarootdir=$(prefix)/share
datadir=$(datarootdir)
sysconfdir=$(prefix)/etc
sharedstatedir=$(prefix)/com
localstatedir=$(prefix)/var
runstatedir=$(localstatedir)/run
includedir=$(prefix)/include
oldincludedir=/usr/include
docdir=$(datarootdir)/doc/yourpkg
infodir=$(datarootdir)/info
htmldir=$(docdir)
dvidir=$(docdir)
pdfdir=$(docdir)
psdir=$(docdir)
libdir=$(exec_prefix)/lib
lispdir=$(datarootdir)/emacs/site-lisp
localedir=$(datarootdir)/locale
mandir=$(datarootdir)/man
man0dir=$(mandir)/man0
man1dir=$(mandir)/man1
man2dir=$(mandir)/man2
man3dir=$(mandir)/man3
man4dir=$(mandir)/man4
man5dir=$(mandir)/man5
man6dir=$(mandir)/man6
man7dir=$(mandir)/man7
man8dir=$(mandir)/man8
man9dir=$(mandir)/man9
manext=.1
man0ext=.0
man1ext=.1
man2ext=.2
man3ext=.3
man4ext=.4
man5ext=.5
man6ext=.6
man7ext=.7
man8ext=.8
man9ext=.9
srcdir=

########################################
# Default target (first one) shall be named all
all:
	@$(CC) rand.c -o rand  $(CFLAGS)

#######################################
# .PHONY targets - not actual files to make but some procedures
.PHONY: clean
clean:
	@rm rand
.PHONY: install
	$(INSTALL_PROGRAM) rand $(DESTDIR)$(bindir)/rand

