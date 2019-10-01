if not functions -q fisher
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
        curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
        fish -c fisher
end

set -gx EDITOR (type -p vim)
set -gx BROWSER (type -p w3m)

set SPACEFISH_PROMPT_ORDER  user jobs time exec_time line_sep pyenv dir git vi_mode char
set SPACEFISH_USER_SHOW 'always'
set SPACEFISH_USER_PREFIX ''
set SPACEFISH_USER_SUFFIX ''
set SPACEFISH_USER_COLOR blue
set SPACEFISH_JOBS_COLOR green
set SPACEFISH_JOBS_PREFIX ' with '
set SPACEFISH_JOBS_SUFFIX ' jobs'
set SPACEFISH_JOBS_SYMBOL ''
set SPACEFISH_JOBS_AMOUNT_THRESHOLD 0
set SPACEFISH_TIME_SHOW true
set SPACEFISH_TIME_PREFIX ' at '
set SPACEFISH_DATE_SHOW true
set SPACEFISH_TIME_COLOR bryellow
set SPACEFISH_EXEC_TIME_COLOR brmagenta
set SPACEFISH_EXEC_TIME_ELAPSED 0
set SPACEFISH_PYENV_COLOR brred
set SPACEFISH_PYENV_SYMBOL ''
set SPACEFISH_PYENV_PREFIX 'Py '
set SPACEFISH_DIR_TRUNC 0
set SPACEFISH_DIR_COLOR cyan
set SPACEFISH_GIT_BRANCH_COLOR yellow
set SPACEFISH_VI_MODE_PREFIX 'Mode:'
set SPACEFISH_VI_MODE_COLOR brcyan
set SPACEFISH_VI_MODE_INSERT ' I'
set SPACEFISH_VI_MODE_NORMAL ' N'
set SPACEFISH_VI_MODE_VISUAL ' V'
set SPACEFISH_VI_MODE_REPLACE_ONE ' R'
set SPACEFISH_CHAR_SYMBOL '>>>>'
set SPACEFISH_CHAR_COLOR_SUCCESS magenta
set SPACEFISH_CHAR_COLOR_FAILURE red
 
set man_bold -o blue
set man_underline -u brred

set -gx PYENV_ROOT "$HOME/.pyenv"
status is-interactive; and pyenv init - | source
status is-interactive; and pyenv virtualenv-init - | source

set -gx VIRTUAL_ENV_DISABLE_PROMPT 1

set -gx GOPATH "$HOME/go"

set -gx R_USER "$HOME/R"
set -gx R_PROFILE "$HOME/R/.Rprofile"
set -gx R_LIBS_USER "$HOME/R/library"
