variable "gke_username" {
  default     = ""
  description = "gke username"
}

variable "gke_password" {
  default     = ""
  description = "gke password"
}

variable "credentials" {
  description = ""
}

variable "project_id" {
  description = ""
}

variable "region" {
  description = ""
}

variable "artifact-config" {
  type        = map(any)
  description = "Configuration for artifact"
  default = {
    region        = ""
    repository_id = ""
  }
}
