#!/usr/bin/env bash

clear

#
# SET VARIABLES
#

rp_url='https://raw.githubusercontent.com/kravberry/update-scripts/main/shell/raspi.sh'
pi_url='https://raw.githubusercontent.com/kravberry/update-scripts/main/shell/pihole.sh'
user_agent='Mozilla/5.0 (X11; Linux armv7l; rv:102.0) Gecko/20100101 Firefox/102.0'

raspi_fn()
{
    if ! bash <(curl -A "${user_agent}" -fsSL "${rp_url}"); then
        printf "\n%s\n\n" "Failed to execute the command: bash <(curl -A ${user_agent} -fsSL ${rp_url}). Line: ${LINENO}"
        return 1
    fi
}

pihole_fn()
{
    if ! bash <(curl -A "${user_agent}" -fsSL "${pi_url}"); then
        printf "\n%s\n\n" "Failed to execute the command: bash <(curl -A ${user_agent} -fsSL ${pi_url}). Line: ${LINENO}"
        return 1
    fi
}

prompt_fn()
{
printf "%s\n\n%s\n%s\n%s\n%s\n\n" \
    'Choose what to update.'      \
    '[1] Raspberry Pi'            \
    '[2] Pi-Hole'                 \
    '[3] Both'                    \
    '[4] Exit'
read -p 'Your choices are (1 to 4): ' choice
clear

case "${choice}" in
    1)      raspi_fn;;
    2)      pihole_fn;;
    3)
            raspi_fn
            pihole_fn
            ;;
    4)      return 0;;
    *)
            printf "%s\n\n" 'Bad user input. The script will ask the question again in 5 seconds.'
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
