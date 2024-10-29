#!/bin/bash
echo "Starting system update..."
sudo dnf update -y
sudo dnf upgrade -y
sudo dnf autoremove -y
echo "System updated successfully!"
