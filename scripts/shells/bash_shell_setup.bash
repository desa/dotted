# dotted/scripts/bash_shell_setup.bash
# Last modified: 4/11/15, by Brett Levenson
# Description:
# Sets up bash with custom aliases functions and vars
#

# If .bash_profile doesn't already exist then add it to the home directory
if [ ! -f ~/.bash_profile ]; then
  # bash_profile does not exist, let's do our thing
  cp "${DOTTED_ROOT}/assets/files/zsh_config/bash_profile" "$HOME/.bash_profile"

  # Next up, let's copy bash_profile dependencies to the home dir
  # Edit the file names in this array to add/remove files to ZSH_CUSTOM dir
  bash_config_files=("bash_aliases" "bash_functions" "bash_vars" "bashrc" "bash_colors")
  for file in "${bash_config_files[@]}"; do
    # first MAKE SURE the file doesn't ALREADY EXIST 
    if [ ! -f "${HOME}/.${file}" ]; then
      # If we're here, the file does not already exist, so we copy
      cp "${DOTTED_ROOT}/assets/files/bash_config/${file}" "${HOME}/"
    fi
  done
else
  # .bash_profile found in home dir, so we abort this part of the install, and notify the user
  echo "'.bash_profile' was found in your home directory!"
  echo "To avoid overwriting your current configuration, we're aborting the configuration of bash at this time. Sorry!"
  BASH_CONFIGURATION_ERROR=" :.bash profile already existed!"
fi

# Now check with the user to see if they'd like to add the global configuration directives to their bash setup
if [ "$(confirm 'Would you like to use the global config directives in bash?')" == "yes" ]; then
  backup_name=".bash_profile.dotted_backup-$(date +%Y-%m-%d-%H-%M-%S)"
  echo "Backing up existing '.bash_profile' => ${backup_name}"
  cp "$HOME/.bash_profile" "$HOME/${backup_name}"
  echo "# Global Configuration Directive - Added by Dotted" >> ~/.bash_profile
  echo "# Comment out the line below to remove global config directives from your shell" >> ~/.bash_profile
  echo "source ~/.shell_configuration" >> ~/.bash_profile
fi


# check exit status and report
LAST_COMMAND=$?
if [ "$LAST_COMMAND" -gt "0" ] || [ ! -z $BASH_CONFIGURATION_ERROR ]; then
  echo "An error occurred while trying to configure bash${BASH_CONFIGURATION_ERROR}"
else
  echo "Bash configuration completed successfully!"
fi