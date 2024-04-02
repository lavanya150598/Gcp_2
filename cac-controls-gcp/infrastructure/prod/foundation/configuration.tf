terraform {
  # backend "remote" {}
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.50"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.50"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4"
    }
  }
}

provider "google" {
  project = "terraform-bootstrap-375917"
  region  = "us-east1"
}

provider "google-beta" {
  project = "terraform-bootstrap-375917"
  region  = "us-east2"
}

