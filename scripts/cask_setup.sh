# Now we get homebrew cask installed for OS X apps
echo "Installing homebrew cask..."
brew install caskroom/cask/brew-cask

# Apps
apps=($(fileToArray cask_apps))

# Install versions cask for beta versions of stuff
brew tap caskroom/versions

# Install Homebrew Cask apps
# Default is: /Users/$USER/Applications
# To install to /Applications, set --appdir=/Applications flag
echo "installing apps..."
brew cask install ${apps[@]}


# Tapping the fonts cask so I can install fonts as needed
echo "Tapping caskroom/fonts..."
brew tap caskroom/fonts

# Get the fonts to install
fonts=($(fileToArray cask_fonts))

# install Homebrew Cask fonts
echo "Installing fonts..."
brew cask install ${fonts[@]}