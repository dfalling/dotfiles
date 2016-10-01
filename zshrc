# 10ms for key sequences http://www.johnhawthorn.com/2012/09/vi-escape-delays/
KEYTIMEOUT=1

HYPHEN_INSENSITIVE="true"

# currently overridden by antigen
ZSH_THEME="gentoo"

plugins=(git, npm)

alias vim=nvim

source $ZSH/oh-my-zsh.sh

# zplug
source ~/Dropbox/Env/.zplug/init.zsh

# Syntax highlighting bundle.
zplug "zsh-users/zsh-syntax-highlighting"

# auto complete suggestions
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

alias blink-red="blink1-tool --rgb FF0000 --blink 3"
alias blink-green="blink1-tool --rgb 00FF00 --blink 3"
alias blink-blue="blink1-tool --rgb 0000FF --blink 3"
alias alert="blink-green || blink-red"

alias success="osascript -e 'display notification \"Your CLI command completed successfully\" with title \"Success\"'"
alias fail="osascript -e 'display notification \"Your CLI command failed\" with title \"Error\"'"
alias notify="success || fail"

# enable vim mode for zsh (hit ESC to switch to normal mode)
bindkey -v
