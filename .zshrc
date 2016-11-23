# Created by newuser for 5.2

autoload -U compinit && compinit

###Настройка истории
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

umask 022
setopt autocd

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

#Загрузка алиасов
source ~/dotfiles/zsh/aliases.zsh

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


# export TERM='xterm-256color'
autoload -U colors && colors

setopt prompt_subst

if [[ $EUID == 0 ]]; then
    PROMPT='%{$fg[red]%}%~#%{$reset_color%} '
else
    PROMPT=' %{$fg[white]%}%~ 
 ✘%{$reset_color%} '
fi

RPROMPT='%{$fg[yellow]%}$(gprompt)%{$reset_color%} '
