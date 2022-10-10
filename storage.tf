## BUCKETS
resource "google_storage_bucket" "environment_buckets" {
  for_each = toset(var.environment_list)
  name = "${lower(each.key)}_${var.project-id}"
  location = "US"
  versioning {
    enabled = true
  }
}