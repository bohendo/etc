########################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

########################################
# Export Environment Variables

mkdir -p $HOME/.npm-packages

export ANDROID_HOME=$HOME/Android/Sdk
export DH_USER=`whoami`
export EDITOR="/usr/bin/nvim"
export GOPATH="$HOME/go"
export HISTTIMEFORMAT="%y%m%d %T "
export LESS="--raw-control-chars --quit-if-one-screen --no-init"
export NPM_PACKAGES="$HOME/.npm-packages"
export NVM_DIR="$HOME/.nvm"
unset  MANPATH  # I'd rather inherit defaults from /etc/manpage.conf

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export PATH="$HOME/bin:$HOME/.whiteblock/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.npm-packages/bin:$HOME/.nvm/versions/node/v12.16.3/bin:/usr/local/go/bin:/snap/bin:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

########################################
# If not running interactively, don't do anything else

case $- in
  *i*) ;;
    *) return;;
esac

########################################
# Set Shell Variables

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTTIMEFORMAT="%y%m%d-%H%M%S - "

PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

########################################
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

########################################
# set shell options

# this will protect me from overwritting stuff
set -o noclobber

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# check the window size after each command and, if necessary, update
# the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable double-star stuff like ls **/*.txt
shopt -s globstar

########################################
# less

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]
then eval "$(SHELL=/bin/sh lesspipe)"
fi

########################################
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

########################################
# Clear console on logout

bash_logout () {
  if [ "$SHLVL" = 1 ]
  then [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
  fi
}
trap bash_logout EXIT

########################################
# Load Aliases

if [ -f ~/.bash_aliases ]
then source ~/.bash_aliases
fi

########################################
# System-specific aliases

# enable color support of ls, etc
if [ -x /usr/bin/dircolors ]
then
  test -r ~/.dircolors &&\
  eval "$(dircolors -b ~/.dircolors)" ||\
  eval "$(dircolors -b)"
  alias ls='ls --color=always'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

########################################
# fix my keyboard's capslock/ctrl

[[ `which setxkbmap` ]] && setxkbmap -option caps:ctrl_modifier
alias xkb="setxkbmap -option caps:ctrl_modifier"

########################################
# setup nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use 14

########################################
# setup ssh

if [[ -z "$SSH_AUTH_SOCK" ]]
then
  eval "$(ssh-agent -s)"
  # ssh-add "$HOME/.ssh/$(whoami)"
fi
