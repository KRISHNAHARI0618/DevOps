## VPN Networking :

Virtual Private Network

VPC
Internet Gateway and associate with VPC
Public, Private , and Db Subnets HA in AZ
Public, Private and DB Route Tables
We are adding Routes
NAT Gateway --> as a route to private and db subnets
Associations of RT and Subnets

VPC Peering:
Two VPC should be in same **region**
Two VPC CIDR should not overlap
Requestor --> Default VPC
Acceptor --> Another VPC

Default Route Table

SSM Parameters Store :
Where all the VPC Ids and Public Subnets Ids will be stored
Private Subnet ids will be stored

# 22:00 -- Completed


## VPC Networking
- CIDR Block
- Internet Gateway
- Public Subnets --> access to internet gateway
- Private Subnets 
- Nat Gateway --> Provides access for Private subnets to download and update the patches 
- Nacl --> Network Access Control Lists
- Security Groups --> Aceess restrictions
- Load Balancing
- VPN Gateway
- AWS Direct Connect
- VPC Peering
- AWS Global Accelerator --> Multi-Region
- VPC Transit Gateway --> For Accessing VPNs to VPC 

## How to Connect On Premises resources to AWS VPC or anyother services
- AWS Transit gateway
- AWS Direct Gateway
- AWS Site to Site VPN
- AWS VPN Gateway

## Security best practices for your VPC
- Create a Subnet --> Multiple Available Zone --> Inside A region --> Zone has redundant power ,network,in a discrete data centers
- Production Grade applications should be available over multiple azs and regions
- Instance Level Use Security Groups
- Subnets Level Use Network Access Control Lists
- Utilize the Identity and Access Management for who and what can access the VPC
- VPC Flow Logs which can monitor the IP flows between subnets , vpc ,network interface
- Use Network Access Analyzer to identify unintended network access to resources in our VPCs
- Use AWS Network Firewall For monitoring inbound and outbound tarffic for aws resources
- AWS Gaurd Duty To protect any potential Threats to your accounts, containers,workloads etc..
  
## Block public access to VPCs and subnets
- VPC BPA --> Block Public Access for centralized Blocking public access for aws services 

## How to Connect aws serviecs with in aws
- *AWS VPC EndPoint*
  - A services which enables the instances to connect over supported aws services like s3 and dynamodb over private network bypassing public network is called vpc gateway endpoint
  - 
