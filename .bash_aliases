# ls
alias ls="ls -Fh"
alias la='ls -aFh'
alias ll='ls -lFh'
alias lla'=ls -laFh'

# grep
alias grep='grep --color=auto'
alias gr='grep --ignore-case --line-number'
alias grr='gr --recursive'

# cd
alias ..="cd .."
alias ...="cd ..; cd ..;"
alias ....="cd ..; cd ..; cd ..;"
alias .....="cd ..; cd ..; cd ..; cd ..;"

# Useful
alias grep='grep --color=auto'
alias psg="ps -aux | grep "
alias s="sudo"

# rsync
alias rs='rsync -a -e "ssh"'
alias rsv='rsync -av -e "ssh"'
alias rs2='rsync -a -e "ssh -p 2222"'
alias rsv2='rsync -av -e "ssh -p 2222"'

# ssh login
alias ssh-cc1="ssh mos@cc1.dbwebb.se"
alias ssh-do1="ssh mos@do1.dbwebb.se"
alias ssh-do2="ssh mos@do2.dbwebb.se"
alias ssh-www2="ssh mos@www2.megamic.se -p 2222"
alias ssh-www5="ssh mos@www5.dbwebb.se -p 2222"
alias ssh-mycom="ssh mos@mycom.com.bth.se -p 2222"
alias ssh-stud="ssh mosstud@ssh.student.bth.se"
alias ssh-bth-pi="ssh mos@mospi1.clab.bth.se -p 2222"
alias ssh-bth1="ssh mos@dbwebb.tekproj.bth.se -p 2222"

# sshfs
# -oauto_cache,reconnect,Ciphers=arcfour
alias sshfs-www2.sifero.se='sshfs -o idmap=user mos@www2.sifero.se:/home/mos /home/mos/mnt/www2.sifero.se/'
alias sshfs-dbwebb.se='sshfs -oauto_cache,reconnect,Ciphers=arcfour,port=2222,idmap=user mos@dbwebb.se:/home/mos /home/mos/mnt/dbwebb.se/'
alias sshfs-stud='sshfs -o port=22 -o idmap=user mosstud@ssh.student.bth.se:/home/saxon/teachers/com/mosstud /home/mos/mnt/ssh.student.bth.se/'
alias sshfs-stud-all='sshfs -o port=22 -o idmap=user mosstud@ssh.student.bth.se:/home/saxon/students /home/mos/mnt/ssh.student.bth.se-students/'

# tmux
alias tmux_basic_start='tmux new-session -s basic'
alias tmux_basic='tmux attach -t basic'
alias tbs=tmux_basic_start
alias tb=tmux_basic

# Git
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
alias gcam='git commit -a -m'
alias gs='git status'
alias ga='git add'
alias gh='git hist'
alias gb='git branch'
alias gsd='git stash show -p stash@{0}'
alias gf='git fetch'
alias gfu='git fetch upstream'
alias gmu='git merge upstream/master'
alias gsu='git submodule update --init --recursive'

# dbwebb
alias dw='dbwebb'
alias dwv='dbwebb-validate'

# Course repos
alias fecr='for dir in htmlphp python design javascript1 linux oopython webapp oophp phpmvc javascript webgl; do'

# Make
alias mlp='make local-publish'
alias mlpc='make local-publish-clear'

# Service Apache
alias sar='service apache2 reload'
alias sarestart='service apache2 restart'

# Atom
alias apm-deinstall-all="apm deinstall \$( ls $HOME/.atom/packages/ )"
alias apm-install-all="apm install linter linter-less linter-pylint linter-jscs linter-phpcs block-travel linter-jshint linter-phpmd linter-csslint linter-pep8 linter-shellcheck linter-htmlhint linter-php linter-xmllint remote-edit"

# History
export HISTFILESIZE=
export HISTSIZE=
alias h="history"
alias hg="history | grep"

# Install
