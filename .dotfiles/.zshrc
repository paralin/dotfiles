export PATH=/usr/local/bin:$PATH

export EDITOR='vim'
export GIT_EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"
alias spaste="curl -F 'sprunge=<-' http://sprunge.us"
alias rec="byzanz-record-window"
alias g="gdb -tui"

#full terminal colors
export TERM="xterm-256color"

function _update_ps1()
{
  export PROMPT="$(~/.powerline-zsh.py $?)"
}

precmd()
{
  _update_ps1
}

source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle gitignore
antigen bundle lein
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle web-search
antigen bundle common-aliases
antigen bundle encode64
antigen bundle tmux

antigen apply

unalias rm

alias irc="TERM=screen-256color screen irssi"

alias openprivate="ecryptfs-mount-private"
alias closeprivate="ecryptfs-umount-private"

alias dokku="ssh dokku "
alias fpl="ssh fpl "

export PATH="$PATH:$HOME/.powerline/scripts"
