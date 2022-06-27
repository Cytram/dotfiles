#!/bin/zsh
baseDir=$(pwd)

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"

## Fancy view for kubectx
brew install fzf

brew install iterm2
brew install htop
brew install nload
brew install helm
brew install croc
brew install go
brew install node
brew install hashicorp/tap/terraform-ls
brew install watch
brew install tree
brew install kustomize
brew install python3
brew install openfortivpn


# Fish
brew install fish
echo "Add fish to /etc/shells"
grep -E "(fish)" /etc/shells || echo "/opt/homebrew/opt/fish/bin/fish" | sudo tee -a /etc/shells
chsh -s /opt/homebrew/opt/fish/bin/fish

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
 curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Insatll Plugins
vim +'PlugInstall --sync' +qa

python3 -m pip install pynvim --user
