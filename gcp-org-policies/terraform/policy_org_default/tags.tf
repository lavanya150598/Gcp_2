# Run ingress tags
resource "google_tags_tag_key" "all_users_ingress_key" {
  parent      = "organizations/${var.organization_id}"
  short_name  = "allUsersIngress"
  description = "Key to allow public Ingress for Cloud Run"
}

resource "google_tags_tag_value" "all_users_ingress_value" {
  parent      = "tagKeys/${google_tags_tag_key.all_users_ingress_key.name}"
  short_name  = "true"
  description = "Tag key Value for public ingress for Cloud Run"
}

resource "google_tags_tag_key" "run_lb_ingress_key" {
  parent      = "organizations/${var.organization_id}"
  short_name  = "runLBIngress"
  description = "Key to allow load balancer ingress for Cloud Run"
}

resource "google_tags_tag_value" "run_lb_ingress_value" {
  parent      = "tagKeys/${google_tags_tag_key.run_lb_ingress_key.name}"
  short_name  = "true"
  description = "Tag key Value to allow load balancer for ingress Cloud Run"
}

resource "google_tags_tag_key" "run_all_ingress_key" {
  parent      = "organizations/${var.organization_id}"
  short_name  = "runAllIngress"
  description = "Key to allow all ingress for Cloud Run"
}

resource "google_tags_tag_value" "run_all_ingress_value" {
  parent      = "tagKeys/${google_tags_tag_key.run_all_ingress_key.name}"
  short_name  = "true"
  description = "Tag key Value to allow all ingress for Cloud Run"
}

# SQL authorized networks tag
resource "google_tags_tag_key" "sql_authorized_networks_key" {
  parent      = "organizations/${var.organization_id}"
  short_name  = "allowSqlAuthorizedNetworks"
  description = "Key to allow authorized networks for cloud sql to permit non rfc1918"
}

resource "google_tags_tag_value" "sql_authorized_networks_value" {
  parent      = "tagKeys/${google_tags_tag_key.sql_authorized_networks_key.name}"
  short_name  = "true"
  description = "Tag key Value to allow authorized networks for cloud sql to permit non rfc1918"
}

# Service Account Key Tags
resource "google_tags_tag_key" "allow_sa_key_creation_key" {
  parent      = "organizations/${var.organization_id}"
  short_name  = "allowServiceAccountKeyCreation"
  description = "Allow creation of service account key creation via Org Policy Condition"
}

resource "google_tags_tag_value" "allow_sa_key_creation_value" {
  parent      = "tagKeys/${google_tags_tag_key.allow_sa_key_creation_key.name}"
  short_name  = "true"
  description = "Tag key value to allow creation of service account key creation via Org Policy Condition"
}

resource "google_tags_tag_key" "exempt_sa_key_rotation" {
  parent      = "organizations/${var.organization_id}"
  short_name  = "exemptKeyRotation"
  description = "Exempt project from service account key rotation automation"
}

resource "google_tags_tag_value" "exempt_sa_key_rotation_value" {
  parent      = "tagKeys/${google_tags_tag_key.exempt_sa_key_rotation.name}"
  short_name  = "true"
  description = "Tag key value to Exempt project from service account key rotation automation"
}

# Firebase Tags
resource "google_tags_tag_key" "firebase_project_tag" {
  parent      = "organizations/${var.organization_id}"
  short_name  = "firebaseProjectInd"
  description = "Firebase Project Indicator"
}

resource "google_tags_tag_value" "firebase_project_value" {
  parent      = "tagKeys/${google_tags_tag_key.firebase_project_tag.name}"
  short_name  = "true"
  description = "Tag key value to indicate that the project hosts a Firebase project"
}

