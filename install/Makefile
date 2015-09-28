#
#
.PHONY: wheezy-server

wheezy-server:
	grep "^[^#;]" wheezy-server | xargs sudo apt-get -y install

composer: 
	curl -sS https://getcomposer.org/installer | php
	sudo install composer.phar /usr/local/bin/composer
	rm composer.phar

