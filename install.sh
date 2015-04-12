#!/bin/bash
# dotted/install.sh
# Run this file as sudo like this: `sudo ./install.sh`
# Alternatively, you can do:
# `sudo -v` then:
# `sudo bash system_setup.sh`

# This helps us get our bearings so we can use file paths based on each script's location
DOTTED_ROOT="$(echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"




# Do homebrew stuff
echo "Preparing to install homebrew and binaries..."
if [ "$(confirm)" == "yes" ]; then
  # User confirmed installation, so we continue
  source "$DOTTED_ROOT/scripts/brew_setup.sh"
  
  # Check that the install went ok
  installCompleted "$?" "Homebrew"
else
  # User did not confirm install
  echo "User cancelled setup. Homebrew and binary packages not installed." 1>&2
  echo
fi


# Installing RVM
echo "Preparing to install RVM..."
if [ "$(confirm)" == "yes" ]; then
  curl -L https://get.rvm.io | bash -s stable

  # Check to make sure install completed successfully
  installCompleted "$?" "RVM" 
else
  echo "User cancelled setup of RVM. Not installed." 1>&2
  echo
fi

# Installing Homebrew Cask Stuff
echo "Preparing to install homebrew cask and OS X applications..."
if [ "$(confirm)" == "yes" ]; then
  # User confirms
  source "$DOTTED_ROOT/scripts/cask_setup.sh"

  # Confirm that install was successful
  installCompleted "$?" "Cask"
else
  # User did not approve
  echo "User cancelled. Cask and application packages not installed." 1>&2
  echo
fi



# Now do some git setup
echo "Preparing to setup git..."
if [[ "$(confirm)" == "yes" ]]; then
  # User has confirmed
  source "$DOTTED_ROOT/scripts/git_setup.sh"

  # Confirm that git setup was completed successfully
  installCompleted "$?" "git setup"
else 
  echo "User cancelled Git setup." 1>&2

fi


# Ok, finally, time to do some shell setup
echo "Preparing to setup your shell..."
if [[ "$(confirm)" == "yes" ]]; then
  # User has confirmed
  source "$DOTTED_ROOT/scripts/shell_setup.sh"

  # Confirm that git setup was completed successfully
  installCompleted "$?" "shell setup"
else 
  echo "User cancelled shell setup." 1>&2

fi



