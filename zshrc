# DEPRECATE? I think this is longer needed.  testing for a bit to make sure
# 10ms for key sequences http://www.johnhawthorn.com/2012/09/vi-escape-delays/
# KEYTIMEOUT=1

HYPHEN_INSENSITIVE="true"

# zplug
ZPLUG_HOME="$( brew --prefix )"/opt/zplug
source $ZPLUG_HOME/init.zsh

# Syntax highlighting bundle - https://github.com/zsh-users/zsh-syntax-highlighting
zplug "zsh-users/zsh-syntax-highlighting"

# auto complete suggestions - https://github.com/zsh-users/zsh-autosuggestions
zplug "zsh-users/zsh-autosuggestions"

# let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# enhancd - https://github.com/b4b4r07/enhancd
zplug 'b4b4r07/enhancd', use:init.sh

# theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load > /dev/null

alias success="osascript -e 'display notification \"Your CLI command completed successfully\" with title \"Success\"'"
alias fail="osascript -e 'display notification \"Your CLI command failed\" with title \"Error\"'"
alias notify="success || fail"

# enable vim mode for zsh (hit ESC to switch to normal mode)
bindkey -v

# CTRL-SPACE to accept autosuggest
bindkey '^ ' autosuggest-accept

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/Users/dfalling/.scm_breeze/scm_breeze.sh" ] && source "/Users/dfalling/.scm_breeze/scm_breeze.sh"

# more git aliases in addition to scm breeze
alias gpsu="gps -u origin HEAD"
alias gfp="gps --force-with-lease"
alias s="git status"

eval "$(direnv hook zsh)"
