############################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

HOME="/home/bohendo"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
export NPM_PACKAGES="$HOME/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"

# set PATH so it includes user's private bin if it exists
PATH="$HOME/bin:$HOME/.npm-packages/bin:$PATH"

# If not running interactively, don't do anything else
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# vim is my default editor
export EDITOR='/usr/bin/vim '

# set default less options (enables color)
export LESS='--raw-control-chars --quit-if-one-screen --no-init'

# this will give my man pages some color. Courtesy of:
# https://gist.github.com/cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66
man() {
	env \
		LESS_TERMCAP_mb=$(printf "\e[1;31m") \
		LESS_TERMCAP_md=$(printf "\e[1;31m") \
		LESS_TERMCAP_me=$(printf "\e[0m") \
		LESS_TERMCAP_se=$(printf "\e[0m") \
		LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
		LESS_TERMCAP_ue=$(printf "\e[0m") \
		LESS_TERMCAP_us=$(printf "\e[1;32m") \
			man "$@"
}

# this will protect me from overwritting stuff
set -o noclobber

bash_logout () {
    if [ "$SHLVL" = 1 ]; then
        [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    fi
    }
trap bash_logout EXIT


############################################################
# Aliases

# enable color support of ls, etc
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=always'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# a safer way to move/copy
alias mv='mv -i '
alias cp='cp -i '

# qpdfview is awkward to type and I type it a lot. no more.
alias q="qpdfview "

# some good ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sl='ls'

alias v='vim '
alias sudov='sudo vim '

# I use du -hs a lot.. let's make that the default
alias du="du -hs"

# recommended by stack overflow to allow pasting with ctrl+v
alias xclip="xclip -selection c "

# easily view the git commit tree
alias gls="git log --graph --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -5 && echo ======= && git status -s"
alias gitl="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags -10"
alias gitla="git log --graph --decorate --pretty=format:'%Cred%h%Creset %Cgreen(%cr) %C(bold blue)<%an>%Creset%C(yellow)%d%Creset %s %Creset' --abbrev-commit --branches --remotes --tags"

# which ports
alias checkports="netstat -tulpn"

# enables alias commands with sudo
alias sudo='sudo '

# make my preferred output default
alias xxd="xxd -c 40 -g 4 "

# trim whitespace
alias trim="sed -e 's/[[:space:]]*$//g' " 

# print pretty tree of all processes & pids
alias pse="ps -eHo \"%p %c\" "

# easily fix my keyboard TODO run this on startup
alias xkb="setxkbmap -option caps:ctrl_modifier"

# -C means always print color
alias t="tree -C "
alias p="less -FRX "

alias pd="pomodoro &"

alias tls="todo ls "

