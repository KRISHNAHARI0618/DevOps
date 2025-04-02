provider "google" {
  project = "groovy-camera-409915"
  credentials = "${file("credentials.json")}"
  region = "us-central1"
}

resource "google_compute_instance" "firstinst" {
  name = "terraform-instance"
  machine_type = "n1-standard-1"
  zone = "us-central1-a"
  allow_stopping_for_update = true
  network_interface {
    network = google_compute_network.terraform-network.self_link
    subnetwork = google_compute_subnetwork.terraform-subnetwork.self_link
    access_config {

    }
  }
  boot_disk {
    initialize_params {
      image = "debian-11-bullseye-arm64-v20231212"
    }
  }
}
resource "google_compute_network" "terraform-network" {
  name = "my-private-network"
  auto_create_subnetworks = false
}
resource "google_compute_subnetwork" "terraform-subnetwork" {
      name = "terraform-subnetwork"
      ip_cidr_range = "10.20.0.0/16"
      region = "us-central1"
      network = google_compute_network.terraform-network.id
}