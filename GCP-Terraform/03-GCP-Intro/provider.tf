
terraform {
  required_providers {
    google = {
        version = "6.25.0"
        source = "hashicorp/google"
    }
  }
}
provider "google" {
  project = "terraform-427604"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "/Users/harivardhanreddy/Desktop/HariLearn2/DevOps2025/GCP-Terraform/keys-gcp.json"
}

resource "google_storage_bucket"  "firstbucket"{
    name = "cahdgsuqwldpwydklsnchusou"
    location = "us"
}

