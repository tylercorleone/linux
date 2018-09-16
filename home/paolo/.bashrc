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


# non funzia... ma ho creato lo script "calc"
#alias bc='echo "scale=3;" | bc'

# history auto completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# La mia memoria...
function hist {
    history | grep -i "${1}"
}
