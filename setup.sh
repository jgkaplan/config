# brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-fonts
brew cask install font-meslo-lg-nerd-font

# meslolgmdz nerd font

brew install starship
brew install exa
brew install git
brew install macos-trash croc tldr
#quicklook plugins
brew install qlcolorcode qlstephen quicklook-json webpquicklook

# mv -S .jbak -b

# wget https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors

sh -c "$(curl -fsSL https://git.io/zinit-install)"
zinit self-update

defaults write com.apple.Finder AppleShowAllFiles true

cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
mkdir ~/.config
cp .config/starship.toml ~/.config/starship.toml
