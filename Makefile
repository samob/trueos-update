#############################################################################
# Makefile for building: trueos-update
#############################################################################

PREFIX?= /var

AR            = ar cqs
RANLIB        = 
TAR           = tar -cf
COMPRESS      = gzip -9f
COMPRESS_MAN	= gzip -c
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -R
STRIP         = 
INSTALL_FILE  = $(COPY_FILE)
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = $(COPY_FILE)
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

first: all

all:

install_scripts: first FORCE
	@$(CHK_DIR_EXISTS) $(INSTALL_ROOT)$(PREFIX)/trueos-update || $(MKDIR) $(INSTALL_ROOT)$(PREFIX)/trueos-update
	-$(INSTALL_FILE) trueos-update $(INSTALL_ROOT)$(PREFIX)/trueos-update
	-$(INSTALL_FILE) rc-update $(INSTALL_ROOT)$(PREFIX)/trueos-update
	-$(INSTALL_FILE) rc-doupdate $(INSTALL_ROOT)$(PREFIX)/trueos-update
	-$(INSTALL_FILE) doPkgUp.sh $(INSTALL_ROOT)$(PREFIX)/trueos-update
	-$(COMPRESS_MAN) trueos-update.8 > $(INSTALL_ROOT)/usr/share/man/man8/trueos-update.8.gz


uninstall_scripts:  FORCE
	-$(DEL_FILE) -r $(INSTALL_ROOT)$(PREFIX)/trueos-update


install_dochmod: first FORCE
	chmod 755 $(PREFIX)/trueos-update/trueos-update

install_conf: first FORCE
	@$(CHK_DIR_EXISTS) $(INSTALL_ROOT)$(PREFIX)/trueos-update || $(MKDIR) $(INSTALL_ROOT)$(PREFIX)/trueos-update
	-$(INSTALL_DIR) conf $(INSTALL_ROOT)$(PREFIX)/trueos-update

uninstall_conf:  FORCE
	-$(DEL_FILE) -r $(INSTALL_ROOT)$(PREFIX)/trueos-update/conf
	-$(DEL_DIR) $(INSTALL_ROOT)$(PREFIX)/trueos-update


install:  install_scripts install_dochmod install_conf FORCE

uninstall: uninstall_scripts uninstall_conf  FORCE

FORCE:
