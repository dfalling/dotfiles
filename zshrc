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
export FZF_CTRL_T_OPTS=' --preview "bat --style=numbers --color=always --line-range :500 {}"'

[ -s "/Users/dfalling/.scm_breeze/scm_breeze.sh" ] && source "/Users/dfalling/.scm_breeze/scm_breeze.sh"

# more git aliases in addition to scm breeze
alias gpsu="git push -u origin HEAD"
alias gfp="git push --force-with-lease"
alias gcp="git checkout main && git pull"
alias grbc="git rebase --continue"
alias gmt="git mergetool"
alias gpr="git pull --rebase"
alias gdtm="git difftool master..."
alias gclean="git branch --merged main | grep -v "\* main" | xargs -n 1 git branch -d"

# Changes to top-level directory of git repository.
alias gtop="cd \$(git rev-parse --show-toplevel)"

# visual fzf-filterable viewer for git commit history
# https://gist.github.com/junegunn/f4fca918e937e6bf5bad
git-commit-show () 
{
  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
   fzf --ansi --no-sort --reverse --tiebreak=index --preview \
   'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
   --bind "j:down,k:up,alt-j:preview-down,alt-k:preview-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up,q:abort,ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:60%
}

# ls aliases
alias ls='ls -G'
alias ll='ls -lG'

alias vim=nvim

# some homebrew apps complain about locale without this...
# https://github.com/Homebrew/homebrew-core/issues/41139
export LC_ALL=en_US.UTF-8

# set bat theme to one that works well in light and dark schemes
export BAT_THEME="TwoDark"
export BAT_STYLE="numbers"

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

. /usr/local/opt/asdf/asdf.sh

if [ -e /Users/dfalling/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/dfalling/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
