module "project-factory-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.0.0"
  org_id = var.gcp_organization_id
  billing_account = var.gcp_billing_account
  name = "myapp-dev"
  random_project_id = true
  activate_apis = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com"]
}

module "project-factory-qa" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.0.0"
  org_id = var.gcp_organization_id
  billing_account = var.gcp_billing_account
  name = "myapp-qa"
  random_project_id = true
  activate_apis = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com"]
}

module "dev_service_account" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = module.project-factory-dev.project_id
  prefix        = "tfcloud-devproject"
  names = ["dev"]
  generate_keys = true
}

resource "google_service_account_iam_member" "dev-owner" {
    service_account_id = module.dev_service_account.service_accounts_map["dev"].name
    role = "roles/owner"
    member = "serviceAccount:${module.dev_service_account.service_accounts_map["dev"].email}"
}

module "qa_service_account" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = module.project-factory-qa.project_id
  prefix        = "tfcloud-qaproject"
  names = ["qa"]
  generate_keys = true
}

resource "google_service_account_iam_member" "qa-owner" {
    service_account_id = module.qa_service_account.service_accounts_map["qa"].name
    role = "roles/owner"
    member = "serviceAccount:${module.qa_service_account.service_accounts_map["qa"].email}"
}