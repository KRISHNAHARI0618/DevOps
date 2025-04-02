terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "6.26.0"
    }
  }
}

provider "google" {
  project = "terraform-427604"
  region = "us-central1"
  zone = "us-central1-a"
  credentials = "/Users/harivardhanreddy/Desktop/HariLearn2/DevOps2025/GCP-Terraform/keys-gcp.json"
}