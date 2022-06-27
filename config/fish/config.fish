set -g fish_user_paths "/usr/local/bin/python3" $fish_user_paths

set -e SSH_AGENT_PID
set -e SSH_ASKPASS
set -x SSH_AUTH_SOCK "$HOME/.gnupg/S.gpg-agent.ssh"

# Set GPG TTY
set -x GPG_TTY (tty)

nvm install 'lts/*'

set -x EDITOR nvim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias k="kubectl"
alias t="terraform"
