variable "iam_allowServiceAccountCredentialLifetimeExtension_name" {
  type    = string
  default = "policies/iam.allowServiceAccountCredentialLifetimeExtension"
}

variable "iam_allowServiceAccountCredentialLifetimeExtension_scope" {
  type    = string
  default = "organization"
}

variable "iam_allowServiceAccountCredentialLifetimeExtension_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "iam_allowServiceAccountCredentialLifetimeExtension_allowed_values" {
  type    = list(string)
  default = []
}

variable "iam_allowServiceAccountCredentialLifetimeExtension_denied_values" {
  type    = list(string)
  default = []
}

variable "iam_allowServiceAccountCredentialLifetimeExtension_allowed_conditions" {
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

variable "iam_allowServiceAccountCredentialLifetimeExtension_denied_conditions" {
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

module "iam_allowServiceAccountCredentialLifetimeExtension" {
  source             = "../module/list_policy"
  name               = var.iam_allowServiceAccountCredentialLifetimeExtension_name
  scope              = var.iam_allowServiceAccountCredentialLifetimeExtension_scope
  ids                = var.iam_allowServiceAccountCredentialLifetimeExtension_scope == "organization" ? [var.organization_id] : var.iam_allowServiceAccountCredentialLifetimeExtension_ids
  allowed_values     = var.iam_allowServiceAccountCredentialLifetimeExtension_allowed_values
  denied_values      = var.iam_allowServiceAccountCredentialLifetimeExtension_denied_values
  allowed_conditions = var.iam_allowServiceAccountCredentialLifetimeExtension_allowed_conditions
  denied_conditions  = var.iam_allowServiceAccountCredentialLifetimeExtension_denied_conditions
}
