# brew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-fonts
brew cask install font-meslo-lg-nerd-font

# meslolgmdz nerd font

brew install starship
brew install exa
brew install git
brew install macos-trash croc

# mv -S .jbak -b

# wget https://raw.githubusercontent.com/nathanbuchar/atom-one-dark-terminal/master/scheme/iterm/One%20Dark.itermcolors

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
zinit self-update

defaults write com.apple.Finder AppleShowAllFiles true
