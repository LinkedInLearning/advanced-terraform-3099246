### VARIABLES
variable "project-id" {
  type = string
}

variable "region" {
  type = string
  default = "us-central1"
}

variable "zone" {
  type = string
  default = "us-central1-a"
}

variable "subnet-name" {
  type = string
  default = "subnet1"
}

variable "subnet-cidr" {
  type = string
  default = "10.127.0.0/20"
}

variable "private_google_access" {
  type = bool
  default = true
}

### PROVIDER
provider "google" {
  project = var.project-id
  region  = var.region
  zone    = var.zone
}

### NETWORK
data "google_compute_network" "default" {
  name                    = "default"
}

## SUBNET
resource "google_compute_subnetwork" "subnet-1" {
  name                     = var.subnet-name
  ip_cidr_range            = var.subnet-cidr
  network                  = data.google_compute_network.default.self_link
  region                   = var.region
  private_ip_google_access = var.private_google_access
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = data.google_compute_network.default.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = var.firewall-ports
  }

  source_tags = var.firewall-tags
}

### COMPUTE
## NGINX PROXY
resource "google_compute_instance" "nginx_instance" {
  name         = "nginx-proxy"
  machine_type = "f1-micro"
  
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

## WEB1
resource "google_compute_instance" "web1" {
  name         = "web1"
  machine_type = "f1-micro"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = data.google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.subnet-1.self_link
    access_config {
  
    }
  }
}
## WEB2
resource "google_compute_instance" "web2" {
  name         = "web2"
  machine_type = "f1-micro"
  
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
## WEB3
resource "google_compute_instance" "web3" {
  name         = "web3"
  machine_type = "f1-micro"
  
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

## DB
resource "google_compute_instance" "mysqldb" {
  name         = "mysqldb"
  machine_type = "f1-micro"
  
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