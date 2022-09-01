### PROVIDER
provider "google" {
  project = "advancedterraform"
  region  = "us-central1"
  zone    = "us-central1-a"
}

### NETWORK
## SUBNET
resource "google_compute_network" "default" {
  name                    = "default"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "default" {
  name                     = "subnet1"
  ip_cidr_range            = "10.127.0.0/20"
  network                  = google_compute_network.default.self_link
  region                   = "us-central1-a"
  private_ip_google_access = true
}

resource "google_compute_firewall" "default" {
  name    = "test-firewall"
  network = google_compute_network.default.self_link

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "1000-2000", "22"]
  }

  source_tags = ["web"]
}

### COMPUTE
## NGINX PROXY
resource "google_compute_instance" "nginx_instance" {
  name         = "nginx-proxy"
  machine_type = "f1-micro"
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.default.self_link
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
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.default.self_link
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
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.default.self_link
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
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = google_compute_network.default.self_link
    subnetwork = google_compute_subnetwork.default.self_link
    access_config {
  
    }
  }
}
