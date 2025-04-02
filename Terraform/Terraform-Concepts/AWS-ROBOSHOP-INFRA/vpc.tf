module "main" {
    source = "../AWS-VPC-MODULE"
    cidr_block = var.cidr_block
    enable_dns_hostnames = var.enable_dns_hostnames
    enable_dns_support = var.enable_dns_support
    common_tags = var.common_tags
    vpc_tags = var.vpc_tags
    
    # Internet Gateway Tags
    igw_tags = var.igw_tags

    # Public  Subnet Creation 
    azs = var.azs
    public_subnet_cidr_block = var.public_subnet_cidr_block
    public_subnet_names = var.public_subnet_names

    # Private Subnet Creation
    private_subnet_cidr_block = var.private_subnet_cidr_block
    private_subnet_names = var.public_subnet_names

    # Database creation

    database_subnet_cidr_block = var.database_subnet_cidr_block
    database_subnet_names = var.database_subnet_names

    # Public Route table creation
    public_routetable_tags = var.public_routetable_tags

    #Private Route Table Tags
    private_routetable_tags = var.private_routetable_tags
}