# -----------------------------
# Настройка Prompt 
# -----------------------------

# colors
export TERM='xterm-256color'
autoload -U colors && colors

if [[ $EUID == 0 ]]; then
    PROMPT="%{$fg[cyan]%}%~#%{$reset_color%} "
else
    PROMPT="%{$fg[cyan]%}%~$%{$reset_color%} "
fi

#PROMPT='%!'


# -----------------------------
# Misc
# -----------------------------

# zsh
setopt auto_cd

setopt extended_glob

setopt interactive_comments

# better word separators (ctrl-w will become much more useful)
WORDCHARS=''

# editor
export EDITOR="nano"
export BROWSER="firefox"

# grep colors
# export GREP_COLORS="mt=33"
# export GREP_OPTIONS='--color=auto'

# disable speaker
unsetopt beep

# -----------------------------
# НАСТРОЙКА ИСТОРИИ
# -----------------------------

HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
DIRSTACKSIZE=100

setopt extended_history

setopt inc_append_history
setopt share_history

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks


# -----------------------------
# Completion
# -----------------------------

# Enable zsh auto-completion
autoload -U compinit && compinit

_comp_options+=(globdots) # completion fot dotfiles

zstyle ':completion:*' menu select


# -----------------------------
# НАВИГАЦИЯ
# -----------------------------

#Стиль emacs 
bindkey -e

#Клавиша delete 
bindkey "\e[3~" delete-char

#Клавиши home end
bindkey '^[OH'  beginning-of-line 
bindkey '^[OF'  end-of-line       

#Поиск по подстроке в истории
bindkey '^[[A'  history-beginning-search-backward
bindkey '^[[B'  history-beginning-search-forward

#Control + Right/Left перемещает курсор начало или конец слова
bindkey '^[[1;5D'   backward-word
bindkey '^[[1;5C'   forward-word

#Control + Backspace удаляет предидущее слово
#Control + Delete удаляет слово от курсора до конца слова
bindkey "^[[3;5~" delete-word
bindkey "^?" backward-kill-word

#Control + Shift + Delete удаляет строку от курсора и до конца
bindkey '^[[3;6~' kill-line
#bindkey '^?' backward-kill-line




# -----------------------------
# Aliases
# -----------------------------

alias e='exit'
alias у='exit'
alias h="history"
alias р="history"
alias ifc="ifconfig"
alias r="reboot"

alias ping="ping -c3 ya.ru"
alias subl="subl3"
alias ss="sudo subl3"
alias sz="subl3 ~/.zshrc"
alias x="chmod +x"
alias m="mh.sh"
alias mj="mh.sh j"
alias t="touch"


alias p="python"
alias з="python"

## Pacman и Yaourt
alias install='yaourt -S'


alias ls='ls --color=auto'
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ll='ls -alF'
alias la='ls -A'
alias ды='ls -A'
alias l='ls -CF'

#Список файлов начинающихся с "."
alias ld='ls -d .*'
 
alias cd-="cd -"
alias cd~="cd ~"
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

alias cdd="cd ~/downloads"
alias tmp="cd ~/tmp"

alias cdb="cd ~/Dropbox"
alias cdl="cd ~/Dropbox/linux"
alias cdh="cd ~/Dropbox/gb/html"
alias cdj="cd ~/Dropbox/gb/js"
alias cdp="cd ~/Dropbox/gb/ptn"

alias cdlp="cd /opt/lampp/htdocs"

alias cdt="cd /media/alex/Transcend"
alias cdf="cd /media/alex/HACK"

alias -g W='|wc -w'
alias -g G='|grep -w'
alias -g L='|less'
alias -g H='|head'
alias -g T='|tail'

alias -g HL="--help"
alias -g N='2>/dev/null'


k=1
while [[ $k -le 8 ]]    
 do
    alias cdj$k="cd ~/Dropbox/gb/js/task$k"
    ((k++))
done

p=1
while [[ $p -le 8 ]]    
 do
    alias cdp$p="cd ~/Dropbox/gb/ptn/task$p"
    ((p++))
done


#Калькулятор
autoload zcalc


#МОИ ФУНКЦИИ

#работа с архивами
#Распаковка архивов функцией unpac
unpac() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2) tar xvjf $1   ;;
      *.tar.gz)  tar xvzf $1   ;;
      *.tar.xz)  tar xvfJ $1   ;;
      *.bz2)     bunzip2 $1    ;;
      *.rar)     unrar x $1    ;;
      *.gz)      gunzip $1     ;;
      *.tar)     tar xvf $1    ;;
      *.tbz2)    tar xvjf $1   ;;
      *.tgz)     tar xvzf $1   ;;
      *.zip)     unzip $1      ;;
      *.Z)       uncompress $1 ;;
      *.7z)      7z x $1       ;;
      *)         echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#Содание директории и переход в нее
mcd() {mkdir $1; cd $1}

ccd() {cd && ls} 

# переименовывает файлы из аргументов, добавляя к имени суффикс ".old"
old() {
    for f in $@;
    do
        test -e "$f" && mv "$f" "$f.old"
    done
}

insert-double-roundbrackets() {
    LBUFFER="${LBUFFER}("
    RBUFFER=")${RBUFFER}"
}

zle -N insert-double-roundbrackets
bindkey '(' insert-double-roundbrackets