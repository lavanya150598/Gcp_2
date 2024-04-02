variable "compute_vmExternalIpAccess_name" {
  type    = string
  default = "policies/compute.vmExternalIpAccess"
}

variable "compute_vmExternalIpAccess_scope" {
  type    = string
  default = "organization"
}

variable "compute_vmExternalIpAccess_ids" {
  type    = list(string)
  default = ["637987714668"]
}

variable "compute_vmExternalIpAccess_allowed_values" {
  type    = list(string)
  default = []
}

variable "compute_vmExternalIpAccess_denied_values" {
  type    = list(string)
  default = []
}

variable "compute_vmExternalIpAccess_allowed_conditions" {
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

variable "compute_vmExternalIpAccess_denied_conditions" {
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

module "compute_vmExternalIpAccess" {
  source             = "../module/list_policy"
  name               = var.compute_vmExternalIpAccess_name
  scope              = var.compute_vmExternalIpAccess_scope
  ids                = var.compute_vmExternalIpAccess_scope == "organization" ? [var.organization_id] : var.compute_vmExternalIpAccess_ids
  allowed_values     = var.compute_vmExternalIpAccess_allowed_values
  denied_values      = var.compute_vmExternalIpAccess_denied_values
  allowed_conditions = var.compute_vmExternalIpAccess_allowed_conditions
  denied_conditions  = var.compute_vmExternalIpAccess_denied_conditions
}

