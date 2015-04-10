#!/bin/bash
# Find the current scripts directory:
SCRIPT_DIR="$(echo "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )")"

# Load up the dependencies
source "${SCRIPT_DIR}/dependencies/functions.sh"


binaries=($(fileToArray brew_binaries))

echo ${binaries[@]}