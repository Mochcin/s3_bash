#!/bin/bash

# Pobranie Instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# wyswietyla zapisane instance na konsoli
echo "Pobrano Instance ID: $INSTANCE_ID"

# Zapisanie do pliku
echo "Instance ID: $INSTANCE_ID" > instance_info.txt


