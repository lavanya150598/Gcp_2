variable "compute_disableSerialPortAccess_name" {
  type    = string
  default = "policies/compute.disableSerialPortAccess"
}

variable "compute_disableSerialPortAccess_allowed_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

variable "compute_disableSerialPortAccess_denied_conditions" {
  type = list(object({
    condition = object({
      description = string
      expression  = string
      title       = string
    })
  }))
  default = []
}

module "compute_disableSerialPortAccess" {
  source             = "../module/binary_policy"
  name               = var.compute_disableSerialPortAccess_name
  scope              = "organization"
  ids                = [var.organization_id]
  enforce_policy_ind = true
  allowed_conditions = var.compute_disableSerialPortAccess_allowed_conditions
  denied_conditions  = var.compute_disableSerialPortAccess_denied_conditions
}