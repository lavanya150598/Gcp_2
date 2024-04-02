terraform {
  required_version = "1.1.7"
  backend "gcs" {
    bucket = "tf-state-org-policy-pr-6818c0"
    prefix = "terraform/pr/gke-contraint-policy"
  }
}