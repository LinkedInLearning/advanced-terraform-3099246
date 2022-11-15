### PROVIDER
provider "google" {
  project = var.project-id
  region  = var.region
  zone    = var.zone
}

### COMPUTE
## NGINX PROXY
resource "google_compute_instance" "nginx_instance" {
  name         = "nginx-proxy"
  machine_type = var.environment_machine_type[var.target_environment]
  labels = {
    environment = var.environment_map[var.target_environment]
  }
  tags = var.compute-source-tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
    access_config {
  
    }
  }
}

## WEBSERVERS
resource "google_compute_instance" "web-instances" {
  count = 3
  name         = "web${count.index}"
  machine_type = var.environment_machine_type[var.target_environment]
  labels = {
    environment = var.environment_map[var.target_environment]
  }
     boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }
}

## WEBSERVERS-MAP
resource "google_compute_instance" "web-map-instances" {
  for_each = var.environment_instance_settings
  name = "${lower(each.key)}-web"
  machine_type = each.value.machine_type
  labels = each.value.labels

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }  
}

## DB
resource "google_compute_instance" "mysqldb" {
  name         = "mysqldb"
  machine_type = var.environment_machine_type[var.target_environment]
  labels = {
    environment = var.environment_map[var.target_environment]
  }
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
  }  
}