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

if command -v az &>/dev/null; 
then
    echo "Azure CLI is already installed"
else
    echo "Azure CLI is not installed!" 
    echo "Installing Azure CLI...."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

fi

# A web browser will open and enter your Azure credentials. If credentials fail, it will print that out.

az login

if [ $? -eq 0 ]; then
    echo "You're logged in!"
else
    echo "Login failed. Please check your credentials and try again."
fi

