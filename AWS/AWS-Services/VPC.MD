## In AWS:

1. Binary System:

2. Subnet_Masking:
  1. IP_Address: Network_Address + Host_Address
  2. Each_Network:
      Different_Network_IDs: Each network has different Network IDs
      Different_Hosts: Each network has different hosts
  3. IP_Address_Components:
      Both_Network_and_Host_Address: Each IP address has both network and host address

Class_A:
  Bits:
    Network_ID: 8
    Host_ID: 24
  Example_IP_Address: 192.234.100.100
  Example_Split:
    Network_ID: 192
    Host_ID: 234.100.100

Class_B:
  Bits:
    Network_ID: 16
    Host_ID: 16
  Example_IP_Address: 192.234.100.100
  Example_Split:
    Network_ID: 192.234
    Host_ID: 100.100

Class_C:
  Bits:
    Network_ID: 24
    Host_ID: 8
  Example_IP_Address: 192.234.100.100
  Example_Split:
    Network_ID: 192.234.100
    Host_ID: 100

Subnet_Masking_Concept:
  Definition: Making network bits as 1's and host bits as 0's
  Example_IP_Address: 192.234.100.100
  Subnet_Mask: 11000000:00000000:00000000:00000000

Total_Hosts_Per_8_Bits_Octet:
  Calculation: Total 256 hosts can come for each 8 bits octet
  Formula: Remove 2 IDs from 256, leaving 254 hosts per 8 bits octet

Class_Less_InterDomain_Routing:
  Definition: CIDR (Classless Inter-Domain Routing) allows for more efficient use of IPv4 address space and is the current standard for IP addressing.

EC2 : Core and RAM
Volume: EBS,EFS
Networking: VPC

AWS Is Provided Two Types of Services:
    AWS Managed Services
    Customer Managed Services

AWS VPC Introduction:
    What AWS VPC
    VPC Networking
    What are subnets
    What is internet gateway
    why route tables needed
    what is NAT gateway
    What is nacl and sg
    what are vpc flow logs

What is Network Manager:
    AWS Network Manager provides tools and features to help you manage and monitor your network on AWS. Network Manager makes it easier to perform connectivity management, network monitoring and troubleshooting, IP management, and network security and governance.

What is Site to Site VPN Connection:
    within the AWS Cloud, and then connect those resources directly to your own data center using industry-standard encrypted IPsec VPN connections.

# VPC :Virtual Private Cloud

What and Why VPC Is required :
    VPC is required to secure your virtual networking environment Including IP Address,Subnets,Network Gateways
    Clients can run code ,store data,host websites and do all the things what they can do in private cloud
Inside VPC How data transfers:
    Inside VPC TYhe whole data is transferred with the connection of Private Ip Address

Components in VPC:
    IP Address Ranges
    Internet Gateway
    Public Subnet
    Private Subnet
    Load Balancer
    Route Table (Routers)
    Security Groups
    NACL :Automation for Security Group
    NAT Gateway :Network Address Translation
    Domain Name Systems (DNS)
    Subnet Masking
    Nat is helping to download the resource/package from internet and masking the ip address for which server these resourecs are downloading
    VPC Flowlogs :record every action in VPC acting inside .

# Security Groups and NACL
---
NACL: Network Access of Control List
    This will flow the request list from in and out
Security Groups:
    Security Groups act as virtual firewalls for Amazon EC2 instances (virtual servers) at the instance level. They control inbound and outbound traffic by allowing or denying specific protocols, ports, and IP addresses.

    Each EC2 instance can be associated with one or more security groups, and each security group consists of inbound and outbound rules.

    Inbound rules determine the traffic that is allowed to reach the EC2 instance, whereas outbound rules control the traffic leaving the instance.

    Security Groups can be configured using IP addresses, CIDR blocks, security group IDs, or DNS names to specify the source or destination of the traffic.

    They operate at the instance level and evaluate the rules before allowing traffic to reach the instance.

    Security Groups are stateful, meaning that if an inbound rule allows traffic, the corresponding outbound traffic is automatically allowed, and vice versa.

    Changes made to security group rules take effect immediately.

Network Access Control Lists (NACLs):

    NACLs are an additional layer of security that operates at the subnet level. They act as stateless traffic filters for inbound and outbound traffic at the subnet boundary.

    Unlike Security Groups, NACLs are associated with subnets, and each subnet can have only one NACL. However, multiple subnets can share the same NACL.

    NACLs consist of a numbered list of rules (numbered in ascending order) that are evaluated in order from lowest to highest.

    Each rule in the NACL includes a rule number, protocol, rule action (allow or deny), source or destination IP address range, port range, and ICMP (Internet Control Message Protocol) type.

    NACL rules can be configured to allow or deny specific types of traffic based on the defined criteria.

    They are stateless, which means that if an inbound rule allows traffic, the corresponding outbound traffic must be explicitly allowed using a separate outbound rule.

    Changes made to NACL rules may take some time to propagate to all the resources using the associated subnet.

User: InternetGateway :Public Subnet :Load Balancer :Private Subnet --> For Each Subnet there should be one security level
---
Instance Level : Security Group
Subnet Level : NACL

in Aws : Security is shared responsibility we will need additional security to prevent your data

NACL and SG : are the last point of Security Groups and NACL
---
Allow : Nothing :Inbound
---
Allow : Everything:Outbound

InternetGateway : Nacl :Public Subnet :Route Table :Security Group :EC2-Instance

 python3 -m http.server 8000

---
VPC Peering:
    To Connect The Two VPC networks that to with private ip address we need to use VPC - Peering

Required Conditions:
    Between Any VPCS CIDR Should Not OverLap & VPC Cidr Should not Overlap

terraform apply -var-file=DEV/dev.tfvars -auto-approve


Elastic Ip Address:

---
AWS Direct Connect:
- Direct Connect
- Site-To-Site VPN
When you need to connect your on-prem Data Center to your amazon vpc we need to use Amazon Direct Connect As a Primary Conection and As A BackUp Connect we use Site-To -Site VPN Connection
---
AWS Direct Connect Gateway:
- when you need to connect multiple aws vpcs in different aws account in same aws account we can use aws Direct Connect Gateway API
---
AWS Transit GateWay:
- When you need to connect multiple aws vpcs in a same way as like peering in a single connection we use AWS Transit gateway as HUB - and star spoke connection
---

