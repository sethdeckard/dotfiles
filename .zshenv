# user scripts
export PATH=$PATH:$HOME/bin

# android
export PATH=$PATH:/Users/seth/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/seth/Library/Android/sdk/tools

# golang paths
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

# jenv
export PATH="$HOME/.jenv/bin:$PATH"

# homebrew
if [[ "$OSTYPE" == darwin* ]]; then
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH
  export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.config/homebrew/.api_token)
fi

export EDITOR="vim"
export VISUAL="mvim"

# gpg
export "GPG_TTY=$(tty)"

# dotfiles source directory
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

# CocoaPods
export COCOAPODS_DISABLE_STATS=true
