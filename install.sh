#!/usr/bin/env bash

#get the path to this script
MY_PATH=`dirname "$0"`
MY_PATH=`( cd "$MY_PATH" && pwd )`

APPCONFIG_PATH=$MY_PATH/appconfig


cd $MY_PATH
#fetch updates for the setup
git pull

#update and upgrade current packages
echo "Updating and Upgrading the system"
sudo apt-get -y update
sudo apt-get -y upgrade

#install tmux
echo "Installing tmux"
bash $APPCONFIG_PATH/tmux/install.sh

