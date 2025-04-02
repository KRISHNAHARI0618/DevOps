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
     type = map
        default =  {
            Project = "Roboshop"
            terraform = "true"
            environment = "vpc-dev"
        } 
}
variable "vpc_tags" {
     type = map
        default =  {
            Name = "Roboshop"
               } 
}
variable "igw_tags" {
     type = map
        default =  {
            Name = "Roboshop"
 } 
}
variable "public_subnet_cidr_block" {
    default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "azs" {
    default = ["us-east-1a","us-east-1b"]
}
variable "public_subnet_names" {
    type = list
    default = ["roboshop_public_1a","roboshop_public_1b"]
}
variable "private_subnet_cidr_block" {
  default = ["10.0.11.0/24","10.0.12.0/24"]
}
variable "private_subnet_names" {
  default = ["roboshop-private-1a","roboshop-private-1b"]
}
variable "database_subnet_cidr_block" {
    default = ["10.0.21.0/24","10.0.22.0/24"]
}
variable "database_subnet_names" {
    default = ["roboshop-database-1a","roboshop-database-1b"]
}
variable "public_routetable_tags" {
    default = {
        Name = "public-routetable"
    }
}
variable "private_routetable_tags" {
    default = {
        Name = "private-routetable"
    }
  
}
