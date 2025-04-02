locals {
  azs = slice(data.aws_availability_zones.available,0,2)
}
output "azs"{
    value = local.azs
}