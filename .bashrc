#################################################################
# .bashrc
#################################################################

# User specific aliases and functions
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

################################################################

#FIRST, set up the session
if [ ! "$KRB5CCNAME" ]; then
    PS1="{\h:\w}***>"
else
    PS1="`uname -n`-dce:$UDSVER> "
fi

# cli Colors
export CLICOLOR=1
# use yellow for dir’s
export LSCOLORS=dxfxcxdxbxegedabagacad
