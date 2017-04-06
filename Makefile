#
#
FILES = .bash_aliases .bashrc_my .tmux.conf .vimrc .gitconfig
DIRS = .vim

.PHONY: install bashrc aliases

install:
		install $(FILES) ~
		rsync -av .vim ~
		#rsync -av .atom ~
		rsync -av .config ~
		rsync -av bin/ $(HOME)/bin/
		install desktop/Makefile $(HOME)

install-mac:
		install $(FILES) ~
		rsync -av .vim ~
		rsync -av .atom ~

profile:
		touch ~/.profile
		echo "source ~/.bashrc_my" >> ~/.profile
		echo "source ~/.bash_aliases" >> ~/.profile

bashrc:
		echo "source ~/.bashrc_my" >> ~/.bashrc

aliases:
		echo "source ~/.bash_aliases" >> ~/.bashrc


# Atom
#alias apm-deinstall-all="apm deinstall \$( ls $HOME/.atom/packages/ )"
#alias apm-install-all="apm install linter linter-less linter-pylint linter-jscs linter-phpcs linter-jshint linter-phpmd linter-csslint linter-pep8 linter-shellcheck linter-htmlhint linter-php linter-xmllint remote-edit"
