resource "local_file" "file1" {
  filename = "file1.txt"
  content = "file is open"

}

variable "regions" {
  type = list(string)
  default = [ "hari" , "vardhan","reddy" ]

}
output "file1" {
  value = join("-",var.regions)
}

variable "names" {
  type = string
  default = "Peddireddy hari vardhan reddy"
}
output "file2" {
  value = split(" ",var.names)
}

