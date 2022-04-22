# Load completion paths
fpath=(
        $fpath
        "/opt/local/share/zsh/site-functions"
)

# Load and run compinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Set options
_comp_options+=(globdots)
bindkey ' ' magic-space
setopt auto_cd auto_pushd pushd_ignore_dups pushd_silent \
        no_case_glob correct_all\
        share_history append_history hist_ignore_dups hist_reduce_blanks \
        inc_append_history hist_verify hist_ignore_space

# Configure path
# Load vars first for reference
# DOT is set in .zshenv to allow setting ZDOTDIR
# The typeset call prevents duplicates
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

# Source aliases
. $DOT/zsh/zsh_aliases
. $HOME/.cargo/env

# fzf bits
[ -f /opt/local/share/fzf/shell/key-bindings.zsh ] &&
        source /opt/local/share/fzf/shell/key-bindings.zsh

# Pyenv
# eval "$(pyenv init --path)" manually inserted into paths
# Remaining evals handled as a lazy load function

# Starship
eval "$(/opt/local/bin/starship init zsh)"

# Direnv
eval "$(direnv hook zsh)"

# Vim mode
bindkey -v

# Add visual line editing
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Re-define necessary key bindings
bindkey -M viins "ç" fzf-cd-widget
bindkey -M viins "^r" fzf-history-widget
bindkey -M viins "^t" fzf-file-widget
