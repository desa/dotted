#!/bin/bash

# 

# echo "Bash source is:"
# echo "${BASH_SOURCE[0]}"

source "$(echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"/dependencies/functions.sh


binaries=($(fileToArray brew_binaries))

echo ${binaries[@]}