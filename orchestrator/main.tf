resource "google_composer_environment" "composer_env" {
  provider  = google-beta
  project   = var.project_id
  name      = var.env_name
  region    = var.region
  config {
    software_config {
      image_version = "composer-2.8.2-airflow-2.7.3"
    }
    workloads_config {
      scheduler {
        cpu        = 0.5
        memory_gb  = 1
        storage_gb = 1
        count      = 1
      }
      web_server {
        cpu        = 0.5
        memory_gb  = 1
        storage_gb = 1
      }
      worker {
        cpu = 0.5
        memory_gb  = 1
        storage_gb = 1
        min_count  = 1
        max_count  = 3
      }
    }
  }
  storage_config {
    bucket = var.gcs_bucket_name
  }
}