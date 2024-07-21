# terraform_cloud_gcp

## Project structure

- One workspace for each service / environment. For example:
  - gcp_groups_dev
  - gcp_groups_prod
  - data_warehouse_dev
  - data_warehouse_prod
- The resources files and variable definition files are the same through environments;
- The file with variable values are specific for each environment.

## Workspaces
- service_accounts:
  - Create service accounts (On this project,the service accounts represent groups, since no organizations are being used);
  - Assign roles to the service accounts.
- service_permissions:
  - Assign roles to the service accounts that run GCP services, according to the needs of the project.
- data_warehouse:
  - Creates the DW datasets on BigQuery;
  - Adds one same service account as the owner of the datasets;
  - Adds basic permissions to business owners of each dataset, so they can use BigQuery;
  - For each dataset, assign authorised datasets;
  - For each dataset, adds viewer permissions to the business owners.
- orchestrator_bucket:
  - Creates the bucket to be used by the Cloud Composer environment (created separately to avoid dependencies with the rest of the environment, which is very slow).
- orchestrator:
  - Creates the Cloud Composer environment.

## Initial setup

### On GCP
- Create a project and check its ID.
- Navitage to Settings and check the project number.
- Create a service account to execute Terraform operations. 
- For that service account, create a key and download the JSON file with it.
- Go to Service & APIs and enable the following APIs:
  - IAM;
  - Cloud Resource Manager;
  - Cloud Composer;
- Create a role with the permissions needed to run the actions we will execute with Terraform:
  - Permissions needed to run gcp_groups workspace:
    - Permissions to Terraform service account:
      - iam.serviceAccounts.create
      - iam.serviceAccounts.delete
      - iam.serviceAccounts.get
  - Permissions needed to run data_warehouse workspace:
    - Permissions to Terraform service account:
      - bigquery.datasets.create
      - bigquery.datasets.get
      - bigquery.datasets.delete
      - bigquery.datasets.update
      - resourcemanager.projects.getIamPolicy
      - resourcemanager.projects.setIamPolicy
  - Permissions needed to run orchestrator workspace (the roles to the service account are under review):
    - Permissions to Terraform service account:
      - storage.buckets.create
      - storage.buckets.get
      - storage.buckets.delete
      - iam.serviceAccounts.getIamPolicy
      - iam.serviceAccounts.setIamPolicy
      - iam.serviceAccounts.actAs
      - Role: Cloud Composer API Service Agent
      - Role: Cloud Composer v2 API Service Agent Extension
      - Role: Composer Administrator
      - Role: Composer Shared VPC agent
      - Role: Composer Worker
      - Role: Container Registry Service Agent
      - Role: Environment and Storage Object Administrator
      - Role: Service Account User
      - Role: Terraform bigquery executor
    - Permissions to service agent "service-[PROJECT_NUMBER]@cloudcomposer-accounts.iam.gserviceaccount.com":
      - Role: Cloud Composer API Service Agent
      - Role: Cloud Composer v2 API Service Agent Extension
    - Permissions to service agent "service-[PROJECT_NUMBER]@compute-system.iam.gserviceaccount.com":
      - Role: Compute Engine Service Agent
    - Permissions to service agent "service-[PROJECT_NUMBER]@container-engine-robot.iam.gserviceaccount.com":
      - Role: Kubernetes Engine Service Agent
    - Permissions to service agent "[PROJECT_NUMBER]-compute@developer.gserviceaccount.com
      - Role: Composer Worker.
- Assign the role to the Terraform service account;
- Create a service account to be the owner of the data warehouse objects and assign the role BigQuery Admin;
- 

### On the tfvars files
- Fill in the project ID and project number where needed, according to your project data;
- Fill in some bucket name and orchestrator environment name, making sure you're using the same bucket name in the bucket creation and the orchestrator configuration.
- Fill in the data warehouse owner service account.


## Configurations on Terraform Cloud

- For each folder, create a workspace on Terraform Cloud;

### Authentication
- Add a environment variable TF_CLI_ARGS_plan to each workspace, with the value "-var-file="./dev.auto.tfvars"", replacing dev for the correct environment, when necessary;
- Add a sensitive environment variable GOOGLE_CREDENTIALS with the JSON containing the service account with permissions to create GCP infrastructure.