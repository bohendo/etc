########################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

########################################
# Export Environment Variables

mkdir -p "$HOME/.npm-packages"

export NVIM_LOG_FILE="$HOME/.config/nvim/nvim.log"
export ANDROID_HOME=$HOME/Android/Sdk
export EDITOR="/usr/bin/nvim"
export GOPATH="$HOME/go"
export HISTTIMEFORMAT="%y%m%d %T "
export LESS="--raw-control-chars --quit-if-one-screen --no-init"
export NPM_PACKAGES="$HOME/.npm-packages"
export NVM_DIR="$HOME/.nvm"
unset  MANPATH  # I'd rather inherit defaults from /etc/manpage.conf

export XDG_DATA_DIRS="/home/bohendo/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"

# Default PATH
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki"

# Custom PATH overrides
foundry="$HOME/.foundry/bin"
golang="/usr/local/go/bin"
home_bin="$HOME/bin"
local_bin="$HOME/.local/bin"
nix="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin"
node14="$HOME/.nvm/versions/node/v14.19.1/bin"
npm_packages="$HOME/.npm-packages/bin"
pyenv="$HOME/.pyenv"
rust_bin="$HOME/.cargo/bin"
snap_bin="/snap/bin"
export PATH="$home_bin:$nix:$snap_bin:$golang:$rust_bin:$foundry:$npm_packages:$node14:$pyenv:$local_bin:$PATH"

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

# shellcheck disable=SC2154
PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

########################################
# Man

# this will give my man pages some color. Courtesy of:
# https://gist.github.com/cocoalabs/2fb7dc2199b0d4bf160364b8e557eb66
man() {
	env \
		"LESS_TERMCAP_mb=$(printf "\e[1;31m")" \
		"LESS_TERMCAP_md=$(printf "\e[1;31m")" \
		"LESS_TERMCAP_me=$(printf "\e[0m")" \
		"LESS_TERMCAP_se=$(printf "\e[0m")" \
		"LESS_TERMCAP_so=$(printf "\e[1;44;33m")" \
		"LESS_TERMCAP_ue=$(printf "\e[0m")" \
		"LESS_TERMCAP_us=$(printf "\e[1;32m")" \
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
  # shellcheck disable=SC1091
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

# shellcheck disable=SC1090
if [[ -f "$HOME/.bash_aliases" ]]; then source "$HOME/.bash_aliases"; fi

# shellcheck disable=SC1090
if [[ -f "$HOME/.desktop_aliases" ]]; then source "$HOME/.desktop_aliases"; fi

########################################
# System-specific aliases

# enable color support of ls, etc
if [[ -x /usr/bin/dircolors ]]
then
  # shellcheck disable=SC2015
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

[[ $(command -v setxkbmap) ]] && setxkbmap -option caps:ctrl_modifier -option shift:both_capslock
alias xkb="setxkbmap -option caps:ctrl_modifier -option shift:both_capslock"

########################################
# setup top bar

if [[ -n "$(command -v gsettings)" ]]
then
  gsettings set org.gnome.desktop.interface clock-show-date true
  gsettings set org.gnome.desktop.interface clock-show-seconds true
  gsettings set org.gnome.desktop.interface clock-show-weekday true
fi

########################################
# setup nvm

# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
# shellcheck disable=SC1090
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
nvm use 14

########################################
# setup ssh & agent

if [[ -z "$SSH_AUTH_SOCK" ]]
then eval "$(ssh-agent -s)"
fi

if [[ -z "$(ssh-add -l)" ]]
then ssh-add "$HOME/.ssh/$(whoami)"
else ssh-add -l
fi

########################################
# Nix

if [[ -f '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]]
then bash /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi
