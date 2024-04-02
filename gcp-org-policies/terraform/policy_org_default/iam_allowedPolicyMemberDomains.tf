variable "iam_allowedPolicyMemberDomains_name" {
  type    = string
  default = "policies/iam.allowedPolicyMemberDomains"
}

variable "iam_allowedPolicyMemberDomains_scope" {
  type    = string
  default = "organization"
}

variable "iam_allowedPolicyMemberDomains_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_allowedPolicyMemberDomains_allowed_values" {
  type    = list(string)
  default = []
}

variable "iam_allowedPolicyMemberDomains_denied_values" {
  type    = list(string)
  default = []
}

variable "iam_allowedPolicyMemberDomains_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
    values = object({
      allowed_values = list(string)
      denied_values  = list(string)
    })
  }))
  default = []
}

variable "iam_allowedPolicyMemberDomains_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
    values = object({
      allowed_values = list(string)
      denied_values  = list(string)
    })
  }))
  default = []
}

module "iam_allowedPolicyMemberDomains" {
  source             = "../module/list_policy"
  name               = var.iam_allowedPolicyMemberDomains_name
  scope              = var.iam_allowedPolicyMemberDomains_scope
  ids                = var.iam_allowedPolicyMemberDomains_scope == "organization" ? [var.organization_id] : var.iam_allowedPolicyMemberDomains_ids
  allowed_values     = var.iam_allowedPolicyMemberDomains_allowed_values
  denied_values      = var.iam_allowedPolicyMemberDomains_denied_values
  allowed_conditions = var.iam_allowedPolicyMemberDomains_allowed_conditions
  denied_conditions  = var.iam_allowedPolicyMemberDomains_denied_conditions
}

