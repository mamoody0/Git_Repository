#!/bin/bash

# Check for the presence of the VPN service
vpn_service_name="vpn.service"
vpn_service_status=$(systemctl list-units --type=service | grep -i "$vpn_service_name")

if [ -n "$vpn_service_status" ]; then
    # If service is found, check if it's active
    vpn_service_status=$(systemctl is-active "$vpn_service_name")
    if [ "$vpn_service_status" == "active" ]; then
        echo "VPN service is running."
    else
        echo "VPN service is not running. Attempting to start it..."
        sudo systemctl start "$vpn_service_name"
    fi
else
    echo "VPN service not found on this system."
fi

# Ping test to check VPN connectivity
echo "Testing VPN connectivity..."
ping -c 4 8.8.8.8

if [ $? -eq 0 ]; then
    echo "VPN connectivity is successful!"
else
    echo "VPN connectivity failed."
fi
