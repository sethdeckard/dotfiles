
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

eval "$(pyenv init -)"

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

source .bashrc
