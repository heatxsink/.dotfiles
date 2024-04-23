#################################################################
# .bashrc
#################################################################

# User specific aliases and functions
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

################################################################

function parse_git_branch {
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\ \1/'
}

#FIRST, set up the session

if [ ! "$KRB5CCNAME" ]; then
    PS1="{\h:\w\[\033[0;32m\]\$(parse_git_branch)\[\033[0m\]}***>"
else
    PS1="`uname -n`-dce:$UDSVER> "
fi

# cli Colors
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

