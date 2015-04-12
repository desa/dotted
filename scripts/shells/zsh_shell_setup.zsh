# dotted/scripts/zsh_shell_setup.zsh
# Last modified: 4/11/15, by Brett Levenson
# Description:
# Sets up zsh with custom aliases functions and vars
#
# TODO:
# The version below is not actually how I now want this to work.
# Rather than running this scripting code, I'm going to just copy some pre-created files over to the system

# Let's alias some open commands to open files in my brosers
# First we'll have to create a new oh-my-zsh file to put these aliases in:

ZSH_ALIASES="$HOME/.oh-my-zsh/custom/zsh_aliases.zsh"

# Now we'll add some aliases to that file
aliases=(
  "reld='. ~/.zshrc'" 
  "chrome='open -a \"Google Chrome\"'"
  "safari='open -a \"Safari\"'"
  "gti='git'"
  "got='git'"
  "gpo=\'git push origin \$(current_branch)\'"
  "ga='git add'"
  "gaa='git add --all'"
  "gs='git st'"
  "rr='rm -r'"
  "rrf='rm -rf'"
  "cpdir='cp -R'"
) 

touch "$ZSH_ALIASES"

# Let's add a first line to the file
echo "# Additional Aliases to Use in zsh\n" >> "$ZSH_ALIASES"

# now insert our aliases into our new "aliases" file
printf "alias %s\n" "${aliases[@]}" >> "$ZSH_ALIASES" # I think this should work well and it won't need to run a loop

# for i in "${aliases[@]}"
# do
#   echo "Adding alias $i ..."
#   echo "alias "$i >> "$ZSH_ALIASES"
# done


# One more thing, let's create a custom "functions" file for oh-my-zsh
echo "Creating a custom zsh functions file..."
ZSH_FUNCS="$HOME/.oh-my-zsh/custom/zsh_functions.zsh"

# Create the file
touch "$ZSH_FUNCS"

# Now add a function that i like
cat <<-EOF >> "$ZSH_FUNCS"
	# This file contains custom functions for use in my terminal environment
	function MakeDirAndChange {
  	  echo "Creating directory $1"
  	  mkdir "$1"
  	  cd "$1"
	}
alias mkcd='MakeDirAndChange'
EOF

LAST_COMMAND=$?
if [ "$LAST_COMMAND" -gt "0" ]; then
  echo "An error occurred while creating the zsh functions file."
else
  echo "zsh_functions.zsh created successfully!"
fi