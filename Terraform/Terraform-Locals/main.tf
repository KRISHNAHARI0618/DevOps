resource "local_file" "demo"{
    content = var.con
    filename = "demo.txt"
}