# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

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
export PATH=/usr/local/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/apps:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.platformio/penv/bin:$PATH
export PATH=$HOME/.local/share/VCV/Rack2Pro:$PATH
export PATH=$HOME/usr/local/bin:$PATH

if [ -d $HOME/bin ] ; then
	export PATH=$HOME/bin:$PATH
fi

if [ -d $HOME/.local/bin ] ; then
	export PATH=$HOME/.local/bin:$PATH
fi

#####################################
# byobu
#####################################
_byobu_sourced=1 . /usr/bin/byobu-launch 2>/dev/null || true
