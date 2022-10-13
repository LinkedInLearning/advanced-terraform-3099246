### PROVIDER
provider "google" {
  project = var.project-id
  region  = var.region
  zone    = var.zone
}

resource "google_storage_bucket" "environment_buckets" {
  name = "remotestate_${var.project-id}"
  location = "US"
  versioning {
    enabled = true
  }
}