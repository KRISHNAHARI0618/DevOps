module "ec2_instance" {
    source = "../modulecreate"
    ami_id = "ami-03265a0778a880afb"
    # inst_type = "t2.micro"
    inst_type = var.inst_type
}