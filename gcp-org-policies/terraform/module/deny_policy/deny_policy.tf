locals {

  policy_spec = {
    name          = var.name
    resource_list = var.ids
    resource_type = var.scope
    rules         = var.deny_rules
  }
}

resource "google_iam_deny_policy" "iam_deny_policy" {
  provider     = google-beta
  for_each     = toset(local.policy_spec.resource_list)
  name         = lower("${var.policy_id}-${var.scope}-${each.value}")
  parent       = local.policy_spec.resource_type == "organization" ? urlencode("${local.policy_spec.name}/organizations/${each.value}") : (var.scope == "folder" ? urlencode("${local.policy_spec.name}/folders/${each.value}") : urlencode("${local.policy_spec.name}/projects/${each.value}"))
  display_name = "${var.policy_id}_${var.scope}_${each.value}"

  dynamic "rules" {

    for_each = [for rules in local.policy_spec.rules : rules if rules != null]
    iterator = rules

    content {
      description = rules.value.rule.description

      deny_rule {
        denied_principals = rules.value.rule.denied_principals

        dynamic "denial_condition" {
          for_each = rules.value.rule.denied_condition_expression != null || rules.value.rule.denied_condition_expression != "" ? [rules.value.rule.denied_condition_expression] : null
          iterator = denied_condition

          content {
            expression = denied_condition.value
          }
        }

        denied_permissions   = rules.value.rule.denied_permissions
        exception_principals = rules.value.rule.exception_principals

      }

    }
  }

}