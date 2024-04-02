module "deny_iam_constraint" {
  source              = "../module/custom_iam_deny_constraint"
  for_each            = var.iam_deny_constraint
  organization_id     = var.organization_id
  iam_deny_constraint = each.value
}
