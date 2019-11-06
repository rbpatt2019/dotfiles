if not functions -q fisher
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
        curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
        fish -c fisher
end

set -gx EDITOR (type -p vim)
set -gx BROWSER (type -p w3m)

set man_bold -o blue
set man_underline -u brred

set -gx PYENV_ROOT "$HOME/.pyenv"
status is-interactive; and pyenv init - | source
status is-interactive; and pyenv virtualenv-init - | source

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

set -gx GOPATH "$HOME/go"

set -gx R_USER "$HOME/R"
set -gx R_PROFILE "$HOME/R/.Rprofile"
set -gx R_LIBS "$HOME/R/library"

starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/rbpatt2019/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

