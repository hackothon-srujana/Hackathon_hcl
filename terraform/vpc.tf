# main.tf

# Create a custom VPC network
resource "google_compute_network" "custom_vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false # Set to false to create custom subnets
  routing_mode            = "REGIONAL"
}

# Create a subnetwork within the custom VPC network
resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr_range
  region        = var.region
  network       = google_compute_network.custom_vpc_network.self_link

  # Optional: Enable Private Google Access for this subnetwork
  private_ip_google_access = true
}