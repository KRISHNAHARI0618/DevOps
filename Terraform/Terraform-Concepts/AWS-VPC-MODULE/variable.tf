variable "cidr_block" {
    default = "10.0.0.0/16"  
}
variable "enable_dns_hostnames" {
    default = true  
}
variable "enable_dns_support" {
  default = true
}
variable "common_tags" {
    default = {}
    type = map 
}
variable "vpc_tags" {
    default = {} # This tags are optional
    type = map 
}
variable "igw_tags" {
    default = {} # This tags are optional
    type = map 
}

# Subnet Creation Variables

variable "public_subnet_cidr_block" {
    #type = list
    #default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "azs" {
    #type = list
    #default = ["us-east-1a","us-east-1b"]
}
variable "public_subnet_names" {
   # type = list
    #default = ["roboshop_public_1a","roboshop_public_1b"]
}

# Private Subnet Creation

variable "private_subnet_cidr_block" {
  
}
variable "private_subnet_names" {
  
}
variable "database_subnet_names" {
  
}
variable "database_subnet_cidr_block" {
  
}
variable "public_routetable_tags" {
  
}
variable "private_routetable_tags" {
  
}

