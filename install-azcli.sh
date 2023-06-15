#!/bin/bash

# Checks if Curl command exist. If so it will say that it is already installed.
# if not it will install Curl

if command -v curl &>/dev/null;
# when adding &>/dev/null it runs the command silently and does not print the text
then   
    echo "Curl is already installed"
else
    sudo apt-get update && sudo apt-get install -y curl

fi

# Checks to see if the "az" is not installed. If not, it will install Azure CLI.

if [ ! command -v az &>/dev/null ]; 
# adding ! will do the opposite of the command
then
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    echo "Azure CLI is not installed!" 
    echo "Installing Azure CLI...."

else 
    echo "Azure CLI is already installed"

fi

# Checks if you are logged into the Azure portal already. If not it will log you in
# A web browser will pop up to enter Azure credentials

if [[ $(az account show 2>/dev/null) ]];
then
    echo "You're already logged in"
else

    az login 
    echo "You're logged in!"

fi

Hello