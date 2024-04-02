locals {
  denied_roles = replace("[${join(",", [for s in var.iam_deny_constraint.denied_roles : format("%q", s)])}]", "\"", "'")
}

resource "google_org_policy_custom_constraint" "deny_bigQuery_roles" {
  provider       = google-beta
  name           = var.iam_deny_constraint.name
  parent         = "organizations/${var.organization_id}"
  display_name   = var.iam_deny_constraint.display_name
  description    = var.iam_deny_constraint.description
  action_type    = "DENY"
  condition      = "resource.bindingDeltas.exists(delta, delta.action == 'ADD' && delta.role in ${local.denied_roles})"
  method_types   = ["CREATE", "UPDATE"]
  resource_types = ["iam.googleapis.com/AllowPolicy"]
}