# Created by newuser for 5.2

autoload -Uz compinit && compinit -i

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
setopt share_history
setopt append_history

##Расширенный глобинг
setopt extended_glob

#Настройка разделителей
WORDCHARS=''@

stty stop undef
stty start undef

export EDITOR='vim'
export PAGER='vimpager'

# #Загрузка алиасов

if [[ -f $HOME/.aliases ]]; then 
    source $HOME/.aliases
fi

alias ls='ls --color=auto'
#
##Цветной grep
export GREP_COLOR='1;33'

_comp_options+=(globdots) # completion fot dotfiles

zstyle ':completion:*' menu select

#VIM стиль
bindkey -v

#Добавление правого PROMT с именем git brunch
gprompt(){
    mes=`git symbolic-ref HEAD 2>/dev/null | cut -d / -f 3`
    if [ "$mes" != "" ]; then 
        # echo "$mes"; 
        echo "($mes)"; 
    fi
    # echo $mes
}

#Поиск по истории клавишами p и n в стиле vim 
bindkey '^p'  history-beginning-search-backward
bindkey '^n'  history-beginning-search-forward


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
    PROMPT=' %{$fg[red]%} (root) %{$fg[white]%}%~ 
 %{$fg[white]%}->%{$reset_color%} '
else
    PROMPT=' %{$fg[white]%}%~ 
 %{$fg[red]%}✘%{$reset_color%} '
fi

if [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]]; then
    RPROMPT='%{$fg[red]%}$(gprompt)%{$reset_color%} '
else 
    RPROMPT='%{$fg[yellow]%}$(gprompt)%{$reset_color%} '
fi
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

fpath=(~/.zsh/completion $fpath)
