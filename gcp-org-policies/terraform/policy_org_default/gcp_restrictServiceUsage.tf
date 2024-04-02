variable "gcp_restrictServiceUsage_name" {
  type    = string
  default = "policies/gcp.restrictServiceUsage"
}

variable "gcp_restrictServiceUsage_scope" {
  type    = string
  default = "organization"
}

variable "gcp_restrictServiceUsage_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "gcp_restrictServiceUsage_allowed_values" {
  type    = list(string)
  default = []
}

variable "gcp_restrictServiceUsage_denied_values" {
  type    = list(string)
  default = []
}

variable "gcp_restrictServiceUsage_allowed_conditions" {
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

variable "gcp_restrictServiceUsage_denied_conditions" {
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

module "gcp_restrictServiceUsage" {
  source             = "../module/list_policy"
  name               = var.gcp_restrictServiceUsage_name
  scope              = var.gcp_restrictServiceUsage_scope
  ids                = var.gcp_restrictServiceUsage_scope == "organization" ? [var.organization_id] : var.gcp_restrictServiceUsage_ids
  allowed_values     = var.gcp_restrictServiceUsage_allowed_values
  denied_values      = var.gcp_restrictServiceUsage_denied_values
  allowed_conditions = var.gcp_restrictServiceUsage_allowed_conditions
  denied_conditions  = var.gcp_restrictServiceUsage_denied_conditions
}

