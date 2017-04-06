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

# tmux
alias tbs='tmux new-session -s basic'
alias tb='tmux attach -t basic'

# Git
alias gpl='git pull'
alias gps='git push'
alias gc='git commit'
alias gcam='git commit -a -m'
alias gs='git status'
alias ga='git add'
alias gh='git hist'
alias gb='git branch'
alias gt='git tag'
alias gsd='git stash show -p stash@{0}'
alias gf='git fetch'
alias gfu='git fetch upstream'
alias gmu='git merge upstream/master'
alias gsu='git submodule update --init --recursive'

# dbwebb
alias dw='dbwebb'
alias dwv='dbwebb-validate'

# Course repos
function fecr
{
    for dir in htmlphp python design javascript1 linux oopython webapp oophp phpmvc javascript webgl dbjs
    do
        if [ -d $dir ]; then
            cd $dir
            echo ">>> $dir"
            eval $@
            cd ..
        else
            echo "No such dir $dir"
            exit 0
        fi
    done
}

# Make
alias mlp='make local-publish'
alias mlpc='make local-publish-clear'

# Service Apache
alias sar='sudo service apache2 reload'
alias sarestart='sudo service apache2 restart'

# History
export HISTFILESIZE=
export HISTSIZE=
alias h="history"
alias hg="history | grep"

# Install

# Other
alias port='sudo netstat -nlp | grep'

# Python
alias activate=". .venv/bin/activate"
PIP_DOWNLOAD_CACHE="$HOME/.pip_download_cache"
[ -d "$PIP_DOWNLOAD_CACHE" ] || mkdir "$PIP_DOWNLOAD_CACHE"
