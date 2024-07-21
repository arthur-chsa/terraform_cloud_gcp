project_id     = "data-engineering-429904"
region         = "EU"
datasets_owner = "data-warehouse-owner@data-engineering-429904.iam.gserviceaccount.com"
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
        authorized_datasets = ["staging_product", "staging_finance", "staging_marketing", "staging_data_science", "staging_engineering"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "staging_data_science"
        dataset_group = ""
        description = "Staging_data_science dataset"
        authorized_datasets = ["mart_data_science"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "staging_product"
        dataset_group = ""
        description = "Staging_product dataset"
        authorized_datasets = ["mart_product"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "staging_finance"
        dataset_group = ""
        description = "Staging_finance dataset"
        authorized_datasets = ["mart_finance"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "staging_marketing"
        dataset_group = ""
        description = "Staging_marketing dataset"
        authorized_datasets = ["mart_marketing"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "staging_engineering"
        dataset_group = ""
        description = "Staging_engineering dataset"
        authorized_datasets = ["mart_engineering"]
        dataset_labels = {"team": "data_engineering"}
    },
    {
        dataset = "mart_data_science"
        dataset_group = "sa-group-mart-data-science@data-warehouse-418420.iam.gserviceaccount.com"
        description = "Mart_data_science dataset - testing change one"
        authorized_datasets = []
        dataset_labels = {"team": "data_science"}
    },
    {
        dataset = "mart_product"
        dataset_group = "sa-group-mart-product@data-warehouse-418420.iam.gserviceaccount.com"
        description = "Mart_product dataset"
        authorized_datasets = []
        dataset_labels = {"team": "product"}
    },
    {
        dataset = "mart_finance"
        dataset_group = "sa-group-mart-finance@data-warehouse-418420.iam.gserviceaccount.com"
        description = "Mart_finance dataset"
        authorized_datasets = []
        dataset_labels = {"team": "finance"}
    },
    {
        dataset = "mart_marketing"
        dataset_group = "sa-group-mart-marketing@data-warehouse-418420.iam.gserviceaccount.com"
        description = "Mart_marketing dataset"
        authorized_datasets = []
        dataset_labels = {"team": "marketing"}
    },
    {
        dataset = "mart_engineering"
        dataset_group = "sa-group-mart-engineering@data-warehouse-418420.iam.gserviceaccount.com"
        description = "Mart_engineering dataset"
        authorized_datasets = []
        dataset_labels = {"team": "engineering"}
    }
]