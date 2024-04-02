locals {

  allowed_condition_rule_list = [
    for k, condition in var.allowed_conditions :
    {
      allow_all = length(condition.values.allowed_values) == 0 && length(condition.values.allowed_values) == 0 ? "TRUE" : ""
      deny_all  = ""
      condition = [condition.condition]
      values = length(condition.values.allowed_values) > 0 || length(condition.values.allowed_values) > 0 ? [{
        allowed_values = length(condition.values.allowed_values) > 0 ? condition.values.allowed_values : null
        denied_values  = length(condition.values.denied_values) > 0 ? condition.values.denied_values : null
      }] : []
  }]

  denied_condition_rule_list = [
    for k, condition in var.denied_conditions : {
      allow_all = length(condition.values.allowed_values) == 0 && length(condition.values.allowed_values) == 0 ? "TRUE" : ""
      deny_all  = ""
      condition = [condition.condition]
      values = length(condition.values.allowed_values) > 0 || length(condition.values.allowed_values) > 0 ? [{
        allowed_values = length(condition.values.allowed_values) > 0 ? condition.values.allowed_values : null
        denied_values  = length(condition.values.denied_values) > 0 ? condition.values.denied_values : null
      }] : []
  }]

  rule_values = (length(var.allowed_values) > 0 || length(var.denied_values) > 0) ? {
    allow_all = ""
    deny_all  = ""
    condition = []
    values = [{
      allowed_values = length(var.allowed_values) > 0 ? var.allowed_values : null
      denied_values  = length(var.denied_values) > 0 ? var.denied_values : null
    }]
  } : null

  rule_allow = (length(var.allowed_values) == 0 && length(var.denied_values) == 0 && length(var.allowed_conditions) == 0 && length(var.denied_conditions) == 0) ? {
    allow_all = var.scope != "organization" ? "TRUE" : ""
    deny_all  = var.scope == "organization" ? "TRUE" : ""
    condition = []
    values    = []
  } : null


  all_rules = flatten([local.allowed_condition_rule_list,
    local.denied_condition_rule_list,
    local.rule_values,
  local.rule_allow])

  policy_spec = {
    name          = var.name
    resource_list = var.ids
    resource_type = var.scope
    rules         = local.all_rules
  }
}




resource "google_org_policy_policy" "list_policy" {
  for_each = toset(local.policy_spec.resource_list)
  name     = local.policy_spec.resource_type == "organization" ? "organizations/${each.value}/${local.policy_spec.name}" : (local.policy_spec.resource_type == "folder" ? "folders/${each.value}/${local.policy_spec.name}" : "projects/${each.value}/${local.policy_spec.name}")
  parent   = local.policy_spec.resource_type == "organization" ? "organizations/${each.value}" : (local.policy_spec.resource_type == "folder" ? "folders/${each.value}" : "projects/${each.value}")

  spec {
    dynamic "rules" {

      for_each = [for rules in local.policy_spec.rules : rules if rules != null]
      iterator = rules

      content {

        allow_all = (rules.value.allow_all != "") ? rules.value.allow_all : null
        deny_all  = (rules.value.deny_all != "") ? rules.value.deny_all : null
        dynamic "condition" {
          for_each = [for condition in rules.value.condition : condition if condition != null]
          iterator = condition
          content {
            description = condition.value.description
            expression  = condition.value.expression
            title       = condition.value.title
          }
        }

        dynamic "values" {
          for_each = [for values in rules.value.values : values if values != null]
          iterator = values
          content {
            allowed_values = values.value.allowed_values
            denied_values  = values.value.denied_values
          }
        }
      }
    }
  }
}


