variable "con" {
  # description = "Enter content of demo.txt file"
  type = string
}
resource "local_file" "demo" {
  content = var.con
  filename  = "demo.txt"
}