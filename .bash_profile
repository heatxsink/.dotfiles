#######################################################
# .bash_profile
#######################################################
## Get the aliases and functions
#######################################################

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

#######################################################
## SSH-AGENT STUFF
#######################################################

if [ ! -S $SSH_AUTH_SOCK ]
then
	/usr/bin/ssh-add -K /path/to/key
fi

#######################################################
# erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000
# append to bash_history if Terminal.app quits
shopt -s histappend
# aliases
alias ls='ls -al'
alias flush_cache='dscacheutil -flushcache'
export EDITOR='emacs'
