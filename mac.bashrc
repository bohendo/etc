########################################
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files for examples

########################################
# Export Environment Variables

mkdir -p "$HOME/.npm-packages"

export SHELL="/opt/homebrew/bin/bash"

export BASH_SILENCE_DEPRECATION_WARNING=1

export GOPATH="$HOME/d/go"

export ETC_DIR="$HOME/Documents/bohendo/etc"

export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python3"
export WORKON_HOME="$HOME/.virtualenvs"

export NVIM_LOG_FILE="$HOME/.config/nvim/nvim.log"
export EDITOR="/opt/homebrew/bin/nvim"
export HISTTIMEFORMAT="%y%m%d %T "
export LESS="--raw-control-chars --quit-if-one-screen --no-init"
export NPM_PACKAGES="$HOME/.npm-packages"
export NVM_DIR="$HOME/.nvm"
export TERMINFO="/usr/share/terminfo"
unset  MANPATH  # I'd rather inherit defaults from /etc/manpage.conf

#export NIX_STORE_DIR=$HOME/nix/store
#export NIX_STATE_DIR=$HOME/nix/var/nix
#export NIX_LOG_DIR=$HOME/nix/var/log/nix

# Default PATH
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/munki"

# Custom PATH overrides
nix="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin"
golang="/usr/local/go/bin"
pyenv="$HOME/.pyenv"
coreutils="$(brew --prefix coreutils)/libexec/gnubin"
node14="$HOME/.nvm/versions/node/v14.19.1/bin"
foundry="$HOME/.foundry/bin"
local_bin="$HOME/.local/bin"
home_bin="$HOME/bin"
npm_packages="$HOME/.npm-packages/bin"
export PATH="$home_bin:$nix:$pyenv:$golang:$foundry:$npm_packages:$node14:$local_bin:$coreutils:$PATH"

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

########################################
# less

# make less more friendly for non-text input files, see lesspipe(1)
if [ -x /usr/bin/lesspipe ]
then eval "$(SHELL=/bin/sh lesspipe)"
fi

########################################
# Configure autocompletions

# shellcheck disable=SC1091
if [[ -f "$(brew --prefix)/etc/bash_completion" ]]; then source "$(brew --prefix)/etc/bash_completion"; fi

nvm_autocomplete="/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
# shellcheck disable=SC1090
if [[ -s "$nvm_autocomplete" ]]; then source "$nvm_autocomplete"; fi

git_autocomplete="$HOME/.git-completion.bash"
# shellcheck disable=SC1090
if [[ -s "$git_autocomplete" ]]; then source "$git_autocomplete"; fi

function _makefile_targets {
    local curr_arg;
    local targets;
    # Find makefile targets available in the current directory
    targets=''
    if [[ -e "$(pwd)/Makefile" ]]; then
        targets=$( \
            grep -oE '^[a-zA-Z0-9_-]+:' Makefile \
            | sed 's/://' \
            | tr '\n' ' ' \
        )
    fi
    # Filter targets based on user input to the bash completion
    curr_arg=${COMP_WORDS[COMP_CWORD]}
    # shellcheck disable=SC2207
    COMPREPLY=( $(compgen -W "${targets[@]}" -- "$curr_arg" ) );
}
complete -F _makefile_targets make

if [[ -n "$(which npm)" ]]
then
  npm_completion="/tmp/npm.completion"
  rm -f "$npm_completion"
  npm completion > "$npm_completion"
  # shellcheck disable=SC1091
  source /tmp/npm.completion
  rm -f "$npm_completion"
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

# shellcheck disable=SC1091
if [[ -f "$HOME/.bash_aliases" ]]; then source "$HOME/.bash_aliases"; fi

# shellcheck disable=SC1091
if [[ -f "$HOME/.mac_aliases" ]]; then source "$HOME/.mac_aliases"; fi

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

eval "$(gdircolors)"

########################################
# setup nvm

# This loads nvm
# shellcheck disable=SC1091
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" 
nvm use 16

########################################
# setup python virtual env

#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
#pyenv global 3.9.12
#pyenv virtualenvwrapper

########################################
# setup ruby env

#eval "$(rbenv init - bash)"
#export USE_FLIPPER=1

