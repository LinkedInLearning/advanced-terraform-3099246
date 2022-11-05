module "project-factory-dev" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.0.0"
  # insert the 3 required variables here
  org_id = var.gcp_organization_id
  billing_account = var.gcp_billing_account
  name = "myapp-dev"
  activate_apis = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com"]
}

module "project-factory-qa" {
  source  = "terraform-google-modules/project-factory/google"
  version = "14.0.0"
  # insert the 3 required variables here
  org_id = var.gcp_organization_id
  billing_account = var.gcp_billing_account
  name = "myapp-qa"
  activate_apis = ["iam.googleapis.com", "cloudresourcemanager.googleapis.com"]
}