resource "aws_instance" "demo2" {
    count = 10
    ami = "ami-03265a0778a880afb"
    instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" ? "t3.medium" : "t2.micro"
    tags = {
        Name = var.instance_names[count.index]
    }
    
}

resource "aws_route53_record" "record" {
    count = 10
    zone_id = var.zone_id
    name    = "${var.instance_names[count.index]}.${var.domain}"
    type    = "A"
    ttl     = 300
    records = [aws_instance.demo2[count.index].private_ip]
}
