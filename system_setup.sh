#!/bin/bash

# We'll need to know the current user dir
USERDIR="/Users/$USER"

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# These are terminal binaries to install
binaries=(
  graphicsmagick
  webkit2png
  rename
  zopfli
  ffmpeg
  python
  sshfs
  trash
  node
  tree
  ack
  hub
  git
)

echo "installing binaries..."
brew install ${binaries[@]}

# Now clean everything up
brew cleanup

# Now we get homebrew cask installed for OS X apps
echo "Installing homebrew cask..."
brew install caskroom/cask/brew-cask

# Apps
apps=(
  alfred
  dropbox
  google-chrome
  qlcolorcode
  screenflick
  slack
  transmit
  appcleaner
  firefox
  hazel
  qlmarkdown
  seil
  spotify
  vagrant
  arq
  flash
  qlprettypatch
  shiori
  sublime-text3
  virtualbox
  flux
  mailbox
  qlstephen
  sketch
  vlc
  nvalt
  quicklook-json
  skype
  google-drive
  utorrent
  kaleidoscope
  ksdiff
  firefox
)

# Install versions cask for beta versions of stuff
brew tap caskroom/versions

# Default is: /Users/$USER/Applications
# To install to /Applications, set --appdir=/Applications flag
echo "installing apps..."
brew cask install ${apps[@]}

# Symlink subl to the /usr/local/bin dir
echo "Linking 'subl' to /usr/local/bin..."
ln -sfv "~/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# Tapping the fonts cask so I can install fonts as needed
echo "Tapping caskroom/fonts..."
brew tap caskroom/fonts

# Now we actually install the fonts
# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

### Done with Homebrew
# -------------------------------------
# -------------------------------------
echo "We're done with Homebrew installations, now moving on to some other stuff."


# Let's alias some open commands to open files in my brosers
# First we'll have to create a new oh-my-zsh file to put these aliases in:

ZSH_ALIASES="$USERDIR/.oh-my-zsh/custom/zsh_aliases.zsh"

touch "$ZSH_ALIASES"

# Let's add a first line to the file
echo "# Additional Aliases to Use in zsh\n" >> "$ZSH_ALIASES"

 
# Now we'll add some aliases to that file
aliases=(
  "reld='. ~/.zshrc'" 
  "chrome='open -a \"Google Chrome\"'"
  "safari='open -a \"Safari\"'"
  "gti='git'"
  "got='git'"
  "gpo='git push origin \$(current_branch)'"
  "rr='rm -r'"
  "rrf='rm -rf'"
) 


# Now we run a loop to insert all of these into our new "aliases" file
for i in "${aliases[@]}"
do
  echo "Adding alias $i ..."
  echo "alias "$i >> "$ZSH_ALIASES"
done


# One more thing, let's create a custom "functions" file for oh-my-zsh
echo "Creating a custom zsh functions file..."
ZSH_FUNCS="$USERDIR/.oh-my-zsh/custom/zsh_functions.zsh"

# Create the file
touch "$ZSH_FUNCS"

# Now add a function that i like
cat <<-EOF >> "$ZSH_FUNCS"
	function MakeDirAndChange {
		echo "Creating directory $1"
		mkdir "$1"
		cd "$1"
	}
	alias mkcd='MakeDirAndChange'
EOF

LAST_COMMAND=$?
if [ "$LAST_COMMAND" -gt "0" ]; then
  echo "An error occurred while creating the zsh functions file."
else
  echo "zsh_functions.zsh created successfully!"
fi


# That's it! We're done (for now...)
echo "Done. Your system has been set up."
