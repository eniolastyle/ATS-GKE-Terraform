terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0"
    }
  }
  required_version = ">= 1.5"
  backend "gcs" {
    bucket      = "terraformatsbuck"
    prefix      = "terraform/state" 
  }
}

provider "google" {
  credentials = file("${var.credentials}")
  project     = var.project_id
  region      = var.region
}

