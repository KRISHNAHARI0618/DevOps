resource local_file peddireddy1 {
    filename = "sample1.txt"
    content = "I Love Terraform Docker Kubernetes Argo CD"
}
resource local_file peddireddy2 {
    filename = "sample2.txt"
    content = "I Love Terraform Docker Kubernetes Argo CD"
}
resource "local_file" "peddireddy3" {
  filename = "sample3.txt"
  content = "I am an Active Learner and need to Shift Soon"
}
resource "local_file" "peddireddy4" {
  filename = "sample4.txt"
  sensitive_content = "Peddireddy is learning DevOps Course"
  file_permission = 0700
}

# Random providers
resource "local_sensitive_file" "name" {
  filename = "simple5.txt"
  content = "peddireddy is soo fast learner"
  file_permission = "0734"
}
