provider "google" {
  project = var.project_id
  region  = var.region
  credentials = "../keys/key.json"
}

variable "project_id" {
  type        = string
  description = "GCP project id"
}

variable "region" {
  description = "region"
  type        = string
}

variable "datasets_owner" {
  description = "Owner of the data warehouse datasets"
  type        = string
}

variable "datasets" {
  type = list(object({
    dataset             = string
    dataset_group       = string
    description         = string
    authorized_datasets = list(string)
    dataset_labels      = map(string)
  }))
}