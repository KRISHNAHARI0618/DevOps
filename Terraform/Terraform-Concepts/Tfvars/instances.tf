resource "aws_instance" "roboshop_tfvars" {
    for_each = var.instances
    ami = var.ami_id
    instance_type = each.value
    tags = {
        Name = each.key
    }
}
resource "aws_route53_record" "roboshop" {
    for_each = aws_instance.roboshop_tfvars
    zone_id = var.zone_id
    name    = "${each.key}.${var.domain}"
    type    = "A"
    ttl     = 300
    records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}
resource "aws_security_group" "roboshop_sggroup" {
    name = var.sg_name
    description = "Allowing to all ports"
    ingress {
        description = "allowing to all tcp port"
        from_port = 0
        to_port =  0
        protocol = "tcp"
        cidr_blocks = var.cidr_range
    }
    egress {
        description = "allowing all traffic to out"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr_range
    }
}