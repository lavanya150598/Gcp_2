resource "google_org_policy_custom_constraint" "enable_workload_identity" {
  provider = google-beta

  name         = "custom.gkeEnableWorkloadIdentity"
  parent       = "organizations/${var.organization_id}"
  display_name = "Enable GKE workload identity"
  description  = "Ensure workload identity is always enabled where this custom constraint is enforced."

  action_type    = "ALLOW"
  condition      = "has(resource.workloadIdentityConfig.workloadPool) || resource.workloadIdentityConfig.workloadPool.size() > 0"
  method_types   = ["CREATE"]
  resource_types = ["container.googleapis.com/Cluster"]
}