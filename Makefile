#
#
FILES = .bash_aliases .bashrc_my .tmux.conf .vimrc .gitconfig
DIRS = .vim

install:
		install $(FILES) ~
		rsync -av .vim ~
		rsync -av .atom ~
		rsync -av .config ~
		rsync -av bin/ $(HOME)/bin/

bashrc:
		echo "source ~/.bashrc_my" >> ~/.bashrc

aliases:
		echo "source ~/.bash_aliases" >> ~/.bashrc
