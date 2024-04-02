resource "google_org_policy_custom_constraint" "enable_auto_upgrade" {
  provider = google-beta

  name         = "custom.gkeEnableAutoUpgrade"
  parent       = "organizations/${var.organization_id}"
  display_name = "Enable node auto upgrade"
  description  = "All node pools must have node auto-upgrade enabled."

  action_type    = "ALLOW"
  condition      = "resource.management.autoUpgrade == true"
  method_types   = ["CREATE"]
  resource_types = ["container.googleapis.com/NodePool"]
}