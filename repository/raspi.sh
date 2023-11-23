#!/usr/bin/env bash

clear

sudo apt update
if ! sudo apt -y full-upgrade; then
  printf "\n%s\n\n" "Failed to execute the command: sudo apt -y full-upgrade. Line: ${LINENO}"
  exit 1
fi
