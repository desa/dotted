# dotted/scripts/zsh_shell_setup.zsh
# Last modified: 4/11/15, by Brett Levenson
# Description:
# Sets up zsh with custom aliases functions and vars
#
# TODO:
# The version below is not actually how I now want this to work.
# Rather than running this scripting code, I'm going to just copy some pre-created files over to the system


# If .zshrc doesn't already exist then add it to the home directory
if [ ! -f ~/.zshrc ]; then
  cp "${DOTTED_ROOT}/assets/files/zsh_config/zshrc" "$HOME/.zshrc"
fi

# Next up, let's copy some files over to ZSH_CUSTOM directory to be used by oh-my-zsh if it exists

# Edit the file names in this array to add/remove files to ZSH_CUSTOM dir
ohmhzsh_custom_configs=("zsh_aliases.zsh" "zsh_functions.zsh" "zsh_vars.zsh")
if [ ! -z "${ZSH_CUSTOM}" ]; then
  for file in "${ohmhzsh_custom_configs[@]}"; do
    # first check if the file already exists
    if [ ! -f "${ZSH_CUSTOM}/${file}" ]; then
      # If we're here, the file does not already exist, so we copy
      cp "${DOTTED_ROOT}/assets/files/zsh_config/${file}" "${ZSH_CUSTOM}/"
    fi
  done
fi

# Now check with the user to see if they'd like to add the global configuration directives to their bash setup
if [ "$(confirm 'Would you like to use the global config directives in bash?')" == "yes" ]; then
  backup_name=".zshrc.dotted_backup-$(date +%Y-%m-%d-%H-%M-%S)"
  echo "Backing up existing '.zshrc' => ${backup_name}"
  cp "$HOME/.zshrc" "$HOME/${backup_name}"
  echo "# Global Configuration Directive - Added by Dotted" >> ~/.zshrc
  echo "# Comment out the line below to remove global config directives from your shell" >> ~/.zshrc
  echo "source ~/.shell_configuration" >> ~/.zshrc # Adds the configurations to the zshrc file
fi

LAST_COMMAND=$?
if [ "$LAST_COMMAND" -gt "0" ]; then
  echo "An error occurred while creating the zsh functions file."
else
  echo "zsh_functions.zsh created successfully!"
fi