#!/usr/bin/make -f

#
# Backup local files on desktop
#
OPTS := -a --delete
TO := hosts/desktop

.PHONY: backup
backup:
	cd $(HOME)
	install -d $(TO)
	sudo rsync $(OPTS) git $(TO)
	sudo rsync $(OPTS) dbwebb-kurser $(TO)
	sudo rsync $(OPTS) htdocs $(TO)
	sudo rsync $(OPTS) customer $(TO)



#
# Backup database from dbwebb.se
#
.PHONY: dbwebb-backup
dbwebb-backup:
	cd $(HOME)/git/dbwebb.se
	rsync -av -e "ssh" dbwebb.se:htdocs/cc1.dbwebb.se/backup/ backup/
