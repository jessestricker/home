# shellcheck shell=bash

case $- in
  *i*) ;;
  *) return ;;
esac

# Bash
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

PS1='\[\e[1;34m\]\w \[\e[39m\]\$ \[\e[m\]'

if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    # shellcheck source=/dev/null
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    # shellcheck source=/dev/null
    . /etc/bash_completion
  fi
fi

# ls
alias ls='ls --color=auto --classify --group-directories-first'
alias ll='ls --long --almost-all'

# home
# shellcheck source=/dev/null
source /usr/share/bash-completion/completions/git
__git_complete home __git_main

# Homebrew
if [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  homebrew_setup=$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  eval "$homebrew_setup"
  unset homebrew_setup

  for file in "${HOMEBREW_PREFIX:?}/etc/bash_completion.d/"*; do
    # shellcheck source=/dev/null
    source "$file"
  done
fi

# mkdir
alias md='mkdir --parents'
