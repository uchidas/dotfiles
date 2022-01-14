#
# path
#
export MY_BIN_HOME=$HOME/dotfiles/bin
export PATH=$PATH:$MY_BIN_HOME

#
# general settings
#
export LANG=ja_JP.UTF-8

if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

autoload -U compinit
compinit -u

PROMPT='[%n@%m %c]$ '

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

#
# alias
#

# vim
alias vi='vim'

# ls command alias
alias ll='ls -lh'
alias la='ls -lha'
alias ls='ls -G'

# import local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
