#!/bin/sh
baseDir=$(pwd)

## Fancy view for kubectx
brew install fzf

brew install htop
brew install nload
brew install helm
brew install go
brew install node
brew install hashicorp/tap/terraform-ls
brew install watch
brew install tree
brew install kustomize
brew install python3

# Fish
brew install fish
echo "Add fish to /etc/shells"
grep -E "(fish)" /etc/shells || echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

# Fish config
cp config/fish/config.fish ~/.config/fish/

# Functions
cp -r config/fish/functions/ ~/.config/fish/functions/

# Install oh-my-fish
curl -L https://github.com/oh-my-fish/oh-my-fish/raw/master/bin/install | fish

# Fishy things
./install-omf.sh

# Fonts
cd ..
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -fr fonts
cd $baseDir


### Neovim
brew install neovim

# Config
cp -r nvim $HOME/.config/
ln -s ~/.config/nvim/init.vim ~/.vimrc

# Plug manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.vim}"/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Insatll Plugins
vim +'PlugInstall --sync' +qa

python3 -m pip install pynvim --user
