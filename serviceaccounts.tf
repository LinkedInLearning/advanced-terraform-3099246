## SERVICE ACCOUNTS
module "service_accounts" {
  source        = "terraform-google-modules/service-accounts/google"
  project_id    = var.project-id
  prefix        = "viewer-sa"
  names         = [for s in var.environment_list: lower(s)]
  project_roles = [
    "${var.project-id}=>roles/viewer",
    "${var.project-id}=>roles/storage.objectViewer",
  ]
}