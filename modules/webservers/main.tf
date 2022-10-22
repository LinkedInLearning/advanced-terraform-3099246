### PROVIDER
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

locals {
    prefix = var.prefix != "" ? "${var.prefix}-" : ""
}

resource "google_compute_instance" "web-instances" {
    for_each = var.server_settings
    project = var.project_id
    name = "${local.prefix}${lower(each.key)}" 
    machine_type = each.value.machine_type
    labels = each.value.labels
    
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {
        network = var.network_interface.network
        subnetwork = var.network_interface.subnetwork
    }
}