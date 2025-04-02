Wild Cards:
	* : represents all the characters
	? : Represents single characters
	[]: range of characters
	$? : Exit status
	&>> : stdinn or stdout or stderr
	
Components in Distributions:
	Kernel
	Utilities
	Services
	Software/Packages Management
Diff Between MemFree and MemAvailable
	
What is the difference between paging and swapping:

	Paging : is a memory management method that enables systems to store and get the data from secondary storage for usage in the main memory.
	Paging is more Flexible
	
	Swapping : temporarily transfers a process from the primary to secondary memory.
	
Explain what is OOM killer:
	The Out Of Memory Killer or OOM Killer is a process that the linux kernel employs when the system is critically low on memory.
	
What does Traceroute Do: 
	A traceroute works by sending Internet Control Message Protocol (ICMP) packets, and every router involved in transferring the data gets these packets. 
	The ICMP packets provide information about whether the routers used in the transmission are able to effectively transfer the data.

What is network Bonding:
	Combining one or more networks interfaces into a single interface
	Connecting two network namespaces via veth interface.
	
# Create two network namespaces
sudo ip netns add 'mynamespace-1'
sudo ip netns add 'mynamespace-2'

# Create a veth virtual-interface pair
sudo ip link add 'myns-1-eth0' type veth peer name 'myns-2-eth0'

# Assign the interfaces to the namespaces
sudo ip link set 'myns-1-eth0' netns 'mynamespace-1'
sudo ip link set 'myns-2-eth0' netns 'mynamespace-2'

# Change the names of the interfaces (I prefer to use standard interface names)
sudo ip netns exec 'mynamespace-1' ip link set 'myns-1-eth0' name 'eth0'
sudo ip netns exec 'mynamespace-2' ip link set 'myns-2-eth0' name 'eth0'

# Assign an address to each interface
sudo ip netns exec 'mynamespace-1' ip addr add 192.168.1.1/24 dev eth0
sudo ip netns exec 'mynamespace-2' ip addr add 192.168.2.1/24 dev eth0

# Bring up the interfaces (the veth interfaces the loopback interfaces)
sudo ip netns exec 'mynamespace-1' ip link set 'lo' up
sudo ip netns exec 'mynamespace-1' ip link set 'eth0' up
sudo ip netns exec 'mynamespace-2' ip link set 'lo' up
sudo ip netns exec 'mynamespace-2' ip link set 'eth0' up

# Configure routes
sudo ip netns exec 'mynamespace-1' ip route add default via 192.168.1.1 dev eth0
sudo ip netns exec 'mynamespace-2' ip route add default via 192.168.2.1 dev eth0

# Test the connection (in both directions)
sudo ip netns exec 'mynamespace-1' ping -c 1 192.168.2.1
sudo ip netns exec 'mynamespace-2' ping -c 1 192.168.1.1

What are C-Groups:
	Cgroups allow you to allocate resources — such as CPU time, system memory, network bandwidth, or combinations of these resources
	Limits Accouts for , Isolates Resource.

Process Descriptor and the Task Structure:
	The kernel stores the list of processes in a circular doubly linked list called the task list[3]. Each element in the task list is a process descriptor of the type struct task_struct, which is defined in <linux/sched.h>. The process descriptor contains all the information about a specific process.

Process: Process are basically the programs that are dispatched from the ready state and are scheduled in the cpu for execution

	
