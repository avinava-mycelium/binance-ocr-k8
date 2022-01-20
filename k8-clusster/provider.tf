# Google Cloud Platform Provider
# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = var.project_id
  region  = var.region
  credentials = file("service_account.json")
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer
# resource "random_integer" "int" {
#   min = 100
#   max = 1000000
# }

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.66"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}