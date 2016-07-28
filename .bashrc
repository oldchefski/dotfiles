#.bashrc

# Test if prompt var is not set
if [ -z "$PS1" ]; then
    # Prompt var is not set, this is not an interactive shell
    return;
fi

# Dynamic resizing
shopt -s checkwinsize

# Custom prompt
tty -s && export PS1="\[\033[38;5;10m\][\[$(tput sgr0)\]\[\033[38;5;13m\]\u\[$(tput sgr0)\]\[\033[38;5;10m\]@\[$(tput sgr0)\]\[\033[38;5;13m\]\h\[$(tput sgr0)\]\[\033[38;5;10m\]]\[$(tput sgr0)\]\[\033[38;5;15m\]: \[$(tput sgr0)\]\[\033[38;5;11m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \\$ \[$(tput sgr0)\]"

# No Color Prompt
# tty -s && export PS1="\u@\h: \w \\$ \[$(tput sgr0)\]"

# start with tmux
if command -v tmux>/dev/null; then
    [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

# Add Color to grep
export GREP_OPTIONS='--color=auto'

# Add color
eval `dircolors -b`

## OS Aliases ##
alias cls='clear'
alias clls='clear; ls'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias lla='ls -alh'
alias lsa='ls -A'
alias lsg='ls | grep'
alias vi='vim'
alias diff='colordiff'
alias sysupdate='sudo apt-get update && sudo apt-get upgrade'
alias fucku='sudo $(history -p !!)'
alias canhaz='sudo apt-get install'
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'
alias nc='ncat'

## Expensify Aliases ##
alias gp='git push origin `git rev-parse --abbrev-ref HEAD | sed '\''s/master/DONT_PUSH_MASTER_IDIOT/'\''`'
alias nb='git checkout master && git pull origin master && git checkout -b'
alias sshsc='ssh -At -t bastion1.sc ssh -A'
alias sshla='ssh -At -t bastion1.la ssh -A'
alias sshlv='ssh -At -t bastion1.lv ssh -A'
alias sshbas='ssh bastion1.sc'
alias sshlog='sshtun log1.lv'
