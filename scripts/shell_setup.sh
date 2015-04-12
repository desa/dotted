# dotted/scripts/shell_setup.sh
# Last modified: 4/11/15, by Brett Levenson
# Description:
# Trigger point for setting up either bash or zsh
#


# BASH setup
if [[ "$SHELL" == "$(which bash)" ]]; then
  # Bash is the current shell, so proceed with setup for bash
  source $DOTTED_ROOT/scripts/shells/bash_shell_setup.bash
fi


# ZSH setup
if [[ "$SHELL" == "$(which zsh)" ]]; then
  # Bash is the current shell, so proceed with setup for bash
  source $DOTTED_ROOT/scripts/shells/zsh_shell_setup.zsh
fi


