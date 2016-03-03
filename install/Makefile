#
#
.PHONY: server pi composer

server:
	grep "^[^#;]" server | xargs sudo apt-get -y install

pi:
	grep "^[^#;]" pi | xargs sudo apt-get -y install

composer: 
	curl -sS https://getcomposer.org/installer | php
	sudo install composer.phar /usr/local/bin/composer
	rm composer.phar

