# convox
alias cx=convox
alias cxl='convox logs'
alias cxr='convox rack'

# git
# relying on omzsh plugin for most of of these and overriding or extending here
# note: gitconfig includes some under git command (or just `g`, ex: `g br`).
alias gbm='git branch -mv'
alias gcdf='git clean -d -f'
alias gsur='git submodule update --recursive'
alias gswd='git switch --detach'

# GitHuh (cli)
alias ghprcw='gh pr create --web'

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
alias vi=vim
alias vimm="vim -u $DOTFILES/.vimrc_min" # vim with minimal customization
