# 10ms for key sequences http://www.johnhawthorn.com/2012/09/vi-escape-delays/
KEYTIMEOUT=1

HYPHEN_INSENSITIVE="true"

# Path to your oh-my-zsh installation.
export ZSH=/Users/dfalling/.oh-my-zsh

ZSH_THEME="gentoo"

plugins=(git, npm)

# alias vim=nvim
alias vim=~/Applications/nvim-osx64/bin/nvim

source $ZSH/oh-my-zsh.sh

# zplug
ZPLUG_HOME="$( brew --prefix )"/opt/zplug
source $ZPLUG_HOME/init.zsh

# Syntax highlighting bundle.
zplug "zsh-users/zsh-syntax-highlighting"

# auto complete suggestions
zplug "zsh-users/zsh-autosuggestions"

# let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# enhancd - https://github.com/b4b4r07/enhancd
zplug 'b4b4r07/enhancd', use:init.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load > /dev/null

alias blink-red="blink1-tool --rgb FF0000 --blink 3"
alias blink-green="blink1-tool --rgb 00FF00 --blink 3"
alias blink-blue="blink1-tool --rgb 0000FF --blink 3"
alias alert="blink-green || blink-red"

alias success="osascript -e 'display notification \"Your CLI command completed successfully\" with title \"Success\"'"
alias fail="osascript -e 'display notification \"Your CLI command failed\" with title \"Error\"'"
alias notify="success || fail"

# enable vim mode for zsh (hit ESC to switch to normal mode)
bindkey -v

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/Users/dfalling/.scm_breeze/scm_breeze.sh" ] && source "/Users/dfalling/.scm_breeze/scm_breeze.sh"
