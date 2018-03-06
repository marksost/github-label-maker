#!/usr/bin/env bash

set -e

# Script variables
GITHUBORG=""
GITHUBREPO=""

# Include shell helpers
source shell-helpers.sh

# Main functionality of the script
main() {
  echo_yellow "Creating labels for the following organization and repository:"
  echo_yellow "${TAB}Organization: $GITHUBORG"
  echo_yellow "${TAB}Repository: $GITHUBREPO"

  # Create labels
  create_labels

  echo_green "Labels created succesfully!"
}

# Create labels for a specific repo
create_labels() {
  while IFS= read -r LABELNAME && IFS= read -r LABELCOLOR; do
    echo_yellow "${TAB}Creating label with the following settings:"
    echo_yellow "${TABx2}Name: $LABELNAME"
    echo_yellow "${TABx2}Color: $LABELCOLOR"

    curl -X POST --header "Authorization: token ${GITHUBTOKEN}" \
      --header "Content-Type: application/json" \
      --data "{\"name\":\"${LABELNAME}\", \"color\":\"${LABELCOLOR}\"}" \
      "https://api.github.com/repos/${GITHUBORG}/${GITHUBREPO}/labels"

    echo ""
  done < <(jq -r 'keys[] as $k | (.[$k].name, .[$k].color)' $(pwd)/labels.json)
}

# Function that outputs usage information
usage() {
  cat <<EOF

Usage: $(basename $0) <options>

Description

Options:
  -o (required)     The Github organization (or user) that the repository resides under
  -r (required)     The name of the repository
  -t                A Github personal token, used for authenticating API requests
  -h                Print this message and quit

EOF
  exit 0
}

# Function that verifies required input was passed in
verify_input() {
  # Verify required inputs are not empty
  [ ! -z "${GITHUBORG}" ] && [ ! -z "${GITHUBREPO}" ] && [ ! -z "${GITHUBTOKEN}" ]
}

# Parse input options
while getopts ":o:r:t:h" opt; do
  case "$opt" in
    o) GITHUBORG=$OPTARG;;
    r) GITHUBREPO=$OPTARG;;
    t) GITHUBTOKEN=$OPTARG;;
    h) usage;;
    \?) echo_red "Invalid option: -${OPTARG}." && usage;;
    :) die "Option -${OPTARG} requires an argument.";;
  esac
done

# Verify input
! verify_input && echo_red "Missing script options." && usage

# Execute main functionality
main
