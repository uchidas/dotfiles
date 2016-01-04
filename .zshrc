#
# path
#
export MY_BIN_HOME=$HOME/dotfiles/bin
export PATH=$PATH:$MY_BIN_HOME

#
# general settings
#
export LANG=ja_JP.UTF-8

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

# java encoding set UTF-8
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# git
alias gitlog='git log --graph'

# ls command alias
alias ll='ls -lh'
alias la='ls -lha'
alias ls='ls -G'

# pandoc
alias pandoc='pandoc -s'

# import local zshrc
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

export NVM_DIR="/Users/uchidas/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
