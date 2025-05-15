data "aws_ami" "name" {
    owners = [""]
    name = "linux name"

    filter {
      values = [abs(ls)]
      name = "aws_ami"
    }
  
}


locals {
  name = "asadlk"
  value = "sdsjdks"
  description = " "
  
}
