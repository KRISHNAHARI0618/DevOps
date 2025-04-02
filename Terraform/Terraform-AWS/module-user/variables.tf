variable "ami_id" {
  type = string
  default = "ami-0f3c7d07486cad139"
  description = "This is Default variable Value for ami_id"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
  description = "This is default variable value for instance type"
}
variable "tags" {
  type = string
  default = "peddireddy"
  description = "this is default tags "
  sensitive = true
  
}