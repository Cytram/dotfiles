#!/usr/local/bin/fish

# oh-my-fish agnoster theme
omf install agnoster

# install fisher
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# kubectl completion for fish shell
fisher install evanlucas/fish-kubectl-completions

# nvm
fisher install jorgebucaran/nvm.fish
