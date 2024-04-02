variable "iam_serviceAccountKeyExpiryHours_name" {
  type    = string
  default = "policies/iam.serviceAccountKeyExpiryHours"
}

variable "iam_serviceAccountKeyExpiryHours_scope" {
  type    = string
  default = "organization"
}

variable "iam_serviceAccountKeyExpiryHours_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_serviceAccountKeyExpiryHours_allowed_values" {
  type    = list(string)
  default = []
}

variable "iam_serviceAccountKeyExpiryHours_denied_values" {
  type    = list(string)
  default = []
}

variable "iam_serviceAccountKeyExpiryHours_allowed_conditions" {
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

variable "iam_serviceAccountKeyExpiryHours_denied_conditions" {
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

module "iam_serviceAccountKeyExpiryHours" {
  source             = "../module/list_policy"
  name               = var.iam_serviceAccountKeyExpiryHours_name
  scope              = var.iam_serviceAccountKeyExpiryHours_scope
  ids                = var.iam_serviceAccountKeyExpiryHours_scope == "organization" ? [var.organization_id] : var.iam_serviceAccountKeyExpiryHours_ids
  allowed_values     = var.iam_serviceAccountKeyExpiryHours_allowed_values
  denied_values      = var.iam_serviceAccountKeyExpiryHours_denied_values
  allowed_conditions = var.iam_serviceAccountKeyExpiryHours_allowed_conditions
  denied_conditions  = var.iam_serviceAccountKeyExpiryHours_denied_conditions
}

