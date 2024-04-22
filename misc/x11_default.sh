#!/bin/bash
sudo sed -i '/^\[daemon\]/a DefaultSession=gnome-xorg.desktop' /etc/gdm3/custom.conf
