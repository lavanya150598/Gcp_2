variable "cloudfunctions_allowedIngressSettings_name" {
  type    = string
  default = "policies/cloudfunctions.allowedIngressSettings"
}

variable "cloudfunctions_allowedIngressSettings_scope" {
  type    = string
  default = "organization"
}

variable "cloudfunctions_allowedIngressSettings_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "cloudfunctions_allowedIngressSettings_allowed_values" {
  type    = list(string)
  default = []
}

variable "cloudfunctions_allowedIngressSettings_denied_values" {
  type    = list(string)
  default = []
}

variable "cloudfunctions_allowedIngressSettings_allowed_conditions" {
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

variable "cloudfunctions_allowedIngressSettings_denied_conditions" {
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

module "cloudfunctions_allowedIngressSettings" {
  source             = "../module/list_policy"
  name               = var.cloudfunctions_allowedIngressSettings_name
  scope              = var.cloudfunctions_allowedIngressSettings_scope
  ids                = var.cloudfunctions_allowedIngressSettings_scope == "organization" ? [var.organization_id] : var.cloudfunctions_allowedIngressSettings_ids
  allowed_values     = var.cloudfunctions_allowedIngressSettings_allowed_values
  denied_values      = var.cloudfunctions_allowedIngressSettings_denied_values
  allowed_conditions = var.cloudfunctions_allowedIngressSettings_allowed_conditions
  denied_conditions  = var.cloudfunctions_allowedIngressSettings_denied_conditions
}

