#!/bin/sh

INVENTORY_FILE="inventory.ini"

echo "[myhost]" > $INVENTORY_FILE

IMAGE_NAME="vm1 vm2 vm3"

for IMAGE in $IMAGE_NAME; do
  IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $IMAGE)
  if [ -n "$IP" ]; then
    echo "$IMAGE ansible_host=$IP" >> $INVENTORY_FILE
  else
    echo "Erreur : Impossible de trouver  l'IP de $IMAGE."
  fi
done 

echo "Fichier $INVENTORY_FILE mis à jour."
