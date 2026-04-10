# user scripts
export PATH=$PATH:$HOME/bin

# android
export PATH=$PATH:/Users/seth/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/seth/Library/Android/sdk/tools

# golang paths
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

# rust/cargo
[[ -f "$HOME/.cargo/env" ]] && . "$HOME/.cargo/env"

# homebrew GH token
if [[ "$OSTYPE" == darwin* ]]; then
  export HOMEBREW_GITHUB_API_TOKEN=$(cat ~/.config/homebrew/.api_token)
fi

export EDITOR="nvim"
export VISUAL="mvim"
export BAT_THEME="Solarized (dark)"

# gpg
export "GPG_TTY=$(tty)"

# dotfiles source directory
DOTFILES=$HOME/.dotfiles
export TMUXINATOR_CONFIG="$DOTFILES/tmuxinator"

# eza does not use LSCOLORS, has its own
# below fixes symlink arrows on solarized dark theme
export EZA_COLORS="lc=bright-cyan:xx=bright-cyan"

# CocoaPods
export COCOAPODS_DISABLE_STATS=true

# pyenv: install pythons as frameworks
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Fastlane
export FASTLANE_OPT_OUT_USAGE=true

# Machine-specific overrides
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
