resource "aws_instance" "servers" {
    # count = 10
    for_each = var.servers
    ami  = var.ami_id
    instance_type = each.value
    tags = {
        Name = each.key
    }
}

resource "aws_route53_record" "server_names" {
  for_each = aws_instance.servers
  zone_id = var.zone_id
  name    = "${each.key}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [each.key == "web" ? each.value.public_ip : each.value.private_ip]
}