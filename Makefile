#!/usr/bin/make -f

# ---------------------------------------------------------------------------
#
# General setup
#

# Detect OS
OS = $(shell uname -s)

# Defaults
ECHO = echo

# Make adjustments based on OS
ifneq (, $(findstring CYGWIN, $(OS)))
	ECHO = /bin/echo -e
endif

# Colors and helptext
NO_COLOR	= \033[0m
ACTION		= \033[32;01m
OK_COLOR	= \033[32;01m
ERROR_COLOR	= \033[31;01m
WARN_COLOR	= \033[33;01m

# Which makefile am I in?
WHERE-AM-I = $(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
THIS_MAKEFILE := $(call WHERE-AM-I)

# Echo some nice helptext based on the target comment
HELPTEXT = $(ECHO) "$(ACTION)--->" `egrep "^\# target: $(1) " $(THIS_MAKEFILE) | sed "s/\# target: $(1)[ ]*-[ ]* / /g"` "$(NO_COLOR)"



# target: help                    - Displays help with targets available.
.PHONY:  help
help:
	@$(call HELPTEXT,$@)
	@echo "Usage:"
	@echo " make [target] ..."
	@echo "target:"
	@egrep "^# target:" Makefile | sed 's/# target: / /g'



# ---------------------------------------------------------------------------
#
# Specifics
# 

# Backup local files on desktop
OPTS 	:= -a --delete
HOST  	:= hosts/server
SHARE   := share



# target: backup-pre              - Run before any backup is made.
.PHONY: backup-pre
backup-pre:
	@$(call HELPTEXT,$@)
	@date
	install -d log



# target: backup-post             - Run after any backup is made.
.PHONY: backup-post
backup-post:
	@$(call HELPTEXT,$@)
	@date



# target: backup-daily            - Daily backup.
.PHONY: backup-daily
backup-daily: backup-pre backup-server backup-share-to-local backup-post
	@$(call HELPTEXT,$@)



# target: backup-weekly           - Weekly backup.
.PHONY: backup-weekly
backup-weekly: backup-pre backup-post
	@$(call HELPTEXT,$@)



# target: backup-monthly          - Monthly backup.
.PHONY: backup-monthly
backup-monthly: backup-pre backup-post
	@$(call HELPTEXT,$@)



# target: backup-host             - Backup of local host.
.PHONY: backup-host
backup-host:
	@$(call HELPTEXT,$@)
	cd $(HOME)
	install -d $(HOST)/etc
	cp /etc/fstab   $(HOST)/etc
	cp /etc/exports $(HOST)/etc
	crontab -l    > $(HOST)/crontab
	rsync $(OPTS) $(HOST) $(SHARE)/hosts



# target: backup-share-to-local   - Backup share/ to local host.
.PHONY: backup-share-to-local
backup-share-to-local:
	@$(call HELPTEXT,$@)
	rsync $(OPTS) share/ share_backup/



# target: backup-share-to-backup  - Backup share/ to primary backup disc.
.PHONY: backup-share-to-backup
backup-share-to-backup:
	@$(call HELPTEXT,$@)
	rsync $(OPTS) share/ backup/share/

