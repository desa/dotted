# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Get the binaries to install from the 
# file where we keep them
# and store them in an array
binaries=($(fileToArray brew_binaries))

# Now it's time to actually do the install
echo "Installing binaries..."
brew install ${binaries[@]}

# Now clean everything up
brew cleanup