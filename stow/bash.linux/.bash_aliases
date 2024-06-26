# .bash_aliases

alias ls='ls --color'
alias ll='ls -alhF'
alias gitlog='git log --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias gitgraph='git log --graph --pretty=format:"%h%x09%an%x09%ad%x09%s"'
alias checkpath="echo $PATH | sed 's/:/\n/g' | sort | uniq -c"

