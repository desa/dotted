#!/bin/bash
# Find the current scripts directory:
SCRIPT_DIR="$(echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"



# Display some values before running (for debugging purposes)
vals=("-" "0" "@" "_" "HOME" "USER" "BASH" "BASH_VERSION")
echo "Value of built in expansion vars:"
for val in "${vals[@]}"; do
	eval "output=\${$val}"
	echo "$val = $output"
done


# This snippet of code will prevent this script from running with the wrong version of bash
if [ "$BASH" != "$(which bash)" ]; then
	echo "Usage error: Please do $0 to run this script."
	exit 1
fi

exit 1

# Load up the dependencies
source "${SCRIPT_DIR}/dependencies/functions.sh"


echo "Beginning setup of .gitconfig..."
if [[ $(confirm) == "yes" ]]; then
	# First we need to copy our .gitconfig file to the user's home directory
	cp "../assets/files/gitconfig" "$HOME/.gitconfig"

	# Now that's done, we can start editing the git configuration file
	echo

	# Setup git user name
	read -p "Please enter your Git or GitHub user name: " -r git_user
	git config --global user.name "$git_user"

	# Setup git email
	read -p "Please enter your Git or GitHub email address: " -r git_email
	git config --global user.email "$git_email"
fi