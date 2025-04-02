resource "google_compute_network" "myvpc1" {
  name = "my-first-vpc"
  description = "This is creating just to show how it will create in gcp"
  mtu = 1460
  auto_create_subnetworks = false
  network_firewall_policy_enforcement_order = "BEFORE_CLASSIC_FIREWALL"
}
resource "google_compute_subnetwork" "mysubnet1" {
  name = "subnet-name-mysubnet1"
  network = google_compute_network.myvpc1.name
  ip_cidr_range = "10.0.0.0/24"
}