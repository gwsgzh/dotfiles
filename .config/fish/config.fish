if status is-interactive
# Commands to run in interactive sessions can go here
end

set -U fish_greeting ""

fish_add_path ~/Scripts
fish_add_path ~/dark-sdk/bin

alias v='nvim'
alias sv='sudo -E -s nvim'
alias q='exit'
alias p='xclip -o'
alias quit='exit'
alias cx='chmod +x'
alias gcp='git clone $(xclip -o)'
alias b='nautilus .'
alias br='nautilus admin:/.'
alias c='clear'
