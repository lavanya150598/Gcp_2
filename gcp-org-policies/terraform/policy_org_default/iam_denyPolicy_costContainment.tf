variable "iam_denyPolicy_costContainment_name" {
  type    = string
  default = "cloudresourcemanager.googleapis.com"
}

variable "iam_denyPolicy_costContainment_scope" {
  type    = string
  default = "organization"
}

variable "iam_denyPolicy_costContainment_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_denyPolicy_costContainment_rules" {
  type = list(object({
    rule = object({
      description                 = string
      denied_principals           = list(string)
      denied_permissions          = list(string)
      exception_principals        = list(string)
      denied_condition_expression = string
    })
  }))
  default = []
}

module "iam_denyPolicy_costContainment" {
  source     = "../module/deny_policy"
  policy_id  = "iam-denyPolicy-costContainment"
  name       = var.iam_denyPolicy_costContainment_name
  scope      = var.iam_denyPolicy_costContainment_scope
  ids        = var.iam_denyPolicy_costContainment_ids
  deny_rules = var.iam_denyPolicy_costContainment_rules
}

