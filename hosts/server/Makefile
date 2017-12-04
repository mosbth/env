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
OPTS 		:= -a --delete
OPTS_VFAT 	:= $(OPTS) --modify-window=1 --no-perms --no-links
EXCL_MAC  	:= --exclude .DS_Store --exclude ._.DS_Store --exclude .AppleDouble

HOST	 = $(shell hostname)
LOCAL  	:= hosts/$(HOST)

# crontab
# For backup using Makefile                                   
# 0 3 * * * cd $HOME; make backup-daily &> log/backup-daily     
# 0 4 * * 1 cd $HOME; make backup-weekly &> log/backup-weekly   
# 0 5 1 * * cd $HOME; make backup-monthly &> log/backup-monthly 



# target: backup-pre              - Run before any backup is made.
.PHONY: backup-pre
backup-pre:
	@$(call HELPTEXT,$@)
	@date
	@[ -d log ] || (install -d $(LOCAL)/log && ln -s $(LOCAL)/log)



# target: backup-post             - Run after any backup is made.
.PHONY: backup-post
backup-post:
	@$(call HELPTEXT,$@)
	@date



# target: backup-daily            - Daily backup.
.PHONY: backup-daily
backup-daily: backup-pre backup-hosts-daily backup-post
	@$(call HELPTEXT,$@)
	@date > $(LOCAL)/log/$@



# target: backup-weekly           - Weekly backup.
.PHONY: backup-weekly
backup-weekly: backup-pre backup-hosts-weekly backup-post
	@$(call HELPTEXT,$@)
	@date > $(LOCAL)/log/$@



# target: backup-monthly          - Monthly backup.
.PHONY: backup-monthly
backup-monthly: backup-pre backup-hosts-monthly backup-post
	@$(call HELPTEXT,$@)
	@date > $(LOCAL)/log/$@



# target: backup-local            - Backup of local host.
.PHONY: backup-local
backup-local:
	@$(call HELPTEXT,$@)
	cd $(HOME)
	install -d $(LOCAL)/etc/samba
	[ ! -f /etc/hosts ]          || cp /etc/hosts $(LOCAL)/etc
	[ ! -f /etc/fstab ]          || cp /etc/fstab $(LOCAL)/etc
	[ ! -f /etc/exports ]        || cp /etc/exports $(LOCAL)/etc
	[ ! -f /etc/minidlna.conf ]  || cp /etc/minidlna.conf $(LOCAL)/etc
	[ ! -f /etc/samba/smb.conf ] || cp /etc/samba/smb.conf $(LOCAL)/etc/samba

	# If using fail2ban
	[ ! -d /etc/fail2ban ] || install -d $(LOCAL)/etc/fail2ban
	[ ! -f /etc/fail2ban/fail2ban.conf ] || cp /etc/fail2ban/fail2ban.conf $(LOCAL)/etc/fail2ban
	[ ! -f /etc/fail2ban/jail.local ] || cp /etc/fail2ban/jail.local $(LOCAL)/etc/fail2ban

	crontab -l > $(LOCAL)/crontab



# target: backup-hosts-daily      - Backup daily hosts to local disc.
.PHONY: backup-hosts-daily
backup-hosts-daily: backup-local
	@$(call HELPTEXT,$@)
	rsync $(OPTS) share/ share_backup/

	rsync $(OPTS) -e "ssh -i backup_rsa" pi:hosts/pi hosts
	rsync $(OPTS) -e "ssh -i backup_rsa" desktop:hosts/desktop hosts



# target: backup-hosts-weekly     - Backup weekly hosts to local disc.
.PHONY: backup-hosts-weekly
backup-hosts-weekly:
	@$(call HELPTEXT,$@)
	rsync $(OPTS) -e "ssh -i backup_rsa" desktop:hosts/tomato hosts
	rsync $(OPTS) -e "ssh -i backup_rsa" desktop:hosts/dbwebb.se hosts
	rsync $(OPTS) -e "ssh -i backup_rsa" desktop:hosts/arkiv/ hosts/desktop-arkiv/

	rsync $(OPTS) share backup
	rsync $(OPTS) hosts backup



# target: backup-hosts-monthly    - Backup monthly hosts to local disc.
.PHONY: backup-hosts-monthly
backup-hosts-monthly:
	@$(call HELPTEXT,$@)
