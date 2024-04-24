# .profile

export BASH_SILENCE_DEPRECATION_WARNING=1
export LSCOLORS=ExFxBxDxCxegedabagacad
#export CLICOLOR=1
#export LSCOLORS=ExFxCxDxBxegedabagacad

EDITOR=vim
GOPATH=$HOME/go

PATH=/opt/homebrew/bin:$PATH
PATH=/usr/local/go/bin:$PATH
PATH=$GOPATH/bin:$PATH
PATH=$HOME/scripts:$PATH
PATH=$HOME/.local/bin:$PATH

_byobu_sourced=1 . /opt/homebrew/Cellar/byobu/6.12/bin/byobu-launch 2>/dev/null || true
