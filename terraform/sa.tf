#resource "google_service_account" "terraform_service_account" {
  #account_id   = "terraform-sa"
  #display_name = "Service Account for Terraform"
  #description  = "This service account is managed by Terraform."
 # project      = var.project_id
#}

resource "google_service_account" "githubcicd_service_account" {
  account_id   = "githubcicd-sa"
  display_name = "Service Account for Github actions for build and push"
  description  = "This service account is managed by Terraform."
  project      = var.project_id
}

# Grant a project-level role to the Service Account
resource "google_project_iam_member" "sa_iam_member_gar" {
  project = var.project_id
  role    = "roles/artifactregistry.admin"         
  member  = "serviceAccount:${google_service_account.githubcicd_service_account.email}"
}

# Grant a project-level role to the Service Account
resource "google_project_iam_member" "sa_iam_member_container" {
  project = var.project_id
  role    = "roles/container.admin"         
  member  = "serviceAccount:terraform-sa@glass-sylph-477607-e9.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "sa_iam_member_service" {
  project = var.project_id
  role    = "roles/iam.serviceAccountUser"         
  member  = "serviceAccount:terraform-sa@glass-sylph-477607-e9.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "sa_iam_member_kms" {
  project = var.project_id
  role    = "roles/cloudkms.admin"         
  member  = "serviceAccount:terraform-sa@glass-sylph-477607-e9.iam.gserviceaccount.com"
}



resource "google_project_iam_member" "sa_iam_member_kms_vpcs" {
  project = var.project_id
  role    = "roles/compute.networkAdmin"         
  member  = "serviceAccount:terraform-sa@glass-sylph-477607-e9.iam.gserviceaccount.com"
}

resource "google_service_account" "gke_service_account" {
  account_id   = "gke-sa"
  display_name = "Service Account for Terraform"
  description  = "This service account is managed by Terraform."
  project      = var.project_id
}

# Grant a project-level role to the Service Account
resource "google_project_iam_member" "sa_iam_member" {
  project = var.project_id
  role    = "roles/container.admin"         
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}
# (Optional) Create a Service Account Key
#resource "google_service_account_key" "service_account_key" {
  #service_account_id = google_service_account.terraform_service_account.name
 # public_key_type    = "GOOGLE_CREDENTIALS_FILE" 
#}
