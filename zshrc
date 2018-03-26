# Created by newuser for 5.2

autoload -Uz compinit && compinit -i
umask 022
setopt autocd

###Настройка истории
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000


setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
setopt share_history
setopt append_history

function h(){
  if [[ -z "$1" ]]; then
    history  0 | tail -n 30
  else
    history 0 | grep "$*"
  fi
}

##Расширенный глобинг
setopt extended_glob

#Настройка разделителей
WORDCHARS=''@

stty stop undef
stty start undef

export EDITOR='vim'
export PAGER='vimpager'

##Загрузка алиасов
if [[ -f $HOME/.aliases ]]; then 
  source $HOME/.aliases
fi

alias ls='ls --color=auto'

##Цветной grep
export GREP_COLOR='1;33'

_comp_options+=(globdots) # completion for dotfiles

zstyle ':completion:*' menu select

#VIM стиль
bindkey -v

#Добавление правого PROMT с именем git brunch and git status 

function gprompt() {
  mes=`git symbolic-ref HEAD 2>/dev/null | cut -d / -f 3`
  durty=`git diff --shortstat 2> /dev/null | tail -n1`
  green=%{$fg[green]%}
  red=%{$fg[red]%}
  yellow=%{$fg[yellow]%}
  reset=%{$reset_color%}
  if [[ "$mes" != "" ]]; then 
    if [[ $durty != "" ]]; then
      echo "$red ($mes) $reset"
    else 
      echo "$yellow ($mes) $reset"
    fi
  fi
}

RPROMPT='$(gprompt) '

#PROMPT for user and root

if [[ $EUID == 0 ]]; then
  PROMPT=' %{$fg[red]%} (root) %{$fg[white]%}%~ 
  %{$fg[white]%}->%{$reset_color%} '
else
  PROMPT=' %{$fg[white]%}%~ 
  %{$fg[red]%}✘%{$reset_color%} '
fi
#✗
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


BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

fpath=(~/.zsh/completion $fpath)

# Hooks

autoload -U add-zsh-hook

function auto-ls-after-cd() {
  emulate -L zsh
  if [ "$ZSH_EVAL_CONTEXT" = "toplevel:shfunc" ]; then
    ls
    # ls --group-directories-first
  fi
}

add-zsh-hook chpwd auto-ls-after-cd

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function fzf-bookmarks-widget() {
  cd $(cat "$HOME/.config/bookmarks.cfg" | fzf --tiebreak=begin --tac | awk '{print $1}')
  zle reset-prompt
}


zle -N fzf-bookmarks-widget
bindkey '^o' fzf-bookmarks-widget

function fzf-history-widget() {
  LBUFFER=$(fc -lnr 1 | fzf --tiebreak=begin)
  zle redisplay
}

zle -N fzf-history-widget
bindkey '^R' fzf-history-widget
