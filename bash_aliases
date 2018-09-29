alias top='htop '

# a safer way to move/copy
alias mv='mv -i '
alias cp='cp -i '

# qpdfview is awkward to type and I type it a lot. no more.
alias q="qpdfview "

# some good ls aliases
alias ls='ls --color'
alias ll='ls -alF --color '
alias la='ls -A --color'
alias l='ls --color'
alias sl='ls --color'

alias v='vim '
alias sudov='sudo vim '

# I use du -hs a lot.. let's make that the default
alias du="du -hs"

# easily view the git commit tree
alias gls="git log --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -10 && echo ======= && git status -s"
alias gitl="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -20"
alias gitla="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cD) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags"

# which ports
alias checkports="netstat -tulpn"

# enables alias commands with sudo
alias sudo='sudo '

# make my preferred output default
alias xxd="xxd -c 40 -g 4 "

# trim whitespace
alias trim="sed -e 's/[[:space:]]*$//g' " 

# print pretty tree of all processes & pids
alias ps="pstree -g3 -s \"bash\" "
alias pse="pstree -g3 -u `whoami` "

# -C for Color always
# -L 5 for 5 Levels deep MAXIMUM
# -p for permissions and file types
# -h for human-readable filesize
# --si for si filesize
# -f for full path
# -i for indentation OFF
# -D for Date modified
# -t for time sort
alias t="tree -C -L 5 -p -D -t --si -f -i --du --filelimit 50 --dirsfirst"

alias tls="todo ls "

alias dls="docker service ls && echo "=====" && docker container ls"

