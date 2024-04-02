resource "google_org_policy_custom_constraint" "disable_default_service_account" {
  provider = google-beta

  name         = "custom.gkeDisableDefaultServiceAccount"
  parent       = "organizations/${var.organization_id}"
  display_name = "Disable default compute service account"
  description  = "All node pools must use a custom service account."

  action_type    = "DENY"
  condition      = "resource.config.serviceAccount.endsWith('developer.gserviceaccount.com')"
  method_types   = ["CREATE"]
  resource_types = ["container.googleapis.com/NodePool"]
}