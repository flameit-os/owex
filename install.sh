#!/bin/bash
# Author: Paweł 'felixd' Wojciechowski (c) FlameIT - 2022

MNT_DIR="/mnt/1wire/"

# Enable I2C on RaspberryPi
echo ""
echo "####### FlameIT #######"
echo "Making sure I2C is enabled on RaspberryPi"
echo "####### ------- #######"
sudo raspi-config nonint do_i2c 0

# Install OWFS
echo ""
echo "####### FlameIT #######"
echo "Installing OWFS"
echo "####### ------- #######"
sudo apt update && sudo apt upgrade -y
sudo apt install owfs -y


# Checking OWFS mount point
echo ""
echo "####### FlameIT #######"
echo "Checking for MNT_DIR directory"
echo "####### ------- #######"
if [ -d "$MNT_DIR" ]; then
  ### Take action if $MNT_DIR exists ###
  echo "1-Wire mounting directory exists ${DIR}."
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "1-Wire mounting directory does not exist: ${DIR}. Creating it."
fi

echo ""
echo "####### FlameIT #######"
echo "Installing owfs.conf file in /etc/"
echo "####### ------- #######"
sudo cp owfs.conf /etc/owfs.conf

echo ""
echo "####### FlameIT #######"
echo "Restarting OWFS services (owserver, owhttpd, owftpd)"
echo "####### ------- #######"
sudo service owserver restart
sudo service owhttpd restart
sudo service owftpd restart
