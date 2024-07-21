resource "google_project_iam_member" "service_agent_role" {
  provider = google-beta
  project  = var.project_id
  member   = "serviceAccount:service-${var.project_number}@cloudcomposer-accounts.iam.gserviceaccount.com"
  role     = "roles/composer.ServiceAgentV2Ext"
}