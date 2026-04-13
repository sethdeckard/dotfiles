# user scripts
export PATH=$PATH:$HOME/bin

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
export VISUAL="nvim"
export BAT_CONFIG_PATH="$HOME/.config/bat/config"

# gpg
export "GPG_TTY=$(tty)"

# dotfiles source directory
DOTFILES=$HOME/.dotfiles
export TMUXINATOR_CONFIG="$DOTFILES/tmuxinator"

# eza: arasaka palette
export EZA_COLORS="\
di=38;2;77;166;255:fi=38;2;147;161;173:ex=38;2;247;247;121:ln=38;2;53;242;255:or=38;2;255;77;109:pi=38;2;255;159;28:so=38;2;53;242;255:bd=38;2;255;159;28:cd=38;2;255;159;28:sp=38;2;255;159;28:mp=38;2;247;247;121:\
ur=38;2;247;247;121:uw=38;2;255;77;109:ux=38;2;53;242;255:ue=38;2;53;242;255:gr=38;2;247;247;121:gw=38;2;255;77;109:gx=38;2;53;242;255:tr=38;2;247;247;121:tw=38;2;255;77;109:tx=38;2;53;242;255:su=38;2;255;77;109:sf=38;2;255;77;109:xa=38;2;255;159;28:oc=38;2;85;96;107:ff=38;2;85;96;107:\
sn=38;2;53;242;255:sb=38;2;53;242;255:df=38;2;255;159;28:ds=38;2;255;159;28:uu=38;2;247;247;121:uR=38;2;255;77;109:un=38;2;255;159;28:gu=38;2;247;247;121:gR=38;2;255;77;109:gn=38;2;255;159;28:lc=38;2;53;242;255:lm=38;2;53;242;255:\
ga=38;2;53;242;255:gm=38;2;247;247;121:gd=38;2;255;77;109:gv=38;2;255;159;28:gt=38;2;77;166;255:gi=38;2;85;96;107:gc=38;2;255;77;109:Gm=38;2;247;247;121:Go=38;2;53;242;255:Gc=38;2;53;242;255:Gd=38;2;255;77;109:\
xx=38;2;85;96;107:da=38;2;85;96;107:in=38;2;85;96;107:bl=38;2;85;96;107:hd=38;2;247;247;121:lp=38;2;53;242;255:cc=38;2;255;77;109:bO=38;2;255;77;109:Sn=38;2;85;96;107:Su=38;2;247;247;121:Sr=38;2;255;159;28:St=38;2;53;242;255:Sl=38;2;77;166;255:\
im=38;2;53;242;255:vi=38;2;77;166;255:mu=38;2;53;242;255:lo=38;2;53;242;255:cr=38;2;255;77;109:do=38;2;247;247;121:co=38;2;255;77;109:tm=38;2;85;96;107:cm=38;2;255;159;28:bu=38;2;247;247;121:sc=38;2;53;242;255:ic=38;2;53;242;255"

# fzf: arasaka palette
export FZF_DEFAULT_OPTS=" \
  --color=bg:#0a0f14,bg+:#131923,fg:#93a1ad,fg+:#f7f779,hl:#35f2ff,hl+:#35f2ff \
  --color=info:#f7f779,prompt:#f7f779,pointer:#ff4d6d,marker:#ff9f1c,spinner:#35f2ff \
  --color=header:#55606b,border:#55606b,separator:#55606b,scrollbar:#55606b \
  --color=label:#f7f779,query:#93a1ad \
  --layout=reverse \
  --border=rounded \
  --border-label=' SCAN ' \
  --border-label-pos=3 \
  --prompt='// ' \
  --pointer='▸' \
  --marker='◆' \
  --separator='─' \
  --scrollbar='│' \
  --preview-window='right,50%,border-left' \
  --info=inline-right"

# CocoaPods
export COCOAPODS_DISABLE_STATS=true

# pyenv: install pythons as frameworks
export PYENV_ROOT="$HOME/.pyenv"
if [ -d "$PYENV_ROOT" ]; then
  export PYTHON_CONFIGURE_OPTS="--enable-framework"
  export PATH="$PYENV_ROOT/bin:$PATH"
fi

# Machine-specific overrides
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
