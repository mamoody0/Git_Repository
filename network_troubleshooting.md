This guide provides step-by-step instructions to troubleshoot and resolve network issues on CentOS 9.

1. Checking Network Connectivity
The first step is to verify basic network connectivity.
Ping a Known Host
Run ping to check if you can reach an external website or IP:
ping -c 4 google.com

If the ping fails, try pinging your gateway to see if you have internal connectivity:
ip route | grep default
ping -c 4 [your-gateway-ip]

Check Your IP Address
Confirm that your system has a valid IP address:
ip addr show

2. Verifying Network Configuration
If there’s no IP address or you’re unable to connect, check network configurations.
View Network Interfaces
List all network interfaces to check their status:
nmcli device status

Enable Network Interface
If the network interface is down, bring it up:
sudo nmcli device connect <interface-name>

Check IP Configuration
Ensure that your interface is set up with the correct IP address, gateway, and DNS settings by examining:
cat /etc/sysconfig/network-scripts/ifcfg-<interface-name>

3. Restarting Network Services
Sometimes, network services may need to be restarted.
Restart NetworkManager
Use the following command to restart NetworkManager:
sudo systemctl restart NetworkManager

Alternatively, if NetworkManager is not managing your connection, restart the network service:
sudo systemctl restart network

4. Checking DNS Resolution
DNS issues can prevent access to websites using domain names.
Test DNS Resolution
Run dig or nslookup to verify DNS settings:
dig google.com

Edit DNS Settings
If DNS fails, edit your DNS settings in /etc/resolv.conf to include a known DNS server (like Google’s 8.8.8.8):
sudo nano /etc/resolv.conf
nameserver 8.8.8.8

5. Testing Network Hardware
Network hardware problems can also lead to connectivity issues.
Check Link Status
Use ethtool to check the status of your network interface card:
sudo ethtool <interface-name>

Inspect Network Cables and Router
Ensure cables are properly connected, and restart the router if needed.

6. Advanced Troubleshooting
For more complex issues, use the following tools:
Traceroute
To analyze the path packets take and find where delays occur, use traceroute:
sudo traceroute google.com

TCPDump
Capture network traffic to see what packets are being transmitted:
sudo tcpdump -i <interface-name>

Conclusion
These steps provide a robust foundation for troubleshooting network issues on CentOS 9. Remember to document changes you make for future reference and consider reaching out to senior support for persistent or escalated issues.
