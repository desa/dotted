#!/bin/bash
# Run this file as sudo with `sudo bash system_setup.sh`
# Alternatively, you can do:
# `sudo -v` then:
# `sudo bash system_setup.sh`




# Do homebrew stuff
echo "Preparing to install homebrew and binaries..."
if [ "$(confirm)" == "yes" ]; then
  # User confirmed installation, so we continue
  source "scripts/brew_setup.sh"
  
  # Check that the install went ok
  installCompleted "$?" "Homebrew"
else
  # User did not confirm install
  echo "Homebrew and binaries not installed"
  echo
fi


# Installing RVM
echo "Preparing to install RVM..."
if [ "$(confirm)" == "yes" ]; then
  curl -L https://get.rvm.io | bash -s stable

  # Check to make sure install completed successfully
  installCompleted "$?" "RVM" 
else
  echo "RVM not installed."
  echo
fi

# Installing Homebrew Cask Stuff
echo "Preparing to install homebrew cask and OS X applications..."
if [ "$(confirm)" == "yes" ]; then
  # User confirms
  source "scripts/cask_setup.sh"

  # Confirm that install was successful
  installCompleted "$?" "Cask"
else
  # User did not approve
  echo "Cask and applications not installed"
  echo
fi



# Now do some git setup
# First, let's ask the user what they want to do:

echo "Beginning setup of .gitconfig..."
if [[ $(confirm) == "yes" ]]; then
  echo "inside if"
  git config --global user.name "boichee" 
fi





