#!/bin/sh

# Define the inventory file name
INVENTORY_FILE="inventory.ini"

# Initialize the inventory file with a header for the 'myhost' section
echo "[myhost]" > $INVENTORY_FILE

# List of image names
IMAGE_NAME="vm1 vm2 vm3"

# Loop through each image (container) in the list
for IMAGE in $IMAGE_NAME; do

  # Retrieve the IP address of the container using Docker inspect
  IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $IMAGE)

  # Check if the IP address was found
  if [ -n "$IP" ]; then
    # If an IP address is found, append it to the inventory file
    echo "$IMAGE ansible_host=$IP" >> $INVENTORY_FILE
  else
    # If no IP address is found, output an error message
    echo "Erreur : Impossible de trouver  l'IP de $IMAGE."
  fi
done 

echo "Fichier $INVENTORY_FILE mis à jour."
