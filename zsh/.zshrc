# general settings
autoload -Uz compinit
zmodload zsh/zprof
bindkey ' ' magic-space

# Sources
# DOT is set in .zshenv to allow setting ZDOTDIR
. $DOT/zsh/zsh_vars
. $DOT/zsh/zsh_aliases
. $HOME/.cargo/env

# Configure path
typeset -U PATH path
path=(
        "$PYENV_ROOT/shims"
        "$PYENV_ROOT/bin" 
        "/opt/local/bin"
        "/opt/local/bin"
        "$HOME/.poetry/bin"
        "$HOME/.cargo/bin"
        "$HOME/go/bin"
        "$HOME/.local/bin"
        $path
)
export PATH

# fzf bits
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pyenv
# eval "$(pyenv init --path)" manually inserted into paths
# Remaining evals handled as a lazy load function

# Starship
eval "$($HOME/.cargo/bin/starship init zsh)"

# Direnv
eval "$(direnv hook zsh)"

# Vim mode
bindkey -v

# Re-define necessary key bindings
bindkey -M viins "ç" fzf-cd-widget
bindkey -M viins "^r" fzf-history-widget
bindkey -M viins "^t" fzf-file-widget

# because you should be in a tmux session, and I'm lazy
# source $DOT/zsh/launch_tmux.zsh
