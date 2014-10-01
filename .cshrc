#set prompt = \033[0;32;0m%U%m%u\033:%B%~%b%#
set prompt = "%{\033[0;32m%}%U%m%u%{\033[0m%}:%B%~%b%# "

alias ls ls -F
alias la ls -aF
alias ll ls -lF
alias lla ls -alF

alias psg "ps -aux | grep "

set path = ($path ~/bin /sbin /usr/sbin /usr/games $HOME/git/bin-dbwebb/)
alias xt xterm

setenv EDITOR /usr/bin/vim
setenv HISTORY 10000

alias sshfs-www2.sifero.se sshfs -o idmap=user mos@www2.sifero.se:/home/mos /home/mos/mnt/www2.sifero.se/
alias sshfs-dbwebb.se sshfs -o port=2222 -o idmap=user mos@dbwebb.se:/home/mos /home/mos/mnt/dbwebb.se/

alias tmux_basic_start tmux new-session -s basic 
alias tmux_basic tmux attach -t basic            

#setenv PYENV_ROOT "${HOME}/.pyenv"        
#set path = ($path ${PYENV_ROOT}/bin) 
#eval `pyenv init -`                  
