# .bash_aliases

alias ls='ls -G'
alias ll='ls -alhF'
alias flush_cache='dscacheutil -flushcache'
alias gitlog='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias gitgraph='git log --graph --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias checkpath="echo $PATH | sed 's/:/\n/g' | sort | uniq -c"

alias arm='env /usr/bin/arch -arm64 /bin/bash --login'
alias intel='env /usr/bin/arch -x86_64 /bin/bash --login'

