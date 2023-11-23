#!/usr/bin/env bash

clear

if ! sudo apt update; then
    printf "\n%s\n\n" "Failed to execute the command: sudo apt update. Line: ${LINENO}"
    exit 1
fi

clear

if ! sudo pihole -up; then
    printf "\n%s\n\n" "Failed to execute the command: sudo pihole -up. Line: ${LINENO}"
    exit 1
fi

clear

if ! sudo pihole -g; then
    printf "\n%s\n\n" "Failed to execute the command: sudo pihole -g. Line: ${LINENO}"
    exit 1
fi

printf "%s\n\n" 'The script has completed successfully!'
