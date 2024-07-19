project_id = "data-engineering-429904"
region  = "EU"
project_number  = 1053826738853

service_accounts = [
  {
    name        = "sa-group-snapshot"
    display_name = "Service account to act as the group owner of snapshot dataset."
    roles       = []
  },
  {
    name        = "sa-group-staging"
    display_name = "Service account to act as the group owner of staging datasets."
    roles       = []
  },
  {
    name        = "sa-group-mart-data-science"
    display_name = "Service account to act as the group owner of mart data science dataset."
    roles       = []
  },
  {
    name        = "sa-group-mart-product"
    display_name = "Service account to act as the group owner of mart product dataset."
    roles       = []
  },
  {
    name        = "sa-group-mart-finance"
    display_name = "Service account to act as the group owner of mart finance dataset."
    roles       = []
  },
  {
    name        = "sa-group-mart-marketing"
    display_name = "Service account to act as the group owner of mart marketing dataset."
    roles       = []
  },
  {
    name        = "sa-group-mart-engineering"
    display_name = "Service account to act as the group owner of mart engineering dataset."
    roles       = []
  }
]