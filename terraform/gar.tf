

# Enable the Artifact Registry API
resource "google_project_service" "artifact_registry" {
  service                    = "artifactregistry.googleapis.com"
  disable_on_destroy         = false
}

# Create the Artifact Registry repository
resource "google_artifact_registry_repository" "my_repo" {
  depends_on = [google_project_service.artifact_registry] 

  repository_id = "java-app"
  location      = "us-central1"
  format        = "DOCKER"
  description   = "My private Docker repository"

}


