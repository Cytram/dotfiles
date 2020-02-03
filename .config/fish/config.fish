eval (python -m virtualfish)

set -x EDITOR nvim
eval (pyenv init - | source)
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias k="kubectl"
alias t="terraform"
alias t11='/usr/local/opt/terraform@0.11/bin/terraform'
alias config='/usr/bin/git --git-dir=$HOME/code/dotfiles/ --work-tree=$HOME'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jesperpetersen/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/jesperpetersen/Downloads/google-cloud-sdk/path.fish.inc'; end
