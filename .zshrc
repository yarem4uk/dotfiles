# Created by newuser for 5.2

autoload -U compinit && compinit

###Настройка истории
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

##Расширенный глобинг
setopt extended_glob

#Настройка разделителей
WORDCHARS=''@

stty stop undef
stty start undef
export EDITOR='vim'
export PAGER='less'

###Алиасы
alias q='exit'
alias й='exit'
alias h='history'

alias cdd='cd ~/Downloads/'

alias cdn='cd ~/geekbrains/node/'
alias cdp='cd ~/hexlet/php/'
alias cds='cd ~/hexlet/php/sikp/'
alias cdf='cd ~/hexlet/php/function/'
alias cdo='cd ~/hexlet/php/oop/'
alias cda='cd ~/hexlet/php/algorithms/'

alias cdb='cd ~/Dropbox/'
alias cdh='cd /srv/http/'

alias jj='cd -'
alias gg='cd ~'
alias hh="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."


alias ping='ping -c3 ya.ru'
alias p='python'
alias subl='subl3'
alias ss='sudo subl3'
alias sz='subl3 .zshrc'
alias t='touch'
alias x='chmod +x'
alias n='node'
alias tm='tmux'




alias ls='ls --color=auto --group-directories-first'
alias grep='grep -w --color'
alias la='ls -A'
alias ll='ls -l'
alias ld='ls -d .*'

alias install='yaourt -Sy --noconfirm'
alias pacman='sudo pacman'
alias uninstall='pacman -Rns'

##Apache
alias start='sudo systemctl start httpd.service'
alias restart='sudo systemctl restart httpd.service'
alias stop='sudo systemctl stop httpd.service'

## Node
alias npm='sudo npm'


alias -g W='|wc -w'
alias -g G='|grep -w --color'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'

alias -g HL="--help"
alias -g N='2>/dev/null'

##Цветной grep
export GREP_COLOR='1;33'

_comp_options+=(globdots) # completion fot dotfiles

zstyle ':completion:*' menu select

#VIM стиль
#####################################################
#Стиль vi or emacs 
bindkey -v
#bindkey -e

export KEYTIMEOUT=1
#Недостающие команды vim
bindkey -a u undo

#Добавление правого PROMT с именем git brunch
gprompt(){
    mes=`git symbolic-ref HEAD 2>/dev/null | cut -d / -f 3`
    if [ "$mes" != "" ]; then 
        # echo "$mes"; 
        echo "($mes)"; 
    fi
    # echo $mes
}


#Поиск по истории клавишами j и k в стиле vim 
bindkey '^j'  history-beginning-search-backward
bindkey '^k'  history-beginning-search-forward
#####################################################
#Поиск по истории клавишами up down
# bindkey "^[[A"  history-beginning-search-backward
# bindkey "^[[B"  history-beginning-search-forward


insert-double-roundbrackets() {
    LBUFFER="${LBUFFER}("
    RBUFFER=")${RBUFFER}"
}

zle -N insert-double-roundbrackets
bindkey '(' insert-double-roundbrackets


export TERM='xterm-256color'
autoload -U colors && colors

setopt prompt_subst

if [[ $EUID == 0 ]]; then
    PROMPT='%{$fg[red]%}%~#%{$reset_color%} '
else
    PROMPT=' %{$fg[white]%}%~ 
 ✘%{$reset_color%} '
fi

RPROMPT='%{$fg[yellow]%}$(gprompt)%{$reset_color%} '

setxkbmap -option 'ctrl:nocaps'
