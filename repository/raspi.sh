#!/usr/bin/env bash

clear

if ! sudo apt update; then
  printf "\n%s\n\n" "Failed to execute the command: sudo apt update. Line: ${LINENO}"
  exit 1
fi

clear

if ! sudo apt -y full-upgrade; then
  printf "\n%s\n\n" "Failed to execute the command: sudo apt -y full-upgrade. Line: ${LINENO}"
  exit 1
fi

clear

prompt_fn()
{
    printf "%s\n%s\n\n%s\n%s\n\n"                        \
      "Do you want to update the firmware?"              \
      "You should only do this a max of 3 times a year." \
      '[1] Yes'                                          \
      '[2] No'
    read -p 'Your choices are (1 or 2): ' choice
    case "${choice}" in
        1)
              if ! sudo raspi-update; then
                printf "\n%s\n\n" "Failed to execute the command: sudo raspi-update. Line: ${LINENO}"
                exit 1
              fi
              ;;
        2)    return 0;;
        *)
              clear
              printf "%s\n\n" 'Bad user input. The script will re-ask the question in 5 seconds.'
              sleep 5
              unset choice
              clear
              prompt_fn
              ;;
    esac
}
prompt_fn
clear

printf "%s\n\n" 'The script has completed successfully!'
