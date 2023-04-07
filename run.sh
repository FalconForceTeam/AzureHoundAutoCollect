#!/bin/bash

set -e

if [ -z "$AZ_STORAGE_ACCOUNT" ]; then
    echo "No storage account provided. Exiting"
    exit 1
fi

if [ -z "$AZ_STORAGE_CONTAINER" ]; then
    echo "No storage container provided. Exiting"
    exit 1
fi

# It takes a while before the metadata API becomes available. Sleep for 10 seconds to allow for that time.
sleep 10

filename=output-$(date +%s).json
/tmp/AzureHound/azurehound --system-id list -o $filename
az login --identity
az storage blob upload --account-name $AZ_STORAGE_ACCOUNT --container-name $AZ_STORAGE_CONTAINER --name $filename --file $filename --auth-mode login --overwrite