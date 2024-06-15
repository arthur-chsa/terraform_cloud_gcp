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

variable "service_accounts" {
  description = "List of service accounts to create."
  type = list(object({
    name          = string
    display_name  = string
    roles         = list(string)
  }))
}
