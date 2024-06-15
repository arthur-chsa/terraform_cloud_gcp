provider "google" {
  project = var.project_id
  region  = var.region
  // credentials = "../keys/key.json"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "project_number" {
  description = "Project number, to associate roles to the service account created to the GCP service."
  type        = number
}

variable "region" {
  description = "region"
  type        = string
}

variable "gcs_bucket_name" {
  description = "GCS used to store DAGs."
  type        = string
}

variable "env_name" {
  description = "Name of the Cloud Composer environment."
  type        = string
}