#!/usr/bin/env bash

clear

keys=(112695A0E562B32A 54404762BBB6E853 112695A0E562B32A 54404762BBB6E853 6ED0E7B82643E131 605C66F00D6C9793 0E98404D386FA1D9)

for key in ${keys[@]}
do
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv ${key}
done
