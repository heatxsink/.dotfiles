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

alias flush_cache='dscacheutil -flushcache'
export EDITOR='emacs'
