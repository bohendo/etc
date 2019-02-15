alias cp="cp -i "
alias dls="docker service ls && echo '=====' && docker container ls"
alias du="du -hs"
alias gitl="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -20"
alias gitla="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cD) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags"
alias gls="git log --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -10 && echo ======= && git status -s"
alias grep="grep --color=auto "
alias l="ls --color"
alias la="ls -A --color"
alias logs="bash ops/logs.sh"
alias ll="ls -alF --color "
alias ls="ls --color"
alias mv="mv -i "
alias pst="pstree -g3 -s \"bash\" "
alias pse="pstree -g3 -u `whoami` "
alias sl="ls --color"
alias sudo="sudo "
alias sudov="sudo vim "
# -C for Color always, -L 5 for 5 Levels deep MAXIMUM, -p for permissions and file types, -h for human-readable filesize
# --si for si filesize, -f for full path, -i for indentation OFF, -D for Date modified, -t for time sort
alias t="tree -C -L 5 -p -D -t --si -f -i --du --filelimit 50 --dirsfirst"
alias tls="todo ls "
alias trim="sed -e 's/[[:space:]]*$//g' " 
alias upgrade="sudo apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade && sudo apt-get autoremove -y"
alias v="vim "
alias xxd="xxd -c 40 -g 4 "
