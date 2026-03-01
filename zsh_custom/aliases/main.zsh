# use plain bat for upgraded cat
alias cat="bat --plain"

# eza: modern ls replacement
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -l --git --icons'
  alias la='eza -la --git --icons'
  alias lt='eza --tree --level=2 --icons'
fi

# k8s
alias kb=kubectl
alias kbaa='kubectl apply -f ./'
alias kbgs='kubectl get service'

# macOS specific
alias app-loader="open /Applications/Xcode.app/Contents/Applications/Application\ Loader.app"
alias update-macos='sudo softwareupdate --install --all --restart --force --agree-to-license'

# misc
alias more=less
alias pwdgen='openssl rand -base64 32'

# tmux
alias mux='tmuxinator'
alias txk='tmux kill-session'
alias txl='tmux list-sessions'
alias txw='tmux list-windows'

# vim
alias vi=nvim
alias vimm="vim -u $DOTFILES/.vimrc_min" # vim with minimal customization

# xcode
alias xdd='rm -rf ~/Library/Developer/Xcode/DerivedData && echo "Derived data deleted"'
