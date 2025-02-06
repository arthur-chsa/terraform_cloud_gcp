project_id = "admin-450118"
region  = "EU"

service_accounts = [
  {
    name        = "sa-group-product"
    display_name = "Service account to act as the group owner of mart product dataset."
    roles       = []
  },
  {
    name        = "sa-group-finance"
    display_name = "Service account to act as the group owner of mart finance dataset."
    roles       = []
  },
  {
    name        = "sa-group-marketing"
    display_name = "Service account to act as the group owner of mart marketing dataset."
    roles       = []
  }
]