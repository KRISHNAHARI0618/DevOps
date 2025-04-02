resource "null_resource" "example" {
  triggers = {
    timestamp = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo Hello, Terraform!"
  }
}

