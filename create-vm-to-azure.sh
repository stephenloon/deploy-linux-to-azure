#!/bin/bash

#Variables

RESOURCE_GROUP_NAME=rg1
LOCATION=westus
VM_NAME=ubuntu-vm
VM_IMAGE=debian
ADMIN_USERNAME=azadmin


# Check if resource group exists. If not, it creates the resource group
if az group show --name $RESOURCE_GROUP_NAME &>/dev/null;
then
    echo "Create resource group: $RESOURCE_GROUP_NAME"
    az group create --name $RESOURCE_GROUP_NAME --location $LOCATION
    echo "Resource group has been created."
else
    echo "The resource group $RESOURCE_GROUP_NAME already exists."
fi

# Checked if VM already exist
if az vm show --resourcegroup $RESOURCE_GROUP_NAME --name $VM_NAME &>/dev/null;
then   
    echo " This VM already exists"
else
    az vm create \
    --resource-group $RESOURCE_GROUP_NAME \
    --name $VM_NAME \
    --image $VM_IMAGE \
    --admin-username $ADMIN_USERNAME \
    --generate-ssh-keys \
    --public-ip-sku Standard

    echo " VM: $VM_NAME has been installed"
fi

# Export public IP 

public_ip=$(az vm show --show-details --resource-group $RESOURCE_GROUP_NAME --name $VM_NAME --query publicIps --output tsv)

echo $public_ip > pub-ip.txt

