# git
# relying on omzsh plugin for most of of these and overriding or extending here
# note: gitconfig includes some under git command (or just `g`, ex: `g br`).
alias gbm='git branch -mv'
alias gbuu='git branch --unset-upstream'
alias gcdf='git clean -d -f'
alias gsp='git show --patch'
alias gsur='git submodule update --recursive'
alias gswd='git switch --detach'
alias gtma='git tag -m -a'

# remove undesirable aliases and functions set by omz
unset -f ggf

# GitHuh (cli)
alias ghprcw='gh pr create --web'
