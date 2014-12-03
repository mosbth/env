#
#
FILES = .bash_aliases .bashrc_my .tmux.conf .vimrc .gitconfig
DIRS = .vim

install:
		install $(FILES) ~
		rsync -av .vim ~

.bashrc:
		echo "source .bashrc_my" >> ~/.bashrc

