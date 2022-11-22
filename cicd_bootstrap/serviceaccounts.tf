module "service_account_dev" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = var.dev-project-id
  names = ["terraform-cloud"]
  generate_keys = true
  project_roles = [
    "${var.dev-project-id}=>roles/owner"
  ]
}

module "service_account_qa" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = var.qa-project-id
  names = ["terraform-cloud"]
  generate_keys = true
  project_roles = [
    "${var.qa-project-id}=>roles/owner"
  ]
}

