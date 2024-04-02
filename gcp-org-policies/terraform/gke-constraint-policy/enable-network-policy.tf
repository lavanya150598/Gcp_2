resource "google_org_policy_custom_constraint" "enable_network_policy" {
  provider = google-beta

  name         = "custom.gkeEnableNetworkPolicy"
  parent       = "organizations/${var.organization_id}"
  display_name = "Enable GKE network policy"
  description  = "Ensure network policy is always enabled where this custom constraint is enforced."

  action_type    = "ALLOW"
  condition      = "resource.addonsConfig.networkPolicyConfig.disabled == false || resource.networkConfig.datapathProvider == 'ADVANCED_DATAPATH'"
  method_types   = ["CREATE"]
  resource_types = ["container.googleapis.com/Cluster"]
}