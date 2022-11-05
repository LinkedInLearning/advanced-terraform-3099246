module "project-factory-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.0.0"
  org_id = var.gcp_organization_id
  billing_account = var.gcp_billing_account
  name = "myapp-dev"
  random_project_id = true
  activate_apis = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com"]
  auto_create_network = true
}

module "project-factory-qa" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.0.0"
  org_id = var.gcp_organization_id
  billing_account = var.gcp_billing_account
  name = "myapp-qa"
  random_project_id = true
  activate_apis = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com"]
  auto_create_network = true
}

module "dev_service_account" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = module.project-factory-dev.project_id
  prefix        = "tfcloud-devproject"
  names = ["dev"]
  generate_keys = true
}

resource "google_project_iam_member" "dev-owner" {
    project = module.project-factory-dev.project_id
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

resource "google_project_iam_member" "qa-owner" {
    project = module.project-factory-qa.project_id
    role = "roles/owner"
    member = "serviceAccount:${module.qa_service_account.service_accounts_map["qa"].email}"
}