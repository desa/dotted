# dotted/scripts/shell_setup.sh
# Last modified: 4/11/15, by Brett Levenson
# Description:
# Trigger point for setting up either bash or zsh
#

# First, we're going to put some global configuration files in the home directory, these files
# will provide environment vars, functions and aliases no matter what shell you use
global_env_files=("shell_configuration" "shell_aliases" "shell_functions" "shell_variables") # Add or remove names from this dir to change what gets copied
for file in "${global_env_files[@]}"; do
  if [ ! -f "$HOME/.${file}" ]; then
    cp "${DOTTED_ROOT}/assets/shell_config/${file}" "$HOME/.${file}"
  fi
done


# Now we get into the setup of specific shell types

# BASH setup
if [ "$(confirm 'Would you like to setup bash?')" == "yes" ]; then
  # User wants to setup bash, so do that
  source $DOTTED_ROOT/scripts/shells/bash_shell_setup.bash
fi


# ZSH setup
if [ "$(confirm 'Would you like to setup zsh?')" == "yes" ]; then
  # User wants to proceed with zsh setup, so do that
  source $DOTTED_ROOT/scripts/shells/zsh_shell_setup.zsh
fi


# We want to set up a token Homebrew to use on GitHub.
# First, let's check if one already exists:
echo "Checking for Homebrew GitHub API Token in environment...."
if [ -z "$HOMEBREW_GITHUB_API_TOKEN" ]; then
  # Token does not already exist in environment, so let's make one
  echo "Homebrew API token not found..."
  echo
  # Now ask the user for their hombrew github api token and add it to the configuration
  echo "To get the most out of Homebrew, it's recommended that you use a GitHub API token."
  echo "If you don't already have one, you can create one by going to https://github.com/settings/applications"
  read -p "Please enter your Homebrew API token now (or press enter to skip):" -r token
  if [ ! -z $token ]; then
    # user entered a token
    # open the shell_variables file and add the token to the environment setup there
    echo "HOMEBREW_GITHUB_API_TOKEN=${token}" >> "$HOME/.shell_variables"
  fi
else
  # Token already exists, let's just continue.
  echo "HOMEBREW_GITHUB_API_TOKEN found! You're all set."
fi






