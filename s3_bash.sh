#!/bin/bash

# Pobranie Instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Pobranie Public IP i Private IP
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

# Wyswietla zapisane instance na konsoli
echo "Pobrano Instance ID: $INSTANCE_ID"
echo "Pobrano Public IP: $PUBLIC_IP"
echo "Pobrano Private IP: $PRIVATE_IP"

# Zapisanie do pliku
echo "Instance ID: $INSTANCE_ID" > instance_info.txt


