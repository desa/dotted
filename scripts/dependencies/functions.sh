#!/bin/bash
# assets/dependencies/functions.sh

# This file contains functions and other dependencies that the main
# setup script will rely upon to do its work.

# Script VARS

# We're going to need to know the current user dir throughout this script
USERDIR="/Users/$USER"


# FUNCTIONS

# Check to see if the --force flag has been set
# and if so, make sure any call to confirm automatically
# returns "yes"
if [ "$1" = "--force" ]; then
  FORCE_CONFIRM=true
else
  FORCE_CONFIRM=false
fi

# Function gives the user an opportunity to confirm each installation
# action. This can be overridden with the --force flag
confirm() {
  if [ "$FORCE_CONFIRM" = true ]; then
    echo "yes"
  else
    local choice
    read -p "Continue (y/n): " -n 1 -r choice
    case "$choice" in 
      y|Y ) echo "yes";;
      n|N ) echo "no";;
      * )   echo "invalid";;
    esac
  fi
}

# Function that checks exit status of last command and prints a message
# to user about the status of the last install activity
installCompleted() {
  if [ "$1" == "0" ]; then
    echo "${2} install finished successfully."
  else
    echo "Something went wrong during the installation of ${2}." 1>&2
  fi
  echo
}

# Function reads from the dependency files, ignoring comments and empty lines
# Use by typing `fileToArray <fileToRead>`
# No need to type 'array/' into "fileToRead" as that is set automatically.
fileToArray() {
  # This function reads a file but ignores lines beginning with #, a newline or spaces
  local filepath="$DOTTED_ROOT/assets/" # Change the value of filepath to read files in a different dir

  # initializing local vars
  local line # stores current line in the read

  # indicate what characters (at the start of a line) should cause that line to be skipped
  local chars_to_ignore=("#" "\n" "[:space:]")
  # local chars_to_ignore="\#\n[:space:]" # I'm leaving this here for now in case the array version of the "chars" to ignore stops working for some reason

  while read line; do
    # Check to make sure a line doesn't begin with any of the characters in $chars_to_ignore
    if [[ "$line" =~ ^[^${chars_to_ignore[@]}] ]]; then 
      echo "$line"
    fi
  done < "${filepath}$1"

}




