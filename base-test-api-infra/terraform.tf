terraform {
  backend "local" {}

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.37.0"
    }
  }
}

provider "google" {
  project = var.project
  # Configuration options
}
