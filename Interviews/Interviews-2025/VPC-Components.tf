# 1 : Create a VPC 
# 2: Create a Subnets 
    # 2.a : One with public subnets
    # 2.b : One with private subnets
# 3: Create Internet Gateway
# 4: Create Route Tables
# 5: Create Route Table associations
# 6: Create Ec2 Instance in VPC

provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "name" = "myvpc" 
    }
  
}

resource "aws_subnet" "publicSubnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.myvpc.id
}

resource "aws_subnet" "privateSubnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.myvpc.id
  
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.myvpc.id
}
resource "aws_route_table" "myroute" {
    vpc_id = aws_vpc.myvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

}
resource "aws_route_table_association" "rtasspciation" {
    subnet_id = aws_subnet.publicSubnet.id
    route_table_id = aws_route_table.myroute.id
  
}

resource "aws_instance" "myec2" {
    ami = "ami-0c4e709339fa8521a"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.publicSubnet.id
  
}