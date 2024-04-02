resource "google_org_policy_custom_constraint" "enable_private_cluster" {
  provider = google-beta

  name         = "custom.gkeEnablePrivateCluster"
  parent       = "organizations/${var.organization_id}"
  display_name = "Enable GKE Private Cluster"
  description  = "Only allow GKE Private Clusters to be created where this custom constraint is enforced."

  action_type    = "ALLOW"
  condition      = "resource.privateClusterConfig.enablePrivateNodes == true"
  method_types   = ["CREATE"]
  resource_types = ["container.googleapis.com/Cluster"]
}
