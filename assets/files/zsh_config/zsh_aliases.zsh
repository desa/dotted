# ~/.oh-my-zsh/custom/zsh_aliases.zsh
# Last modified: 4/11/15, Author: Brett Levenson
# Description:
# This file is used to define custom aliases that I want in my configuration

# I'll need to remove some oh-my-zsh built-in aliases before setting my own
unalias gcm

# Custom git aliases
alias gs='git st'
alias gsl='git status'
alias gpo='git push origin'
alias go='git checkout'
alias gom='git checkout master'
alias gob='git checkout -b'
alias gcm='git commit -m'
alias gu='git push'
alias guu='git push origin $(current_branch)'

# Simple Tasks
alias reld='. ~/.zshrc'

# Productivity Aliases
alias chrome='open -a "Google Chrome"'

# Helpful for quickly viewing files
alias hd='head -n 10'

# Aliases so certain GNU coreutils override their BSD counterparts
alias ls='gls --color=auto'
alias -s ls='gls'
alias -g tar='gtar'


# Aliases for some custom utilities I have installed
alias th='trash'
alias rn='rename'


