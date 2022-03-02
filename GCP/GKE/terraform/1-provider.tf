# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "xxxxxx"
  region  = "us-central1"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "xxxxxx-tf-state-staging"
    prefix = "terraform/gcp/gke/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
