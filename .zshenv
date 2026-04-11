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
export BAT_CONFIG_PATH="$HOME/.config/bat/config"

# gpg
export "GPG_TTY=$(tty)"

# dotfiles source directory
DOTFILES=$HOME/.dotfiles
export TMUXINATOR_CONFIG="$DOTFILES/tmuxinator"

# eza: arasaka palette
export EZA_COLORS="di=#4da6ff:fi=#93a1ad:ex=#f7f779:ln=#35f2ff:or=#ff4d6d:lc=#35f2ff:xx=#35f2ff:ur=#f7f779:uw=#ff4d6d:ux=#35f2ff:gr=#f7f779:gw=#ff4d6d:gx=#35f2ff:tr=#f7f779:tw=#ff4d6d:tx=#35f2ff:da=#55606b:sn=#35f2ff:sb=#35f2ff:uu=#f7f779:un=#ff9f1c:gu=#f7f779:gn=#ff9f1c"

# fzf: arasaka palette
export FZF_DEFAULT_OPTS="--color=bg:#0a0f14,bg+:#131923,fg:#93a1ad,fg+:#f7f779,hl:#35f2ff,hl+:#35f2ff,info:#f7f779,prompt:#f7f779,pointer:#ff4d6d,marker:#ff9f1c,spinner:#35f2ff,header:#55606b,border:#55606b"

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
