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