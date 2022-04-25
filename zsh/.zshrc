# Load completion paths
fpath=(
        $fpath
        "/opt/local/share/zsh/site-functions"
)

# Load and run compinit
autoload -Uz compinit
for dump in $ZDOTDIR/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Set options
_comp_options+=(globdots)
bindkey ' ' magic-space
setopt auto_cd auto_pushd pushd_ignore_dups pushd_silent \
        no_case_glob correct \
        share_history append_history hist_ignore_dups hist_reduce_blanks \
        inc_append_history hist_verify hist_ignore_space

# Configure path
# Load vars first for reference
# DOT is set in .zshenv to allow setting ZDOTDIR
# The typeset call prevents duplicates
. $DOT/zsh/zsh_vars
typeset -aU path
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

# Source aliases
. $DOT/zsh/zsh_aliases
. $HOME/.cargo/env

# fzf bits
[ -f /opt/local/share/fzf/shell/key-bindings.zsh ] &&
        source /opt/local/share/fzf/shell/key-bindings.zsh
[ -f /opt/local/share/fzf/shell/completion.zsh ] &&
        source /opt/local/share/fzf/shell/completion.zsh

# Pyenv
# eval "$(pyenv init --path)" manually inserted into paths
# Remaining evals handled as a lazy load function

# Starship
eval "$(starship init zsh)"

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

# Search through history based on already typed
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins "^[[A" up-line-or-beginning-search
bindkey -M viins "^[[B" down-line-or-beginning-search
