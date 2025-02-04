#!/bin/bash

# Pobranie Instance ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# Pobranie Public IP i Private IP
PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)
PRIVATE_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

# Pobieranie informacji z systemu 
OS_INFO=$(cat /etc/*-release | egrep "PRETTY_NAME|VERSION_ID" | cut -d = -f 2 | tr -d '"' | tr '\n' ' ')

# Pobieranie uzytkownikow

USERS=$(getent passwd | grep -E 'bash|sh' | cut -d: -f1)

# Wyswietla zapisane instance na konsoli
echo "Pobrano Instance ID: $INSTANCE_ID"
echo "Pobrano Public IP: $PUBLIC_IP"
echo "Pobrano Private IP: $PRIVATE_IP"
echo "Pobrano Operating System: $OS_INFO"
echo "Pobrano Users with shell access: $USERS"

# Zapisanie do pliku
echo "Instance ID: $INSTANCE_ID" > instance_info.txt
echo "Public IP: $PUBLIC_IP" >> instance_info.txt
echo "Private IP: $PRIVATE_IP" >> instance_info.txt
echo "Operating System: $OS_INFO" >> instance_info.txt
echo "Users with shell access:" >> instance_info.txt
echo "$USERS" >> instance_info.txt

# Przesłanie pliku na serwer
aws s3 cp instance_info.txt s3://applicant-task/r4p17/

# Potwierdzenie wysłania
echo "Plik został wysłany na serwer."
