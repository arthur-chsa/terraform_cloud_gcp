project_id     = "data-warehouse-dev-450118"
region         = "EU"
datasets_owner = "data-warehouse-owner@data-warehouse-dev-450118.iam.gserviceaccount.com"
datasets = [
    {
        dataset = "snapshot"
        dataset_group = ""
        description = "Snapshots dataset"
        authorized_datasets = ["staging"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "staging"
        dataset_group = ""
        description = "Staging dataset"
        authorized_datasets = ["mart_product", "mart_finance", "mart_marketing"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "mart_product"
        dataset_group = "sa-group-product@admin-450118.iam.gserviceaccount.com"
        description = "Mart_product dataset"
        authorized_datasets = []
        dataset_labels = {"team": "product"}
    },
    {
        dataset = "mart_finance"
        dataset_group = "sa-group-finance@admin-450118.iam.gserviceaccount.com"
        description = "Mart_finance dataset"
        authorized_datasets = []
        dataset_labels = {"team": "finance"}
    },
    {
        dataset = "mart_marketing"
        dataset_group = "sa-group-marketing@admin-450118.iam.gserviceaccount.com"
        description = "Mart_marketing dataset"
        authorized_datasets = []
        dataset_labels = {"team": "marketing"}
    }
]