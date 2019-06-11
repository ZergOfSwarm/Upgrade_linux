#!/bin/bash

TEXT_RESET='\e[0m'/
TEXT_YELLOW='\e[0;33m'
TEXT_GREEN="\033[1;32m"
TEXT_RED_B='\e[1;31m'
GREEN="\033[1;32m"
RED="\033[1;31m"
NOCOLOR="\033[0m"

echo
echo -e "step 1: ${GREEN}dpkg --configure -a, pre-configuring packages${NOCOLOR}"
sudo dpkg --configure -a
echo -e $TEXT_YELLOW
echo 'dpkg --configure finished...'
echo -e $TEXT_RESET
echo

echo -e "step 2: ${GREEN}apt-get install -f, fix and attempt to correct a system with broken dependencies${NOCOLOR}"
sudo apt-get install -f
echo -e $TEXT_YELLOW
echo 'APT install -f finished...'
echo -e $TEXT_RESET
echo

echo -e "step 3: ${GREEN}apt update, updating cache${NOCOLOR}"
sudo apt-get update
echo -e $TEXT_YELLOW
echo 'APT update finished...'
echo -e $TEXT_RESET
echo

echo -e "step 4: ${GREEN}apt upgrade, upgrating packages${NOCOLOR}"
sudo apt-get upgrade
echo -e $TEXT_YELLOW
echo 'APT upgrade finished...'
echo -e $TEXT_RESET
echo

echo -e "step 4: ${GREEN}dist upgrade, dist upgrating${NOCOLOR}"
sudo apt-get dist-upgrade
echo -e $TEXT_YELLOW
echo 'APT distributive upgrade finished...'
echo -e $TEXT_RESET
echo

echo -e "step 5: ${GREEN}apt --purge autoremove, remove unused packages${NOCOLOR}"
sudo apt-get --purge autoremove
echo -e $TEXT_YELLOW
echo 'remove unused packages finished...'
echo -e $TEXT_RESET
echo

echo -e "step 7: ${GREEN}apt autoclean, clean up${NOCOLOR}"
sudo apt-get autoclean
echo -e $TEXT_YELLOW
echo 'clean up finished...'
echo -e $TEXT_RESET

if [ -f /var/run/reboot-required ]; then
        echo -e $TEXT_RED_B
            echo 'Reboot required!'
                echo -e $TEXT_RESET
            fi
