resource "aws_instance" "Demo1" {
    ami = var.ami
    instance_type = var.instance_name == "mongodb" ? "t3.micro" : "t2.micro"
    tags = var.tags
    security_groups = [aws_security_group.SGDemo1.name]
  
}

resource "aws_security_group" "SGDemo1" {
    name = "Demo1"
    description = "Allowing To all Ports"
    tags = var.tags

    ingress {
        description = "Allowing All TCP"
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = var.sg_cidr
    }
    egress {
        description = "Allowing All TCP"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.sg_cidr
    }
  
}