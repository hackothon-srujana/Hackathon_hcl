
# Enable the Cloud Key Management Service API
resource "google_project_service" "kms_api" {
  service            = "cloudkms.googleapis.com"
  disable_on_destroy = false
}

# Define a Google Cloud KMS KeyRing
resource "google_kms_key_ring" "key_ring" {
  depends_on = [google_project_service.kms_api]
  name       = "gke-keyring"
  location   = "global" # Choose an appropriate location
  project    = "your-gcp-project-id" # Replace with your project ID
}

# Define a Google Cloud KMS CryptoKey within the KeyRing
resource "google_kms_crypto_key" "crypto_key" {
  name            = "crypto-key-example"
  key_ring        = google_kms_key_ring.key_ring.id
  purpose         = "ENCRYPT_DECRYPT"        

  lifecycle {
    # Prevents accidental destruction of the key material
    prevent_destroy = true 
  }
}

# Output the ID of the created CryptoKey
output "crypto_key_id" {
  value = google_kms_crypto_key.crypto_key.id
}

# Output the name of the created KeyRing
output "key_ring_name" {
  value = google_kms_key_ring.key_ring.name
}
