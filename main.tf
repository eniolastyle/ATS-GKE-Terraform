# Data
data "google_compute_network" "vpc" {
  name = "default"
}

data "google_compute_subnetwork" "subnet" {
  name   = "default"
  region = "us-central1"
}

# GKE cluster
resource "google_container_cluster" "primary" {
  name     = "${var.project_id}-gke"
  location = var.region

  network    = data.google_compute_network.vpc.name
  subnetwork = data.google_compute_subnetwork.subnet.name

  # Enabling Autopilot for this cluster
  enable_autopilot = true
}

# Artifact Registry
resource "google_artifact_registry_repository" "image-repo" {
  location      = var.artifact-config["region"]
  repository_id = var.artifact-config["repository_id"]
  description   = "Created by terraform"
  format        = "DOCKER"
}

# Service Accout
resource "google_service_account" "gha-superuser" {
  account_id   = "gha-superuser"
  display_name = "GitHub Actions Superuser Service Account"
  project      = "${var.project_id}"
}

resource "google_project_iam_binding" "artifact_registry_writer" {
  project = "${var.project_id}"
  role    = "roles/artifactregistry.writer"

  members = [
    "serviceAccount:${google_service_account.gha-superuser.email}",
  ]
}

resource "google_project_iam_binding" "kubernetes_engine_developer" {
  project = "${var.project_id}"
  role    = "roles/container.developer"

  members = [
    "serviceAccount:${google_service_account.gha-superuser.email}",
  ]
}

# Outputs
output "service_account_email" {
  value = google_service_account.gha-superuser.email
}

output "kubernetes_cluster_host" {
  value = google_container_cluster.primary.endpoint
}

output "kubernetes_cluster_name" {
  value = google_container_cluster.primary.name
}
