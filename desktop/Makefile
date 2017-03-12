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
OPTS 		:= -a --delete
DESKTOP 	:= hosts/desktop
DBWEBB  	:= hosts/dbwebb
MEGAMIC 	:= hosts/megamic.se
SHARE4 		:= /mnt/megamic/share4/desktop



# target: backup-daily            - Daily backup.
.PHONY: backup-daily
backup-daily: backup-dbwebb backup-megamic backup-desktop
	@$(call HELPTEXT,$@)



# target: backup-weekly           - Weekly backup.
.PHONY: backup-weekly
backup-weekly: backup-share4
	@$(call HELPTEXT,$@)



# target: backup-desktop          - Backup of all desktop items.
.PHONY: backup-desktop
backup-desktop:
	@$(call HELPTEXT,$@)
	cd $(HOME)
	install -d $(DESKTOP)
	sudo rsync $(OPTS) --exclude git/working git $(DESKTOP)
	sudo rsync $(OPTS) dbwebb-kurser $(DESKTOP)
	sudo rsync $(OPTS) htdocs $(DESKTOP)
	sudo rsync $(OPTS) customer $(DESKTOP)
	sudo rsync $(OPTS) Pictures $(DESKTOP)



# target: backup-megamic          - Backup of megamic.se.
.PHONY: backup-megamic
backup-megamic:
	@$(call HELPTEXT,$@)
	install -d $(MEGAMIC)
	rsync $(OPTS) -e "ssh" megamic.se:irclogs $(MEGAMIC)



# target: backup-dbwebb           - Backup of dbwebb.se.
.PHONY: backup-dbwebb
backup-dbwebb:
	@$(call HELPTEXT,$@)
	install -d $(DBWEBB)
	cd $(HOME)/git/v2.dbwebb.se
	rsync -a -e "ssh -p 2222" dbwebb.se:git/dbwebb.se/backup $(DBWEBB)
	cd $(HOME)/git
	rsync $(OPTS) -e "ssh -p 2222" dbwebb.se:git/irssistats $(DBWEBB)
	rsync $(OPTS) -e "ssh -p 2222" dbwebb.se:irclogs $(DBWEBB)
	rsync $(OPTS) -e "ssh -p 2222" dbwebb.se:htdocs/uptime.dbwebb.se/data $(DBWEBB)



# target: backup-share4           - Backup parts of desktop/hosts to share4/desktop.
.PHONY: backup-share4
backup-share4:
	@$(call HELPTEXT,$@)
	install -d $(SHARE4)
	rsync $(OPTS) hosts/dbwebb $(SHARE4)
	rsync $(OPTS) hosts/megamic.se $(SHARE4)
	rsync $(OPTS) hosts/desktop $(SHARE4)
	rsync $(OPTS) hosts/tomato $(SHARE4)
