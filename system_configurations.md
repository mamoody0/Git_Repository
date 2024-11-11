1. Check Your System Info
To see basic information about your system, type this:

bash
Copy code
uname -a
This shows your operating system, the version, and other info.

If you want to know your CentOS version, type:

bash
Copy code
cat /etc/os-release
This shows the CentOS version you're using.

2. Set Up Your Network

2.1 View Network Interfaces
To check if your network is working and see your connected devices:

bash
Copy code
nmcli device status

2.2 Set a Static IP Address
If you need to give your computer a permanent IP address:

First, open the network settings file by typing:

bash
Copy code
sudo nano /etc/sysconfig/network-scripts/ifcfg-eth0
Edit the file so it looks like this (put your correct IP info in):

makefile
Copy code
TYPE=Ethernet
BOOTPROTO=static
IPADDR=192.168.1.100
NETMASK=255.255.255.0
GATEWAY=192.168.1.1
DNS1=8.8.8.8
DNS2=8.8.4.4

Save and close the file. To save, press CTRL + O, then Enter. To close, press CTRL + X.

Restart your network by typing:

bash
Copy code
sudo systemctl restart network

2.3 Enable/Disable a Network Interface
If you need to enable or disable your network:

Enable it:

bash
Copy code
sudo nmcli device connect eth0
Disable it:

bash
Copy code
sudo nmcli device disconnect eth0

3. Add/Remove Users

3.1 Add a New User
To add a new user:

bash
Copy code
sudo useradd newuser
sudo passwd newuser
Replace newuser with the name you want for the new user.

3.2 Remove a User
To delete a user:

bash
Copy code
sudo userdel newuser
Replace newuser with the name of the user you want to delete.

4. Control System Services

4.1 Start/Stop/Restart Services
To control a service, like a web server:

Start it:

bash
Copy code
sudo systemctl start service_name
Stop it:

bash
Copy code
sudo systemctl stop service_name
Restart it:

bash
Copy code
sudo systemctl restart service_name

4.2 Enable/Disable Services on Boot
To make a service start automatically when you boot:

Enable it:

bash
Copy code
sudo systemctl enable service_name
Disable it:

bash
Copy code
sudo systemctl disable service_name

5. Set Up Firewall Rules

5.1 Check Firewall Status
To check if your firewall is running:

bash
Copy code
sudo firewall-cmd --state

5.2 Allow a Service Through the Firewall
For example, to allow web traffic (HTTP) through the firewall:

bash
Copy code
sudo firewall-cmd --zone=public --add-service=http --permanent
sudo firewall-cmd --reload

6. Set Date and Time

6.1 Check Date and Time
To see the current date and time:

bash
Copy code
date

6.2 Set Date and Time
If you need to set the date and time manually, use this:

bash
Copy code
sudo timedatectl set-time '2024-11-11 12:00:00'
Replace '2024-11-11 12:00:00' with the actual date and time.

6.3 Sync Time Automatically with NTP
To automatically sync your time with the internet:

bash
Copy code
sudo timedatectl set-ntp true

7. Manage Software

7.1 Install a Program
To install a program (for example, vim):

bash
Copy code
sudo dnf install vim
Replace vim with whatever program you want to install.

7.2 Remove a Program
To remove a program:

bash
Copy code
sudo dnf remove vim

7.3 Update the System
To update all your software:

bash
Copy code
sudo dnf update

8. View Logs
To see system logs (like errors or warnings):

bash
Copy code
sudo journalctl

9. Check Disk Usage
To see how much disk space you have left:

bash
Copy code
df -h

10. Reboot the System
To reboot your CentOS system:

bash
Copy code
sudo reboot
