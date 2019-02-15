############################################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples
# don't put duplicate lines or lines starting with space in the history.

############################################################
# Export Environment Variables

mkdir -p $HOME/.npm-packages

export DH_USER=`whoami`
export DOMAINNAME="localhost"
export EDITOR='/usr/bin/vim'
export ETH_ADDRESS="0x119e26E8809EfD0D2bAF690C62bD847271f2E96E"
export ETH_ADDRESS_INDEX="0"
export ETH_SECRET_STORE="ledger"
export GOPATH="$HOME/go"
export HISTTIMEFORMAT="%y%m%d %T "
export HOME="/Users/bohendo"
export LESS='--raw-control-chars --quit-if-one-screen --no-init'
unset  MANPATH  # I'd rather inherit defaults from /etc/manpage.conf
export NPM_PACKAGES="$HOME/.npm-packages"
export NVM_DIR="$HOME/.nvm"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH="$HOME/bin:/usr/local/opt/coreutils/libexec/gnubin:/Library/TeX/texbin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.config/yarn/global/node_modules/.bin:/usr/local/go/bin:$PATH"

if [ -f $HOME/.private_env ]
then source $HOME/.private_env
fi

if [ -f $HOME/.cargo/env ]
then source $HOME/.cargo/env
fi

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
# set shell options

# this will protect me from overwritting stuff
set -o noclobber

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# check the window size after each command and, if necessary, update
# the values of LINES and COLUMNS.
shopt -s checkwinsize

############################################################
# less

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]
then eval "$(SHELL=/bin/sh lesspipe)"
fi

############################################################
# Configure autocompletions

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix
then
  if [ -f /usr/share/bash-completion/bash_completion ]
  then source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]
  then source /etc/bash_completion
  fi
fi

if [ -f $(brew --prefix)/etc/bash_completion ]
then source $(brew --prefix)/etc/bash_completion
fi

############################################################
# Clear console on logout

bash_logout () {
  if [ "$SHLVL" = 1 ]
  then [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
  fi
}
trap bash_logout EXIT

############################################################
# Load Aliases

if [ -f ~/.bash_aliases ]
then source ~/.bash_aliases
fi

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

################################################################################
# fix my keyboard
[[ `which setxkbmap` ]] && setxkbmap -option caps:ctrl_modifier
alias xkb="setxkbmap -option caps:ctrl_modifier"

