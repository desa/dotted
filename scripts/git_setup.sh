# git_setup.sh
# dotted, by Brett Levenson
# Last Modified: 4/9/15
# 
# This file copies the global git configuration into the root directory and 
# then helps the user set up some basics that need to be configured


echo "Beginning setup of .gitconfig..."
if [[ $(confirm) == "yes" ]]; then
	# First we need to copy our .gitconfig file to the user's home directory
	cp "$DOTTED_ROOT/assets/files/gitconfig" "$HOME/.gitconfig"

	# Now that's done, we can start editing the git configuration file
	echo

	# Setup git user name
	read -p "Please enter your Git or GitHub user name: " -r git_user
	git config --global user.name "$git_user"

	# Setup git email
	read -p "Please enter your Git or GitHub email address: " -r git_email
	git config --global user.email "$git_email"


	# Finally, create the global ".gitignore" file (with node_modules excluded, of course)
	echo "node_modules" >> "$HOME/.gitignore"
fi