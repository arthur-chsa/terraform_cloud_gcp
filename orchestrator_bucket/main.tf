resource "google_storage_bucket" "composer_bucket" {
  name     = var.gcs_bucket_name
  project  = var.project_id
  location = var.region
  force_destroy = true
}