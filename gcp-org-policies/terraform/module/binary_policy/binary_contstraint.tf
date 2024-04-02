
locals {

  allowed_condition_rule_list = [
    for k, condition in var.allowed_conditions :
    {
      condition = [condition.condition]
      enforce_policy = "FALSE"
  }]

  denied_condition_rule_list = [
    for k, condition in var.denied_conditions : {
      condition = [condition.condition]
      enforce_policy = "TRUE"
  }]

  rule_enforced = {
    condition      = []
    enforce_policy = var.enforce_policy_ind ? "TRUE" : "FALSE"
  }


  all_rules = flatten([local.allowed_condition_rule_list,
    local.denied_condition_rule_list,
    local.rule_enforced
  ])

  policy_spec = {
    name          = var.name
    resource_list = var.ids
    resource_type = var.scope
    rules         = local.all_rules
  }
}

resource "google_org_policy_policy" "binary_policy" {
  for_each = toset(local.policy_spec.resource_list)
  name     = local.policy_spec.resource_type == "organization" ? "organizations/${each.value}/${local.policy_spec.name}" : (local.policy_spec.resource_type == "folder" ? "folders/${each.value}/${local.policy_spec.name}" : "projects/${each.value}/${local.policy_spec.name}")
  parent   = local.policy_spec.resource_type == "organization" ? "organizations/${each.value}" : (local.policy_spec.resource_type == "folder" ? "folders/${each.value}" : "projects/${each.value}")

  spec {
    dynamic "rules" {

      for_each = [for rules in local.policy_spec.rules : rules if rules != null]
      iterator = rules

      content {

        enforce = rules.value.enforce_policy

        dynamic "condition" {
          for_each = rules.value.condition
          iterator = condition
          content {
            description = condition.value.description
            expression  = condition.value.expression
            title       = condition.value.title
          }
        }

      }
    }
  }
}
