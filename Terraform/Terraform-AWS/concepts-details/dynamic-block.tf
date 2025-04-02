# Dynamic Block is used to create the repatative configuration inside the resources,providers,data,provisioner
# It is used as Nested Blocks inside one block
# for and for_each is used to create the entire resources and its names but dynamic is used inside the resources block

resource "aws_instance" "jenkins" {
  ami = "ami-0f3c7d07486cad139"
  instance_type = "t2.micro"
  tags = var.name == "peddireddy" ? "t2.micro" : "t3.medium"
  security_groups = [ aws_security_group.allow-all.name ]
}
resource "aws_security_group" "allow-all" {
  # vpc_id = aws_vpc.mainvpc.id
  name = "allow-all"
  description = "This is First Security Group"
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
          protocol  = ingress.value["description"]
          self      = true
          from_port = ingress.value.from_port
          to_port   = ingress.value.to_port
          cidr_blocks = var.sg_cidr
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.sg_cidr
  }

}