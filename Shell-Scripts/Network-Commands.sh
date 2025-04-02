% Networking Commands:

ping: Check network connectivity with a remote host.

traceroute: Display the route that packets take to reach a destination.

ip: A more powerful and flexible tool for configuring network interfaces.

ifconfig: Display or configure network interfaces.

netstat:

curl: Command-line tool for making HTTP requests.

wget: Non-interactive tool for downloading files from the web.

telnet:  command-line protocol used to interact with remote systems. Text based connection to a remote system

ssh: OpenSSH client for connecting to a remote server securely.

ftp: file transfer protocol

Nslookup: Query Internet name servers interactively.

ip addr show: shows ip address

hostname -i: ip address

dig: Query DNS name servers for information about host addresses, mail exchanges, name servers, etc.

scp: Secure copy command to copy files between hosts on a network.

iftables: Tool for configuring Linux kernel packet filtering rules.

route: Display or manipulate the IP routing table.

ping : check the connection between two computers within the network or outside network
Testing the network host capacity to interact with another host

ping "target"
ping -a
ping -n : count the number os packets
ping -i size:
ping -i TTL: time to live the connection

Network statistics: netstat

netstat is a common tcp-ip networking command line method present
netstat -alntp:
-a: all connections
-b: Shows the executable involved in each connection or hearing port
-e: This protocol will combine with the -sand display the ethernet statistics
-n: This will display the address and the port number in the form of numerical
-o: It will display the ID of each connection for the ownership process.
-r: It will display the routing table
-v: When used in combination with -b, the link or hearing port sequence for every executable is shown.

Command used for checking the ip address: ipconfig/ifconfig
To check the internet is connected or not and network interfaces etc..

% hostname:
which will display the network information
hostname -i : will show the ip address
hostname -s : will show the network username
hostname -d : nothing will display

Check the sends packet is correct or not :
tracert: is a command prompt used to get the network packet being sent and received and the number of hops
tracert [-d] [-h MaxHops] [-w TimeOut]  target

% nslookup:
it is a command line utility to check the name server is available or not
name server information for the DNS provided

% route :
routing tables are used to direct packets from one subnet to another
The Route Command provides the device routing tables

ARP: Address Resolution Protocol
where the mac address will be assigned for the ip address at data link layer
