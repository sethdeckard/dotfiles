
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"

alias r=rails

export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin
export JAVA_HOME=/Library/JAVA/Home

source ~/.ec2/.cli_credentials

eval "$(pyenv init -)"

# added by travis gem
[ -f /Users/seth/.travis/travis.sh ] && source /Users/seth/.travis/travis.sh

export PATH=/usr/local/share/python:$PATH
