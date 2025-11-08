# variables.tf

variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region for the network and subnetwork."
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "The name of the custom VPC network."
  type        = string
  default     = "custom-vpc"
}

variable "subnet_name" {
  description = "The name of the subnetwork."
  type        = string
  default     = "gke-subnet"
}

variable "subnet_cidr_range" {
  description = "The IP CIDR range for the subnetwork."
  type        = string
  default     = "10.0.0.0/27"
}