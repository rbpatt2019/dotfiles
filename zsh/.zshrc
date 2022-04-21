# general settings
autoload -Uz compinit
zmodload zsh/zprof
bindkey ' ' magic-space
setopt auto_cd auto_pushd pushd_ignore_dups pushd_silent \
        no_case_glob correct_all\
        share_history append_history hist_ignore_dups hist_reduce_blanks \
        inc_append_history hist_verify hist_ignore_space

# Configure path
. $DOT/zsh/zsh_vars
typeset -U PATH path
path=(
        "$PYENV_ROOT/shims"
        "$PYENV_ROOT/bin" 
        "/opt/local/bin"
        "$HOME/.poetry/bin"
        "$HOME/.cargo/bin"
        "$HOME/go/bin"
        "$HOME/.local/bin"
        $path
)
export PATH

# Sources
# DOT is set in .zshenv to allow setting ZDOTDIR
. $DOT/zsh/zsh_aliases
. $HOME/.cargo/env

# fzf bits
[ -f /opt/local/share/fzf/shell/key-bindings.zsh ] && source /opt/local/share/fzf/shell/key-bindings.zsh

# Pyenv
# eval "$(pyenv init --path)" manually inserted into paths
# Remaining evals handled as a lazy load function

# Starship
eval "$(/opt/local/bin/starship init zsh)"

# Direnv
eval "$(direnv hook zsh)"

# Vim mode
bindkey -v

# Re-define necessary key bindings
bindkey -M viins "ç" fzf-cd-widget
bindkey -M viins "^r" fzf-history-widget
bindkey -M viins "^t" fzf-file-widget
