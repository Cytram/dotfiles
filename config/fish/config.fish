set -g fish_user_paths "/usr/local/opt/python@3.8/bin" $fish_user_paths

eval "$(/opt/homebrew/bin/brew shellenv)"

set -x EDITOR nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias k="kubectl"
alias t="terraform"
