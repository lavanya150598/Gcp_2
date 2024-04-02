resource "google_org_policy_custom_constraint" "enable_binary_authorization" {
  provider = google-beta

  name         = "custom.gkeEnableBinaryAuthorization"
  parent       = "organizations/${var.organization_id}"
  display_name = "Enable GKE Binary Authorization"
  description  = "Ensure binary authorization is always enabled where this custom constraint is enforced."

  action_type    = "ALLOW"
  condition      = "resource.binaryAuthorization.enabled == true"
  method_types   = ["CREATE"]
  resource_types = ["container.googleapis.com/Cluster"]
}
