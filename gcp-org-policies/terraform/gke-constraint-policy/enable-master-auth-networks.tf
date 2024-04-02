resource "google_org_policy_custom_constraint" "enable_master_auth_networks" {
  provider = google-beta

  name         = "custom.gkeEnableMasterAuthorizedNetworks"
  parent       = "organizations/${var.organization_id}"
  display_name = "Enable GKE Master Authorized Networks"
  description  = "Ensure master authorized networks is always enabled where this custom constraint is enforced."

  action_type    = "ALLOW"
  condition      = "resource.masterAuthorizedNetworksConfig.enabled == true"
  method_types   = ["CREATE"]
  resource_types = ["container.googleapis.com/Cluster"]
}
