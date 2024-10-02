#
# general settings
#
export LANG=ja_JP.UTF-8

PROMPT='[%n@%m %c]$ '

# homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# auto completions and suggestions
if [ ! -e $(brew --prefix)/share/zsh-completions ]; then
    echo "\033[0;33m[Warning] zsh-completions is not installed.\033[0;39m"
fi

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    autoload -Uz compinit
    compinit
fi

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
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

# etc
alias myip="dig +short myip.opendns.com @resolver1.opendns.com"

#
# import local zshrc
#
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
