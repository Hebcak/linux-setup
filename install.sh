#!/usr/bin/env bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

APPCONFIG_PATH=$MY_PATH/appconfig


cd $MY_PATH
#fetch updates for the setup
git pull

#initialize submodules
echo "Downloading git submodules"
git submodule update --init --recursive


#update and upgrade current packages
echo "Updating and Upgrading the system"
sudo apt-get -y update
sudo apt-get -y upgrade

#install essentials
toilet "Installing essentials"
sudo apt-get -y install build-essential make cmake cmake-curses-gui ccache pkg-config automake autoconf libc++-dev clang clang-format libffi-dev

#install tools
sudo apt-get -y install htop git unzip

#install tmux
echo "Installing tmux"
bash $APPCONFIG_PATH/tmux/install.sh

#install ranger
toilet "Installing ranger"
bash $APPCONFIG_PATH/ranger/install.sh

