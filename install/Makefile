#
#
.PHONY: server7.4 server pi composer desktop manual

server7.4:
	grep "^[^#;]" server7.4 | xargs sudo apt-get -y install

server:
	grep "^[^#;]" server | xargs sudo apt-get -y install

desktop:
	grep "^[^#;]" desktop_2020 | xargs sudo apt-get -y install

pi:
	grep "^[^#;]" pi | xargs sudo apt-get -y install

composer: 
	curl -sS https://getcomposer.org/installer | php
	sudo install composer.phar /usr/local/bin/composer
	rm composer.phar

manual:
	bash ./manual

