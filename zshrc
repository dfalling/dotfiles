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

# bd to cd up directories https://github.com/Tarrasch/zsh-bd
zplug 'Tarrasch/zsh-bd'

# theme
zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Install any plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load > /dev/null

# enable vim mode for zsh (hit ESC to switch to normal mode)
bindkey -v

# CTRL-SPACE to accept autosuggest
bindkey '^ ' autosuggest-accept

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_DEFAULT_OPTS='--height 96% --reverse'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS=' --preview "cat {}"'

[ -s "/Users/dfalling/.scm_breeze/scm_breeze.sh" ] && source "/Users/dfalling/.scm_breeze/scm_breeze.sh"

# more git aliases in addition to scm breeze
alias gpsu="git push -u origin HEAD"
alias gfp="git push --force-with-lease"
alias gcp="git checkout master && git pull"
alias grbc="git rebase --continue"
alias gmt="git mergetool"
alias gpr="git pull --rebase"

# Changes to top-level directory of git repository.
alias gtop="cd \$(git rev-parse --show-toplevel)"

# ls aliases
alias ls='ls -G'
alias ll='ls -lG'

alias vim=nvim

# some homebrew apps complain about locale without this...
# https://github.com/Homebrew/homebrew-core/issues/41139
export LC_ALL=en_US.UTF-8

##############################################################################
# History Configuration
##############################################################################
HISTSIZE=5000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=5000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

eval "$(direnv hook zsh)"
