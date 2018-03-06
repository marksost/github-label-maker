#!/usr/bin/env bash

# Color variables
readonly GREEN='\033[0;32m'
readonly RED='\033[0;31m'
readonly YELLOW='\033[1;33m'
readonly NC='\033[0m' # No Color

# Spacing variables
readonly TAB='  '
readonly TABx2='    '

# Function to handle exiting with an error
die() {
    echo_red >&2 "$@"
    exit 1
}

# Function used to color echo text in green
echo_green() {
    echo -e "${GREEN}$@${NC}"
}

# Function used to color echo text in red
echo_red() {
    echo -e "${RED}$@${NC}"
}

# Function used to color echo text in yellow
echo_yellow() {
    echo -e "${YELLOW}$@${NC}"
}
