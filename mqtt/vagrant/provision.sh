#!/bin/bash

echo "Installing Mosquitto"

sudo apt-get update
sudo apt-get install mosquitto mosquitto-clients libmosquitto-dev -y

cd vagrant
sudo cp ./config/mosquitto.conf /etc/mosquitto/mosquitto.conf

sudo systemctl restart mosquitto
echo "Installation port: 1884"
