export PATH=/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin
# depot_tools for chromium
export PATH=$PATH:$HOME/Projects/chromium/depot_tools
# golang paths
export GOPATH=$HOME/Projects/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
# homebrew
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export EDITOR="vim"
export VISUAL="mvim"
export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.config/homebrew/.api_token)
export PYENV_ROOT=/usr/local/var/pyenv

DOTFILES=$HOME/.dotfiles

# zsh theme settings
DEFAULT_USER="seth"
POWERLEVEL9K_MODE="awesome-fontconfig"
POWERLEVEL9K_FOLDER_ICON=""
POWERLEVEL9K_HOME_SUB_ICON=""
POWERLEVEL9K_HOME_ICON=""
POWERLEVEL9K_APPLE_ICON=$'\u2C96'
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_VCS_HIDE_TAGS=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs rbenv)
