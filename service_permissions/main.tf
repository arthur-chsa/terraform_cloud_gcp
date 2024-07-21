resource "google_project_iam_member" "composer_1" {
  provider = google-beta
  project  = var.project_id
  member   = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
  role     = "roles/composer.ServiceAgentV2Ext"
}

resource "google_project_iam_member" "composer_2" {
  provider = google-beta
  project  = var.project_id
  member   = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
  role     = "roles/composer.serviceAgent"
}

resource "google_project_iam_member" "composer_3" {
  provider = google-beta
  project  = var.project_id
  member   = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
  role     = "roles/storage.objectViewer"
}

resource "google_project_iam_member" "compute_1" {
  provider = google-beta
  project  = var.project_id
  member   = "serviceAccount:service-${var.project_number}@compute-system.iam.gserviceaccount.com"
  role     = "roles/compute.serviceAgent"
}

resource "google_project_iam_member" "container_1" {
  provider = google-beta
  project  = var.project_id
  member   = "serviceAccount:service-${var.project_number}@container-engine-robot.iam.gserviceaccount.com"
  role     = "roles/container.serviceAgent"
}