# ~/.oh-my-zsh/custom/zsh_functions.zsh
# Last modified: 4/11/15, Author: Brett Levenson
# Description:
# This file is used to define custom functions that I want in my config

function wdi_tree {
	# Step 1: Enter the WDI repository
	cd "$ga/"

	# enter lectures or warm-up or whatever
	cd ${1}*

	# go to the week folder
	if [ "$2" != "" ]; then
		cd week*${2};
	fi

	# now go to day
	if [ "$3" != "" ]; then
		cd _$3*
	fi

	if [ "$4" != "" ]; then
		# now on to the am or pm
		case "$4" in
			am|a|da*)
				cd dawn;
			;;
			pm|p|du*)
				cd dusk;
			;;
		esac
	fi
}

alias wdi='wdi_tree'
alias toga='wdi_tree'


function make_dir_and_change {
	mkdir "$1"
	cd "$1"
}

alias mkcd='make_dir_and_change'