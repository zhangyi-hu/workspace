alias py='python'
#set terminal color
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# git completion
source ~/.git-completion.bash

# bash prompt
source ~/.git-prompt.sh
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
PS1='\[\e[1;32m\]\u\[\e[m\]@\[\e[1;33m\]\h\[\e[1;34m\]:\w\[\e[1;31m\]$(__git_ps1)\n\[\e[1;37m\]\$ '
