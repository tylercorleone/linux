#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

. "/home/paolo/script/addpath" -a "/home/paolo/script"

# fancy prompt and output
SADFACE_ONERROR='$(if [[ $? != 0 ]]; then echo "\[\033[01;31m\];( "; fi)'
#PS1=${SADFACE_ONERROR}'\e[0m\[\e[1m\][\[\e[1;32m\]\u\[\e[0m\]\[\e[1m\] \w]\$ '
trap 'printf "\e[2m"' DEBUG
PS1=${SADFACE_ONERROR}'\[\e[0m\][\[\e[1;32m\]\u\[\e[0m\] \w]\$ '

# to stop logging of repeated identical commands
export HISTCONTROL=ignoredups

# english language locale
export LANG=en_US.UTF-8

# history auto completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# La mia memoria...
function hist {
    history | grep -i "${1}"
}

alias 'ps-rss'='ps -eo ppid,pid,pcpu,rss,args --sort rss'
alias 'ps-cpu'='ps -eo ppid,pid,pcpu,rss,args --sort pcpu'

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

####################
#  COLORED OUTPUT  #
####################

alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
# less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

