#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias ic='vim ~/.config/i3/config'
alias m='sudo systemctl restart mullvad-daemon'

PS1='\u@\w: $ '
