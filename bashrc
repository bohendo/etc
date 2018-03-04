############################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples
# don't put duplicate lines or lines starting with space in the history.

############################################################
# Export Environment Variables

export HOME="/home/bohendo"
export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.npm-packages/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export EDITOR='/usr/bin/vim'
export LESS='--raw-control-chars --quit-if-one-screen --no-init'

unset  MANPATH  # I'd rather inherit defaults from /etc/manpage.conf
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

mkdir -p $HOME/.npm-packages
export NPM_PACKAGES="$HOME/.npm-packages"

export GOPATH="$HOME/go"

export ETH_ADDRESS="0xeb56b369ddaa70034f94ba195f4377e895b919cf"

export DOMAINNAME="localhost"

############################################################
# If not running interactively, don't do anything else
case $- in
    *i*) ;;
      *) return;;
esac

############################################################
# Set Shell Variables

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000

PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

############################################################
# Man

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


############################################################
# shopt

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# check the window size after each command and, if necessary, update
# the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

############################################################
# set?

# this will protect me from overwritting stuff
set -o noclobber

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt
# below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

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

bash_logout () {
    if [ "$SHLVL" = 1 ]; then
        [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
    fi
    }
trap bash_logout EXIT


############################################################
# System-specific aliases

# enable color support of ls, etc
if [ -x /usr/bin/dircolors ]; then

    test -r ~/.dircolors &&\
    eval "$(dircolors -b ~/.dircolors)" ||\
    eval "$(dircolors -b)"

    alias ls='ls --color=always'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# fix my keyboard
[[ `which setxkbmap` ]] && setxkbmap -option caps:ctrl_modifier
alias xkb="setxkbmap -option caps:ctrl_modifier"

############################################################
# Aliases to share

if [ -f ~/.bash_aliases ]
then
    . ~/.bash_aliases
fi
