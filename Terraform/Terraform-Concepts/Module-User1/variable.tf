variable "project_name" {
  default = "roboshop-vpc"
}
variable "common_tags" {
    default = {
        Project = "roboshop"
        Terraform = "true"
        Environment = "DEV"
    }
}
variable "cidr_block" {
  default = "10.0.0.0/16"
}
