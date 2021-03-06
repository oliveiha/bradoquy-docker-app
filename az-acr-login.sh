#!/bin/bash

// Install the Azure command line interface

curl -sL https://packages.microsoft.com/keys/microsoft.asc | \

    gpg --dearmor | \

    sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null



AZ_REPO=$(lsb_release -cs)

echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \

    sudo tee /etc/apt/sources.list.d/azure-cli.list

sudo apt-get update

sudo apt-get install azure-cli

// Login into your Azure account via the Azure command line interface

sudo az login

// Login into your Azure container registry

sudo az acr login --name appregistry1000

// Tag your image

sudo docker tag dotnetapp appregistry1000.azurecr.io/dotnetapp

// Then push the image onto Azure container registry

sudo docker push appregistry1000.azurecr.io/dotnetapp