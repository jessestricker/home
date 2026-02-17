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
        . /usr/share/bash-completion/bash_completion
    elif [[ -f /etc/bash_completion ]]; then
        . /etc/bash_completion
    fi
fi

# ls
alias ls='ls --color=auto --classify --group-directories-first'
alias ll='ls --long --almost-all'

# mkdir
alias md='mkdir --parents'
