# general settings
bindkey ' ' magic-space
DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# Sources
# DOT is set in .zshenv to allow setting ZDOTDIR
. $DOT/zsh/zsh_vars
. $DOT/zsh/zsh_aliases
. $HOME/.cargo/env

# Configure path
typeset -U PATH path
path=(
        "$PYENV_ROOT/bin" 
        "/opt/local/bin"
        "/opt/local/bin"
        "$HOME/.poetry/bin"
        "$HOME/.cargo/bin"
        "$HOME/go/bin"
        $path
        "$HOME/.local/bin"
)
export PATH

# fzf bits
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv global 3.10.2

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
source $DOT/zsh/launch_tmux.zsh
