PATH=/usr/bin:/bin:/usr/sbin:/sbin:$HOME/bin
# depot_tools for chromium
PATH=$PATH:$HOME/Projects/chromium/depot_tools
# golang paths
GOPATH=$HOME/Projects/go
GOROOT=/usr/local/opt/go/libexec
PATH=$PATH:$GOPATH/bin:$GOROOT/bin
# /usr/local/bin first for homebrew
PATH=/usr/local/bin:/usr/local/sbin:$PATH
DEFAULT_USER="seth"
EDITOR="vim"
VISUAL="mvim"
DOTFILES=$HOME/.dotfiles
PYENV_ROOT=/usr/local/var/pyenv
SWIFTENV_ROOT=/usr/local/var/swiftenv
HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.config/homebrew/.api_token)
POWERLEVEL9K_MODE="nerdfont-fontconfig"
POWERLEVEL9K_FOLDER_ICON=$'\u2C96'
POWERLEVEL9K_HOME_SUB_ICON=$'\u2C96'
