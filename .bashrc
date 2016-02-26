#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


export PS1="\[\033[38;5;2m\]\w\\$\[$(tput sgr0)\]"

alias ls='ls --color=auto'
# alias inst='pacman -S'


alias e='exit'
alias у='exit'
alias h='history'
alias p='python'

alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

alias cd~='cd ~'
alias cd-='cd -'