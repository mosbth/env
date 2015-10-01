#!/usr/bin/make -f

#
#
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
