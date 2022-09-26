# Get image
data "google_compute_image" "image" {
  name    = "cos-stable-101-17162-40-5"
  project = "cos-cloud"
}

# Create a single Compute Engine instance
resource "google_compute_instance" "default" {
  name         = "base-test-api"
  machine_type = "e2-micro"
  zone         = var.zone
  tags         = ["ssh"]

  metadata = {
    enable-oslogin = "TRUE"
  }
  boot_disk {
    initialize_params {
      image = data.google_compute_image.image.self_link
    }
  }

  # Install Flask
  metadata_startup_script = "docker run -p 8080:8080 ${var.container_image}"

  network_interface {
    network = "default"

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

# Allow SSH connection
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"

  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  network       = "default"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

# Open port 8080 on the VM
resource "google_compute_firewall" "base-test-api" {
  name    = "base-test-api-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
  source_ranges = ["0.0.0.0/0"]
}
