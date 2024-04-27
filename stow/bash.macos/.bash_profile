# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

#####################################
# macOS specific exports
#####################################
export BASH_SILENCE_DEPRECATION_WARNING=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export CLICOLOR=1

#####################################
# Base export's
#####################################
export EDITOR=vim
export GOPATH=$HOME/go

#####################################
# PATH
#####################################
export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$HOME/.scripts:$PATH
export PATH=$HOME/.local/bin:$PATH

_byobu_sourced=1 . /usr/local/Cellar/byobu/6.12/bin/byobu-launch 2>/dev/null || true
