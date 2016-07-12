#!/bin/bash

export PS1='\w \$ '

# Git bash prompt
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
PS1='\[\033[01;34m\]\w\[\033[01;32m\]$([ \j -gt 0  ] && echo [\j])\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '

if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

alias ls='ls -G'
alias ll='ls -Gla'
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/Volumes/case-sensitive/esp-open-sdk/xtensa-lx106-elf/bin:$PATH"
export ESPPORT="/dev/tty.SLAB_USBtoUART"
