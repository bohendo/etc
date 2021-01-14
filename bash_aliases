alias .....="cd ../../../.. "
alias ....="cd ../../.. "
alias ...="cd ../.. "
alias ..="cd .. "
alias bt="bluetoothctl "
alias btc="bluetooth connect"
alias btd="bluetooth disconnect"
alias cli="./cli"
alias copy='xclip -sel clip'
alias cp="cp -i "
alias curl="curl -sk "
alias dls="docker service ls && echo '=====' && docker container ls -a"
alias drun="docker run -it --rm --workdir=/root "
alias du="du -hs"
alias dus="du -hs * | sort -h"
alias gba="git branch -l --sort=-committerdate --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) %(color:green)(%(committerdate:relative))%(color:reset) by%(color:blue bold) %(authorname)%(color:reset) - %(contents:subject)' && echo '  =====' && git branch -r --sort=-committerdate --format='%(HEAD) %(color:red)%(objectname:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) %(color:green)(%(committerdate:relative))%(color:reset) by%(color:blue bold) %(authorname)%(color:reset) - %(contents:subject)' "
alias gfa="git fetch --all --prune --tags"
alias gitl="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit -20"
alias gitla="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cD) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags "
alias gls="git log --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -10 && echo ======= && git status -s"
alias gr="grep --exclude=*.swp --color=auto -r "
alias grep="grep --exclude=*.swp --color=auto "
alias l="ls --color"
alias la="ls -A --color"
alias ll="ls -alF --color "
alias logs="bash ops/logs.sh "
alias ls="ls --color"
alias music="mocp ~/Music"
alias mv="mv -i "
alias netlogo="$HOME/Downloads/NetLogo/NetLogo"
alias open="xdg-open "
alias pdf="masterpdfeditor5 "
alias pse="pstree "
alias pst="pstree -h `whoami` "
alias replace="bash ops/replace.sh "
alias search="bash ops/search.sh "
alias sl="ls --color"
alias stop="bash ops/stop.sh "
alias sudo="sudo "
alias sudov="sudo nvim "
alias t="tree  -a -C -L 5 --filelimit 50 --dirsfirst "
alias te="tree -a -C -L 5 --filelimit 50 --dirsfirst -p -D --si -f -i --du "
alias tls="todo ls "
alias trim="sed -e 's/[[:space:]]*$//g' " 
alias tunnel="ssh -D 16180 -C -N -p 443 bohendo@vpn.bohendo.com"
alias upgrade-all="sudo apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade && sudo apt-get autoremove -y"
alias upgrade="sudo apt-get update -y && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade && sudo apt-get autoremove -y"
alias v="nvim "
alias xxd="xxd -c 40 -g 4 "
