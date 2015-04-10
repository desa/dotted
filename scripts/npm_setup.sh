# npm_setup.sh
# dotted, by Brett Levenson
# Last Modified: 4/9/15

# This file handles set up of NPM and any global packages that we need.

# Create the array of npm_packages to install
npms=($(fileToArray npm_packages))

for p in ${npms[@]}; do
	npm install "${p}" -g # Install each package read from the file globally, one after another
done