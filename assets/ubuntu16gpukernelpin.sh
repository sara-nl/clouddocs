#!/bin/sh

# from: https://gist.github.com/ITJesse/380489a742c92261a1e02935dafec240

KERNEL_VERSION="4.4.0-142-generic"

sudo apt-get update
sudo apt install -y linux-image-${KERNEL_VERSION}-generic \
     linux-headers-${KERNEL_VERSION} linux-image-extra-${KERNEL_VERSION}-generic
     
sudo sed -i "s/GRUB_DEFAULT=.*/GRUB_DEFAULT=\"Advanced options for Ubuntu>Ubuntu, with Linux ${KERNEL_VERSION}-generic\"/" /etc/default/grub
sudo update-grub
sudo reboot
