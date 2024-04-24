# .profile

#export LSCOLORS=ExFxCxDxBxegedabagacad
export LSCOLORS=ExFxBxDxCxegedabagacad


#####################################
# base export's
#####################################
export EDITOR=vim
export GOPATH=$HOME/go
export GOPRIVATE="github.com/heatxsink/x"

#####################################
# PATH
#####################################
export PATH=/usr/local/go/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/apps:$PATH
export PATH=$HOME/scripts:$PATH

#####################################
# byobu
#####################################
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
