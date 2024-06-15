provider "google" {
  project = var.project_id
  region  = var.region
  // credentials = "../keys/key.json"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "region" {
  description = "region"
  type        = string
}

variable "gcs_bucket_name" {
  description = "GCS used to store DAGs."
  type        = string
}