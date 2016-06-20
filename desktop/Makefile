#!/usr/bin/make -f

#
# Backup local files on desktop
#
OPTS := -a --delete
TO := hosts/desktop
DBWEBB  := hosts/dbwebb
MEGAMIC := hosts/megamic.se

all: backup-dbwebb backup-megamic backup



.PHONY: backup
backup:
	cd $(HOME)
	install -d $(TO)
	sudo rsync $(OPTS) git $(TO)
	sudo rsync $(OPTS) dbwebb-kurser $(TO)
	sudo rsync $(OPTS) htdocs $(TO)
	sudo rsync $(OPTS) customer $(TO)
	sudo rsync $(OPTS) Pictures $(TO)



.PHONY: backup-megamic
backup-megamic:
	# From megamic.se
	rsync $(OPTS) -e "ssh" megamic.se:irclogs $(MEGAMIC)



# Backup database from dbwebb.se
.PHONY: backup-dbwebb
backup-dbwebb:
	cd $(HOME)/git/dbwebb.se
	rsync -av -e "ssh" dbwebb.se:htdocs/cc1.dbwebb.se/backup $(DBWEBB)
	cd $(HOME)/git
	rsync $(OPTS) -v -e "ssh" dbwebb.se:git/irssistats $(DBWEBB)
	rsync $(OPTS) -v -e "ssh" dbwebb.se:irclogs $(DBWEBB)
