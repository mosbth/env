# ls
alias ls="ls -Fh"
alias la='ls -aFh'
alias ll='ls -lFh'
alias lla'=ls -laFh'

# Useful
alias grep='grep --color=auto'
alias psg="ps -aux | grep "
alias cd..="cd .."
alias s="sudo"

# sshfs
alias sshfs-www2.sifero.se='sshfs -o idmap=user mos@www2.sifero.se:/home/mos /home/mos/mnt/www2.sifero.se/'
alias sshfs-dbwebb.se='sshfs -o port=2222 -o idmap=user mos@dbwebb.se:/home/mos /home/mos/mnt/dbwebb.se/'

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

# dbwebb
alias dw='dbwebb'
alias dwv='dbwebb-validate'

# Atom
alias apm-deinstall-all="apm deinstall \$( ls $HOME/.atom/packages/ )"
alias apm-install-all="apm install linter linter-less linter-pylint linter-jscs linter-phpcs block-travel linter-jshint linter-phpmd linter-csslint linter-pep8 linter-shellcheck linter-htmlhint linter-php linter-xmllint remote-edit"

# History
export HISTFILESIZE=
export HISTSIZE=
alias h="history"
alias hg="history | grep"
