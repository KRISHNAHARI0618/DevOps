ARP Request:
    Address Resolution Protocol (ARP) is a procedure for mapping a dynamic IP address to a permanent physical machine address in a local area network (LAN). The physical machine address is also known as a media access control (MAC) address.
What is ARP? 
ARP stands for Address Resolution Protocol. Its designed to discover MAC addresses and then map them to an IP address.

When our computers communicate, they primarily use IP addresses. But before they can send any data to the layer 2 switched network, they first need to find the MAC address of the destination. 

To do this, they use ARP requests to shout out to the entire networks asking "who is 192.168.0.4? Tell me your MAC address". All other computers will ignore this request accept for 192.168.0.4 who will respond with its own MAC address.

Our computer will then take note of this MAC address and associated IP address and keep them in the ARP cache for future use.

ARP Cache is the table which represents the MAC Address and IP Address of Each Hosts 

Host 1     Ip Address - 192.0.12.134  MAC Address: AAAA:BBBB:CCCC:DDDD:GGGG
Host 2     Ip Address - 192.0.12.135  MAC Address: AAAA:BBDD:CCCC:DDDD:GGGG
Host 3     Ip Address - 192.0.12.136  MAC Address: AAAA:BEEB:CCCC:DDDD:GGGG
Host 4     Ip Address - 192.0.12.137  MAC Address: AAAA:BBBB:CCCC:DDDD:GGGG


ARP Cache:

H1 to H2
H2 - H3
H3 - H4
H4 - H1 like that 2^4 == 16 Combination will come

