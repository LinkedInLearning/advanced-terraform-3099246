terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.38.0"
    }
  }
}

provider "tfe" {
  # Configuration options
  token = var.tf_cloud_token
}

# provider "google" {
#   project = var.project_id
#   region  = var.region
#   zone    = var.zone
# }