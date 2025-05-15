# AWS Interview Questions

**1: What is the IP Range of Default VPC?**
- The deault IP Address Range CIDR is 172.31.0.0/16 and the default Subnets CIDRs id /20 with in The Default VPC CIDR

**2: Can a VPC Span Multiple Availability Zones?**
- Yes

**3: Can i Ue My Existing AMIs in Amazon VPC?**
- You Can use AMIs in amazon VPC That are registered within the same region as your VPC

**4: What is an Amazon Route 53?**
- Amazon Route 53 provides a high availability and scalable domain name system domain name registration and health checking web services
  
**What Ip Ranges we can use in CIDR's**
- 172.31.0.0/20 

**Describe VPC:**

1. VPC
2. Subnets
3. Route Tables
4. Internet Gateways
5. Security Groups
6. Nacls
7. cidr ranges
   1. aws reserved 5 ips per range for internal communication DHCP(dynamic host configuration protocol)
   2. aws suggests to use ips </16 - /24> 
8. site-to-site vpn --> `Connecting On Premise Services to VPC Through Customer Gateway`
9.  Direct connect 
10. vpc endpoint
11. transit gateway --> Junction for VPNS or other networks to connect vpc in aws cloud 
12. private link -<develop the service in vpc and enable the private link and give it to consumers to use it>
13. nat gateway -<network address translator>
14. loadbalancer -<distributes the traffic based on multiple factors,health,stickiness,cross-region,usage,plaform based,protocols>
15. vpc peering
16. virtual private gateways
17. customer gateways
18. VPC Lattice 
19. IAM <Roles>-<Policies>-<Users>-<User-Groups>
20. RDS --> Relational Data Base Services.

### In Terraform Resources Creation

1. VPC --> Cidr Block ,Name , Tags
2. Subnets --> Cidr Block, VPC Id
3. Internet Gateway --> VPC id
4. Route Table -->  Created The Routes 
5. Route Table Association
6. Nat Gateway --> Cidr block
7. Security Group --> Ingress Egress
8. EC2 Intance --> Instance Id , Instance Name, AMI_ID and Instance Type

### Entry Point and CMD 

1. Entry point is an excutable which cannot be over ridden while running via cli
2. CMD Is a Point of Passing parameters and can be over ridden while running via cli


