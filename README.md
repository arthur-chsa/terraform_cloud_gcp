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
- gcp groups:
  - Create service accounts, used in this project to represent groups;
  - Assign roles to the service accounts.
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

## Configurations on Terraform Cloud

### Authentication
- Add the environment variable TF_CLI_ARGS_plan to each workspace, with the value "-var-file="./dev.auto.tfvars"", replacing dev for the correct environment, when necessary;
- Add the environment variable GOOGLE_CREDENTIALS with the JSON containing the service account with permissions to create GCP infrastructure.
- The Terraform operations are being executed with a service account on a separate project. In the target project, the permissions and role needed were added to that account.
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