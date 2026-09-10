# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


if [ $(id -u) -ne 0 ]; then
  PS1='[\w] $ ' 
else 
  PS1='[\w] root $ ' 
fi


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

export EDITOR=nvim

mkcd() { mkdir -p $1 && cd $1; }

export PATH="$PATH:$HOME/dart-sdk/bin"
export PATH="$PATH:$HOME/Scripts"

PATH="/home/mason/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/mason/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/mason/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/mason/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/mason/perl5"; export PERL_MM_OPT;
. "/home/mason/.deno/env"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
    else
        export PATH="/usr/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

