variable "project" {
  description = "GCP project ID"
  type        = string
  default     = "spartan-apricot-363417"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "zone" {
  type    = string
  default = "us-west1-a"
}

variable "service_name" {
  type    = string
  default = "base-test-api"
}

variable "container_image" {
  description = "Container image containing the service"
  type        = string
  default     = "base-test-api"
}
