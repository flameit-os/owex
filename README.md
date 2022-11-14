# FlameIT - 1-Wire Expander (OWEX) module documentation

[FlameIT - Immersion Cooling](https://flameit.io) 1-Wire Expander module.

![FlameIT - Immersion Cooling 1-Wire Expander Module [FIT OWEX]](owex.jpg "FlameIT - Immersion Cooling 1-Wire Expander Module [FIT OWEX]")

![FlameIT - Immersion Cooling 1-Wire Expander Module with RaspberyPi connected [FIT OWEX + RPi]](owex-rpi.jpg "FlameIT - Immersion Cooling 1-Wire Expander Module with RaspberyPi connected [FIT OWEX + RPi")

## RaspberryPi Installation

Everything is done by [install.sh](install.sh) file dirrectory in this repository.

### I2C && OWFS on RaspberryPi

OWFS is responsible for all I2C communication with our module. All 1-Wire sensors connected to module are than visible as files in filesystem.

* https://owfs.org

### Minimall steps to install OWFS

Here is how to read the current state of the I2C port:

```bash
sudo raspi-config nonint get_i2c
```

This command will return:

* 1 if the port is disabled
* 0 if the port is enabled

```bash
# Enable I2C on RaspberryPi
sudo raspi-config nonint do_i2c 0

# Install OWFS
sudo apt update && sudo apt upgrade
sudo apt install owfs

```

`owfs.conf`

```bash
# FlameT - 1-Wire Expander module on I2C (bus 1)
# i2cdetect -y 1
#      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
# 00:                         -- -- -- -- -- -- -- --
# 10: -- -- -- -- -- -- -- -- 18 -- -- -- -- -- -- --
# 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
# 70: -- -- -- -- -- -- -- --
server: device = /dev/i2c-1
```


## Author

* Paweł 'felixd' Wojciechowski - FlameIT