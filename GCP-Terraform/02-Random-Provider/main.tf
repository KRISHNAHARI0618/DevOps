resource "random_bytes" "simple6" {
  length = 64
  
}
resource "local_file" "simple7" {
    content = random_bytes.simple6.length
    filename = "simple7.txt"
}
resource "random_integer" "simple8" {
  min = 100
  max = 200

}

output "randomNumber" {
  value = random_integer.simple8.id
}

resource "local_file" "name1" {
  content = var.var1
  filename = "name1.txt"
}
resource "local_file" "name2" {
  content = var.a1
  filename = "name2.txt"
}

resource "local_file" "name3" {
  filename = "session.txt"
  content = var.b.name
}
resource "local_file" "name4" {
  filename = "session.txt"
  content = var.d
}

resource "random_string" "name7" {
  length = 2000
}

resource "local_file" "name8" {
  filename = "sessions.txt"
  content = "This is first Implicit String ${random_string.name7.id}"

}

resource "random_integer" "name9" {
  min = 102
  max = 200
  lifecycle {
    # prevent_destroy = true
    ignore_changes = [ min ]
  }
}

data "local_file" "name10" {
  filename = "sessions.txt"
  depends_on = [ local_file.name8 ]
}

output "name11" {
  value = data.local_file.name10.content
}



