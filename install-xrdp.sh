#!/bin/bash

#Install xfce
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install xfce4
sudo apt install xfce4-session

# Install and enable RDP server on Ubuntu
sudo apt-get -y install xrdp
sudo systemctl enable xrdp

# Give certificate access to xrdp user (Ubuntu 20 only)
sudo adduser xrdp ssl-cert

# Configure xrdp user use xfce as your desktop environment
echo xfce4-session >~/.xsession

#restart xrdp service
sudo service xrdp restart



