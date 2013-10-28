#
# path
#
export MY_BIN_HOME=~/.bin
export PATH=$PATH:$MY_BIN_HOME

export ANDROID_HOME=/Applications/android-sdk-macosx/tools
export PATH=$PATH:$ANDROID_HOME

export PLAY_HOME=~/play
export PATH=$PATH:$PLAY_HOME

export MYSQL_HOME=/usr/local/mysql/bin
export PATH=$PATH:$MYSQL_HOME

export SCALA_HOME=~/scala/bin
export PATH=$PATH:$SCALA_HOME

export SBT_HOME=~/sbt/bin
export PATH=$PATH:$SBT_HOME

#
# general settings
#
export LANG=ja_JP.UTF-8

autoload -U compinit
compinit

PROMPT='[%n@%m %c]$ '

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY

# java encoding set UTF-8
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'


#
# alias
#

# ls command alias
alias ll='ls -lh'
alias la='ls -lha'
alias ls='ls -G'
