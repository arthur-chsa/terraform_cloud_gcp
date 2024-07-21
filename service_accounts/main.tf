resource "google_service_account" "service_accounts" {
  for_each    = { for sa in var.service_accounts : sa.name => sa }
  account_id   = each.key
  display_name = each.value.display_name
}

locals {
  service_account_roles = flatten([
    for sa in var.service_accounts : [
      for role in sa.roles : {
        account_id = sa.name
        role       = role
      }
    ]
  ])
}

resource "google_project_iam_member" "service_account_roles" {
  for_each = {
    for sar in local.service_account_roles : "${sar.account_id}-${sar.role}" => sar
  }
  project = var.project_id
  role    = each.value.role
  member  = "serviceAccount:${google_service_account.service_accounts[each.value.account_id].email}"
}