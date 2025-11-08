resource "google_container_registry" "my_registry" {
  project  = var.project_id # Replace with your GCP project ID
  location = "US"                   # Or ASIA, EU, or leave unspecified for global
}