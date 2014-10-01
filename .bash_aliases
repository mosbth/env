export PATH="$HOME/bin:$PATH"

alias la='ls -aF'
alias ll='ls -lF'
alias lla'=ls -laF'

alias psg "ps -aux | grep "

alias xt xterm

alias sshfs-www2.sifero.se sshfs -o idmap=user mos@www2.sifero.se:/home/mos /home/mos/mnt/www2.sifero.se/
alias sshfs-dbwebb.se sshfs -o port=2222 -o idmap=user mos@dbwebb.se:/home/mos /home/mos/mnt/dbwebb.se/

alias tmux_basic_start tmux new-session -s basic
alias tmux_basic tmux attach -t basic

